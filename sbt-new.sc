#!/usr/bin/env amm

import ammonite.ops._

@main
def main(projectName: String = "", path: Path = cwd) = {
  if(projectName.isEmpty) {
    println("Usage: ./sbt-new.sc project_name")
    System.exit(1)
  }

  val projectDir = cwd/projectName
  val sbtPlugins = Seq(
    """addSbtPlugin("com.eed3si9n" % "sbt-assembly" % "0.14.6")"""
  )

  makeDirs(projectDir)
  addSbtVersion(projectDir)
  addSbtPlugins(projectDir, sbtPlugins)
  addBuildDotSbt(projectDir, projectName)
  addMainClass(projectDir, projectName)
}

def makeDirs(projectDir: Path) = {
  mkdir!(projectDir/'src/'main/'scala)
  mkdir!(projectDir/'src/'main/'scala/projectDir.name)
  mkdir!(projectDir/'src/'main/'resources)
  mkdir!(projectDir/'src/'test/'scala)
  mkdir!(projectDir/'src/'test/'resources)
  mkdir!(projectDir/'lib)
  mkdir!(projectDir/'project)
  mkdir!(projectDir/'target)
}

def addSbtVersion(projectDir: Path) =
  write(projectDir/'project/"build.properties", "sbt.version=1.1.6")

def addSbtPlugins(projectDir: Path, sbtPlugins: Seq[String]) =
  write(projectDir/'project/"plugins.sbt", sbtPlugins.mkString("\n"))

def addBuildDotSbt(projectDir: Path, projectName: String) =
  write(
    projectDir/"build.sbt",
    s"""name := "$projectName"
    |
    |version := "0.0.1"
    |
    |scalaVersion := "2.12.6"
    |
    |libraryDependencies ++= Seq(
    |  "com.lihaoyi"   %% "ammonite-ops"  % "1.1.2",
    |  "org.typelevel" %% "cats-core"     % "1.1.0",
    |  "org.typelevel" %% "cats-effect"   % "1.0.0-RC2",
    |  "io.circe"      %% "circe-core"    % "0.10.0-M1",
    |  "io.circe"      %% "circe-generic" % "0.10.0-M1",
    |  "io.circe"      %% "circe-parser"  % "0.10.0-M1"
    |)
    |
    |import scala.sys.process._
    |
    |lazy val nativeImage = taskKey[Unit]("Build a native image with GraalVM")
    |
    |nativeImage := {
    |  s"native-image -jar target/scala-2.12/${projectName}-assembly-" + version.value + ".jar -H:Name=${projectName}-" + version.value !
    |}
    |
    |scalacOptions ++= Seq(
    |  "-deprecation",
    |  "-encoding", "UTF-8",
    |  "-feature",
    |  "-language:existentials",
    |  "-language:higherKinds",
    |  "-language:implicitConversions",
    |  "-unchecked",
    |  "-Xfatal-warnings",
    |  "-Xfuture",
    |  "-Xlint",
    |  "-Yno-adapted-args",
    |  "-Ywarn-dead-code",
    |  "-Ywarn-numeric-widen",
    |  "-Ywarn-value-discard",
    |  "-Ywarn-unused-import"
    |)""".stripMargin
  )

def addMainClass(projectDir: Path, projectName: String) =
  write(
    projectDir/'src/'main/'scala/projectName/s"${projectName}.scala",
    s"""object ${projectName} {
    |  def main(args: Array[String]) = {
    |    println("Hello, world!")
    |  }
    |}""".stripMargin
  )
