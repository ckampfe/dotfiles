// https://lihaoyi.github.io/Ammonite/#Ammonite-Shell
load.ivy("com.lihaoyi" %% "ammonite-shell" % ammonite.Constants.version)

// https://lihaoyi.github.io/scalatags/
load.ivy("com.lihaoyi" %% "scalatags" % "0.5.3")

// http://http4s.org/
load.ivy("org.http4s" %% "http4s-blaze-client" % "0.11.3")

// https://github.com/tototoshi/scala-csv
load.ivy("com.github.tototoshi" %% "scala-csv" % "1.2.2")

// https://github.com/travisbrown/circe
load.ivy("io.circe" %% "circe-core" % "0.2.1")
load.ivy("io.circe" %% "circe-generic" % "0.2.1")
load.ivy("io.circe" %% "circe-parse" % "0.2.1")
@
val shellSession = ammonite.shell.ShellSession()
import shellSession._
import ammonite.shell.PPrints._
import ammonite.ops._
import ammonite.shell._
ammonite.shell.Configure(repl, wd)

repl.prompt.bind(s"[${wd.toString}]@ ")
