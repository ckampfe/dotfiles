#!/bin/sh

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 project_name" >&2
  exit 1
fi

project_name=$1

mkdir -p $project_name/src/{main,test}/{resources,scala}
mkdir $project_name/{lib,project,target}

# create `project/build.properties' with a pinned sbt version
echo "sbt.version=0.13.12" > $project_name/project/build.properties

# add assembly
echo 'addSbtPlugin("com.eed3si9n" % "sbt-assembly" % "0.14.3")' > $project_name/project/plugins.sbt

# create an initial build.sbt file
echo "name         := \"$project_name\"

version      := \"0.0.1\"

scalaVersion := \"2.11.8\"

libraryDependencies ++= Seq(
  \"com.lihaoyi\" %% \"ammonite-ops\" % \"0.7.7\"
)\n" >> $project_name/build.sbt

echo "scalacOptions ++= Seq(
  \"-deprecation\",
  \"-encoding\", \"UTF-8\", // yes, this is 2 args
  \"-feature\",
  \"-language:existentials\",
  \"-language:higherKinds\",
  \"-language:implicitConversions\",
  \"-unchecked\",
  \"-Xfatal-warnings\",
  \"-Xfuture\",
  \"-Xlint\",
  \"-Yno-adapted-args\",
  \"-Ywarn-dead-code\",
  \"-Ywarn-numeric-widen\",
  \"-Ywarn-value-discard\",
  \"-Ywarn-unused-import\" // 2.11 only
)" >> $project_name/build.sbt

