#!/usr/bin/env amm

import java.io.File
import java.nio.file.FileAlreadyExistsException
import scala.util.{Try,Success,Failure}
import $ivy.`com.lihaoyi::ammonite-ops:0.7.7`, ammonite.ops._

case class Dotfile(
  name: String,
  subpath: Option[RelPath] = None,
  linkname: Option[String] = None
)

case class DotfileGroup(
  name: String,
  files: Vector[Dotfile],
  targetDir: Path
)

val tilde = DotfileGroup(
  name = "~",
  Vector(
    Dotfile(".spacemacs"),
    Dotfile(".tmux.conf"),
    Dotfile(".zshrc")
  ),
  root/'Users/'clarkkampfe
)

val dotConfig = DotfileGroup(
  name = ".config",
  Vector(
    Dotfile(
      name = "init.vim",
      subpath = Some(RelPath("nvim")))
  ),
  root/'Users/'clarkkampfe/".config"
)

val usrLocalBin = DotfileGroup(
  name = "usr/local/bin",
  Vector(
    Dotfile("clj-new-script"),
    Dotfile("sbt-new"),
    Dotfile("sbt-new-script")
  ),
  root/'usr/'local/'bin
)

val dotfileGroups = Vector(
  tilde,
  dotConfig,
  usrLocalBin
)

val dotfilesSourcePath = root / 'Users / 'clarkkampfe / 'code / 'personal / 'dotfiles

val linkPairs = for {
  dotfileGroup <- dotfileGroups
  file <- dotfileGroup.files
  fullTargetPath =
    dotfileGroup.targetDir                          // the top level target directory
    ./(file.subpath.getOrElse(empty))               // if there is an optional subpath, use it
    ./(RelPath(file.linkname.getOrElse(file.name))) // if there is an optional linkname, use it
  fullSourcePath = dotfilesSourcePath / file.name
} yield (fullSourcePath, fullTargetPath)

/*
mkdir -p ~/.vim/{ftdetect,indent,syntax} && for d in ftdetect indent syntax ; do wget -O ~/.vim/$d/scala.vim https://raw.githubusercontent.com/derekwyatt/vim-scala/master/$d/scala.vim; done
 */

/*
 make /usr/local/bin files executable
 with `chmod +x`
 */
usrLocalBin.files.map { file =>
  val fullSourcePath = dotfilesSourcePath / file.name
  Try {
    %%.chmod("+x", fullSourcePath)(cwd)
  } match {
    case Success(s) => s"made $fullSourcePath executable"
    case Failure(e: ShelloutException) => e
  }
}.foreach(println)

/*
symlink files
 */
linkPairs.map { case (source, target) =>
  Try(ln.s(source, target)) match {
    case Success(s) => s"linked $source to $target"
    case Failure(e: FileAlreadyExistsException) => e
  }
}.foreach(println)

