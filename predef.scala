/* IVY */

// https://lihaoyi.github.io/Ammonite/#Ammonite-Shell
load.ivy("com.lihaoyi" %% "ammonite-shell" % ammonite.Constants.version)

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
  val location =
    (dotfiles.location)/"predef.scala"
  def edit = %nvim(location)
  def cat  = %%cat(location)
  def view = %cat(location)
}

object dotfiles {
  val location = home/'code/'personal/'dotfiles
}

def brew = {
  %brew("update")
  %brew("upgrade")
}

object git {
  def status = %git("status")
  def diff   = %git("diff")
  def commit = %git("commit", "-v")
  def remote = %git("remote", "-v")
}

def gs = git.status
def gd = git.diff

// sudo powers
def htop = %sudo("htop")

object youtube {
  def dl(url: String) = %`youtube-dl`("-x", url)
}

object imports {
  def scalaTags() =
    repl.load("""
      // https://lihaoyi.github.io/scalatags/
      load.ivy("com.lihaoyi" %% "scalatags" % "0.5.4")
      @
      import scalatags.Text.all._
    """)

  def kantan() =
    repl.load("""
      // https://github.com/nrinaudo/kantan.csv
      val kantanCsvVersion = "0.1.8"
      load.ivy("com.nrinaudo" %% "kantan.csv" % kantanCsvVersion)
      load.ivy("com.nrinaudo" %% "kantan.csv-cats" % kantanCsvVersion)
      load.ivy("com.nrinaudo" %% "kantan.csv-generic" % kantanCsvVersion)
      load.ivy("com.nrinaudo" %% "kantan.csv-jackson" % kantanCsvVersion)
      @
      import java.io.File
      import kantan.csv._
      import kantan.csv.ops._
      import kantan.csv.generic.codecs._
    """)

  def circe() =
    repl.load("""
      // https://github.com/travisbrown/circe
      val circeVersion = "0.3.0"
      load.ivy("io.circe" %% "circe-core" % circeVersion)
      load.ivy("io.circe" %% "circe-generic" % circeVersion)
      load.ivy("io.circe" %% "circe-parser" % circeVersion)
      @
      import io.circe._
      import io.circe.generic.auto._
      import io.circe.parser._
      import io.circe.syntax._
    """)

  def http4s() =
    repl.load("""
      // http://http4s.org/
      load.ivy("org.http4s" %% "http4s-blaze-client" % "0.11.3")
      @
      import org.http4s.Http4s._
    """)

  // https://github.com/non/cats
  // load.ivy("org.typelevel" %% "cats" % "0.4.1")
}

def linesOfIn(what: String, where: Path = wd) =
  (ls.rec!(wd))
    .filter(_.isFile)
    .filter(file => file.ext == what)
    .map(file => (file.name, (read.lines(wd/(file.name)).size)))

repl.prompt.bind(
  s"""[${wd.toString}]
clark@ """)
