package sbt_new

import java.nio.file.{Path, Paths, Files}

object SbtNew {
  def main(args: Array[String]): Unit = {
    val projectName = args.lift(0).getOrElse("")

    if(projectName.isEmpty) {
      println("Usage: ./sbt-new.sc project_name")
      System.exit(1)
    }

    val projectDir = Paths.get(projectName).toAbsolutePath
    println(projectDir.toString)
    val sbtPlugins = Seq(
      """addSbtPlugin("com.eed3si9n" % "sbt-assembly" % "0.14.5")"""
    )

    makeDirs(projectDir, projectName)
    addSbtVersion(projectDir)
    addSbtPlugins(projectDir, sbtPlugins)
    addBuildDotSbt(projectDir, projectName)
    ()
  }

  def makeDirs(projectDir: Path, packageName: String) = {
    val projectSymbol = Symbol(projectDir.toString)
    mkdir(projectSymbol, 'src, 'main, 'scala, Symbol(packageName))
    mkdir(projectSymbol, 'src, 'main, 'resources)
    mkdir(projectSymbol, 'src, 'test, 'scala)
    mkdir(projectSymbol, 'src, 'test, 'resources)
    mkdir(projectSymbol, 'lib)
    mkdir(projectSymbol, 'project)
    mkdir(projectSymbol, 'target)
  }

  def mkdir(paths: Symbol*) = {
    val dir = Files.createDirectories(
      Paths.get(paths.map(_.name).mkString("/"))
    )
    println("made dir: " + dir)
    ()
  }

  def addSbtVersion(projectDir: Path) =
    Files.write(
      Paths.get(s"${projectDir}/project/build.properties"),
      "sbt.version=0.13.15".getBytes
    )

  def addSbtPlugins(projectDir: Path, sbtPlugins: Seq[String]) =
    Files.write(
      Paths.get(
        s"${projectDir}/project/plugins.sbt"),
      sbtPlugins.mkString("\n").getBytes
    )

  def addBuildDotSbt(projectDir: Path, projectName: String) =
    Files.write(
      Paths.get(s"${projectDir}/build.sbt"),
      s"""name := "$projectName"
      |
      |version := "0.0.1"
      |
      |scalaVersion := "2.12.2"
      |
      |libraryDependencies ++= Seq(
      |  "com.lihaoyi"   %% "ammonite-ops"  % "0.8.2",
      |  "org.typelevel" %% "cats"          % "0.9.0",
      |  "io.circe"      %% "circe-core"    % "0.7.0",
      |  "io.circe"      %% "circe-generic" % "0.7.0",
      |  "io.circe"      %% "circe-parser"  % "0.7.0"
      |)
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
      |)""".stripMargin.getBytes
    )
}
