#!/usr/bin/env amm

import java.io.File
import $ivy.`com.lihaoyi::ammonite-ops:0.7.0`, ammonite.ops._

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

val dotfileGroups = Vector[DotfileGroup](
  DotfileGroup(
    name = "~",
    Vector(
      Dotfile(".spacemacs"),
      Dotfile(".tmux.conf"),
      Dotfile(".zshrc")
    ),
    root/'Users/'clarkkampfe
  ),
  DotfileGroup(
    name = ".config",
    Vector(
      Dotfile(
        name = "init.vim",
        subpath = Some(RelPath("nvim")))
    ),
    root/'Users/'clarkkampfe/".config"
  ),
  DotfileGroup(
    name = "usr/local/bin",
    Vector(
      Dotfile("ammonite-repl-0.7.0", linkname = Some("amm")),
      Dotfile("clj-new-script"),
      Dotfile("sbt-new"),
      Dotfile("sbt-new-script")
    ),
    root/'usr/'local/'bin
  )
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

linkPairs.foreach { case (source, target) =>
  ln.s(source, target)
  println(s"linked $source to $target")
}
