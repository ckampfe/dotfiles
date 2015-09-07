// load.ivy("com.lihaoyi" %% "ammonite-shell" % ammonite.Constants.version)
// val session = ammonite.shell.ShellSession()
// import session._
// ammonite.shell.Configure(repl, wd)
import ammonite.ops._
import ammonite.ops.ImplicitWd._
repl.prompt.bind(s"[${cwd.toString}]@ ")

// @ import scala.math._

// @ load.ivy("com.lihaoyi" %% "scalatags" % "0.5.2")
// @ load.ivy("com.github.tototoshi" %% "scala-csv" % "1.2.2")
// @ load.ivy("org.json4s" %% "json4s-jackson" % "3.2.11")
// @ load.ivy("org.scalaj" %% "scalaj-http" % "1.1.5")
