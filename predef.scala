/* IVY */

// https://lihaoyi.github.io/Ammonite/#Ammonite-Shell
load.ivy("com.lihaoyi" %% "ammonite-shell" % ammonite.Constants.version)

// https://lihaoyi.github.io/scalatags/
load.ivy("com.lihaoyi" %% "scalatags" % "0.5.3")

// http://http4s.org/
load.ivy("org.http4s" %% "http4s-blaze-client" % "0.11.3")

// https://github.com/tototoshi/scala-csv
load.ivy("com.github.tototoshi" %% "scala-csv" % "1.2.2")

// https://github.com/nrinaudo/tabulate
val tabulateVersion = "0.1.7"
load.ivy("com.nrinaudo" %% "tabulate" % tabulateVersion)
load.ivy("com.nrinaudo" %% "tabulate-cats" % tabulateVersion)
load.ivy("com.nrinaudo" %% "tabulate-generic" % tabulateVersion)
load.ivy("com.nrinaudo" %% "tabulate-jackson" % tabulateVersion)

// https://github.com/travisbrown/circe
val circeVersion = "0.2.1"
load.ivy("io.circe" %% "circe-core" % circeVersion)
load.ivy("io.circe" %% "circe-generic" % circeVersion)
load.ivy("io.circe" %% "circe-parse" % circeVersion)

// https://github.com/non/cats
load.ivy("org.spire-math" %% "cats" % "0.3.0")

@

/* AMMONITE */

val shellSession = ammonite.shell.ShellSession()
import shellSession._
import ammonite.shell.PPrints._
import ammonite.ops._
import ammonite.shell._
ammonite.shell.Configure(repl, wd)

/* UTILITIES */

// imports
import scala.math._

// general
object predef {
  val predefLocation =
    root/'Users/'clark/'code/'personal/'dotfiles/"predef.scala"
  def edit = %nvim(predefLocation)
  def cat  = %cat(predefLocation)
  def view = cat
}

def brew = {
  %brew("update")
  %brew("upgrade")
}

object git {
  def status = %git("status")
  def diff   = %git("diff")
  def commit = %git("commit", "-v")
}

def gs = git.status
def gd = git.diff

repl.prompt.bind(s"[${wd.toString}]@ ")
