/* IVY */

interp.load.ivy("com.lihaoyi" %% "ammonite-shell" % ammonite.Constants.version)

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
    (dotfiles.location)/"predef.sc"
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
  def commit = %git("commit", "-vS")
  def remote = %git("remote", "-v")
  def history = %git(
    "log",
    "--pretty=format:%h %ad  | %s%d [%an]'",
    "--graph",
    "--date=short"
  )
  def push(remote: String, branch: String) = %git("push", remote, branch)

  object push {
    def origin(branch: String) = push("origin", branch)
    def upstream(branch: String) = push("upstream", branch)
    def heroku(branch: String) = push("heroku", branch)
  }
}

def gs = git.status
def gd = git.diff
def gh = git.history

// sudo powers
def htop = %sudo("htop")

object youtube {
  def dl(url: String) = %`youtube-dl`("-x", url)
}

object imports {
  def scalaTags() =
    interp.load("""
      // https://lihaoyi.github.io/scalatags/
      interp.load.ivy("com.lihaoyi" %% "scalatags" % "0.6.0")
      @
      import scalatags.Text.all._
    """)

  def kantan() =
    interp.load("""
      // https://github.com/nrinaudo/kantan.csv
      val kantanCsvVersion = "0.1.13"
      interp.load.ivy("com.nrinaudo" %% "kantan.csv" % kantanCsvVersion)
      interp.load.ivy("com.nrinaudo" %% "kantan.csv-cats" % kantanCsvVersion)
      interp.load.ivy("com.nrinaudo" %% "kantan.csv-generic" % kantanCsvVersion)
      interp.load.ivy("com.nrinaudo" %% "kantan.csv-jackson" % kantanCsvVersion)
      @
      import java.io.File
      import kantan.csv._
      import kantan.csv.ops._
      import kantan.csv.generic._
    """)

  def circe() =
    interp.load("""
      // https://github.com/travisbrown/circe
      val circeVersion = "0.5.0-M2"
      interp.load.ivy("io.circe" %% "circe-core" % circeVersion)
      interp.load.ivy("io.circe" %% "circe-generic" % circeVersion)
      interp.load.ivy("io.circe" %% "circe-parser" % circeVersion)
      @
      import io.circe._
      import io.circe.generic.auto._
      import io.circe.parser._
      import io.circe.syntax._
    """)

  def http4s() =
    interp.load("""
      // http://http4s.org/
      interp.load.ivy("org.http4s" %% "http4s-blaze-client" % "0.14.2a")
      @
      import org.http4s.Http4s._
    """)

  def shapeless() =
    interp.load("""
      // https://github.com/milessabin/shapeless
      interp.load.ivy("com.chuusai" %% "shapeless" % "2.3.2")
      @
      import shapeless._
    """)

  def cats() =
    interp.load("""
      // https://github.com/non/cats
      interp.load.ivy("org.typelevel" %% "cats" % "0.6.1")
      @
      import cats._
      import cats.std.all._
      import cats.implicits._
    """)

  def fs2() =
    interp.load("""
    // https://github.com/functional-streams-for-scala/fs2
    interp.load.ivy("co.fs2" %% "fs2-core" % "0.9.0-RC1")
    interp.load.ivy("co.fs2" %% "fs2-io" % "0.9.0-RC1")
    @
    import fs2.{io, text, Task}
    """)
}

def linesOfIn(what: String, where: Path = wd) =
  (ls.rec!(where))
    .filter(_.isFile)
    .filter(file => file.ext == what)
    .map(file => (file.name, (read.lines(file).size)))

    repl.prompt.bind( s"""[${wd.toString}]\nclark@> """)
