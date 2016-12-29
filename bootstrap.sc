#!/usr/bin/env amm

import java.io.File
import java.nio.file.FileAlreadyExistsException
import scala.util.{Try,Success,Failure}
import $ivy.`com.lihaoyi::ammonite-ops:0.8.1`, ammonite.ops._

case class Dotfile(
  name: String,
  subpath: Option[RelPath] = None,
  linkName: Option[String] = None
)

case class DotfileGroup(
  name: String,
  files: Vector[Dotfile],
  targetDir: Path
)

val tilde = DotfileGroup(
  name = "~",
  files = Vector(
    Dotfile(".spacemacs"),
    Dotfile(".tmux.conf"),
    Dotfile(".zshrc"),
    Dotfile(".hyper.js"),
    Dotfile(".ideavimrc")
  ),
  targetDir = home
)

val dotConfig = DotfileGroup(
  name = ".config",
  files = Vector(
    Dotfile(
      name = "init.vim",
      subpath = Some(RelPath("nvim")))
  ),
  targetDir = home / ".config"
)

val usrLocalBin = DotfileGroup(
  name = "usr/local/bin",
  files = Vector(
    Dotfile("clj-new-script"),
    Dotfile("sbt-new.sc", linkName = Some("sbt-new")),
    Dotfile("sbt-new-script")
  ),
  targetDir = root / 'usr / 'local / 'bin
)

val dotfileGroups = Vector(
  tilde,
  dotConfig,
  usrLocalBin
)

val dotfilesSourcePath = home / 'code / 'dotfiles

val linkPairs = for {
  dotfileGroup <- dotfileGroups
  file <- dotfileGroup.files
  fullTargetPath =
    dotfileGroup.targetDir                          // the top level target directory
    ./(file.subpath.getOrElse(empty))               // if there is an optional subpath, use it
    ./(RelPath(file.linkName.getOrElse(file.name))) // if there is an optional linkName, use it
  fullSourcePath = dotfilesSourcePath / file.name
} yield (fullSourcePath, fullTargetPath)

/*
mkdir -p ~/.vim/{ftdetect,indent,syntax} && for d in ftdetect indent syntax ; do wget -O ~/.config/.nvim/$d/scala.vim https://raw.githubusercontent.com/derekwyatt/vim-scala/master/$d/scala.vim; done
 */

/*
 make /usr/local/bin files executable
 with `chmod +x`
 */
usrLocalBin.files.map { file ⇒
  val fullSourcePath = dotfilesSourcePath / file.name
  Try {
    %%.chmod("+x", fullSourcePath)(cwd)
  } match {
    case Success(s) ⇒ s"made $fullSourcePath executable"
    case Failure(e: ShelloutException) ⇒ e
  }
}.foreach(println)

/*
symlink files
 */

linkPairs.map { case (source, target) ⇒
  Try(ln.s(source, target)) match {
    case Success(s) ⇒ s"linked $source to $target"
    case Failure(e: FileAlreadyExistsException) ⇒ e
  }
}.foreach(println)

