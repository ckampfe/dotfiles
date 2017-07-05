/* IVY */

interp.load.ivy(
  "com.lihaoyi" %
  s"ammonite-shell_${scala.util.Properties.versionNumberString}" %
  ammonite.Constants.version
)

@

/* AMMONITE */

val shellSession = ammonite.shell.ShellSession()
import shellSession._
// import ammonite.shell.PPrints._
import ammonite.ops._
import ammonite.shell._
ammonite.shell.Configure(interp, repl, wd)

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

object brew {
  def apply() = {
    update()
    upgrade()
  }

  def update() = %brew("update")
  def upgrade() = %brew("upgrade")
  def install(lib: String) = %brew("install", lib)

  object cask {
    def install(lib: String) = %brew("cask", "install", lib)
  }
}

object git {
  def clone(url: String) = %git("clone", url)
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
    // https://lihaoyi.github.io/scalatags/
    interp.load.ivy("com.lihaoyi" %% "scalatags" % "0.6.5")

  def kantan() = {
    // https://github.com/nrinaudo/kantan.csv
    val kantanCsvVersion = "0.1.19"
    interp.load.ivy("com.nrinaudo" %% "kantan.csv" % kantanCsvVersion)
    interp.load.ivy("com.nrinaudo" %% "kantan.csv-cats" % kantanCsvVersion)
    interp.load.ivy("com.nrinaudo" %% "kantan.csv-generic" % kantanCsvVersion)
    interp.load.ivy("com.nrinaudo" %% "kantan.csv-jackson" % kantanCsvVersion)
  }

  def circe() = {
    // https://github.com/travisbrown/circe
    val circeVersion = "0.8.0"
    interp.load.ivy("io.circe" %% "circe-core" % circeVersion)
    interp.load.ivy("io.circe" %% "circe-generic" % circeVersion)
    interp.load.ivy("io.circe" %% "circe-parser" % circeVersion)
  }

  def http4s() =
    // http://http4s.org/
    interp.load.ivy("org.http4s" %% "http4s-blaze-client" % "0.17.0-M3")

  def shapeless() =
    // https://github.com/milessabin/shapeless
    interp.load.ivy("com.chuusai" %% "shapeless" % "2.3.2")

  def cats() =
    // https://github.com/typelevel/cats
    interp.load.ivy("org.typelevel" %% "cats" % "0.9.0")

  def monix() = {
    // https://github.com/monixio/monix
    interp.load.ivy("io.monix" %% "monix" % "2.3.0")
    interp.load.ivy("io.monix" %% "monix-cats" % "2.3.0")
  }

  def fs2() = {
    // https://github.com/functional-streams-for-scala/fs2
    interp.load.ivy("co.fs2" %% "fs2-core" % "0.9.7")
    interp.load.ivy("co.fs2" %% "fs2-io" % "0.9.7")
  }

  def fastparse() =
    // http://www.lihaoyi.com/fastparse/
    interp.load.ivy("com.lihaoyi" %% "fastparse" % "0.4.3")
}

def linesOfIn(extension: String, path: Path = wd) =
  filesLines(extension, path).foldLeft(0) { case (total, (_, n)) =>
    total + n
  }

def filesLines(extension: String, path: Path = wd) =
  (ls.rec!(path))
    .filter(_.isFile)
    .filter(file => file.ext == extension)
    .map(file => (file.name, (read.lines(file).size)))

repl.prompt.bind( s"""[${wd.toString}]\nclark@> """)
