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
    """addSbtPlugin("com.eed3si9n" % "sbt-assembly" % "0.14.3")"""
  )

  makeDirs(projectDir)
  addSbtVersion(projectDir)
  addSbtPlugins(projectDir, sbtPlugins)
  addBuildDotSbt(projectDir, projectName)
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
  write(projectDir/'project/"build.properties", "sbt.version=0.13.13")

def addSbtPlugins(projectDir: Path, sbtPlugins: Seq[String]) =
  write(projectDir/'project/"plugins.sbt", sbtPlugins.mkString("\n"))

def addBuildDotSbt(projectDir: Path, projectName: String) =
  write(
    projectDir/"build.sbt",
    s"""name := "$projectName"
    |
    |version := "0.0.1"
    |
    |scalaVersion := "2.12.1"
    |
    |libraryDependencies ++= Seq(
    |  "com.lihaoyi" %% "ammonite-ops" % "0.8.2",
    |  "org.typelevel" %% "cats" % "0.9.0"
    |)
    |
    |scalacOptions ++= Seq(
    |  "-deprecation",
    |  "-encoding", "UTF-8", // yes, this is 2 args
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
    |  "-Ywarn-unused-import" // 2.11 only
    |)""".stripMargin
  )
