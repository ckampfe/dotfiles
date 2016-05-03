#!/bin/sh

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 script_name" >&2
  exit 1
fi

script_name=$1

echo "#!/usr/local/bin/scalas

/***
scalaVersion := \"2.11.8\"
libraryDependencies ++= Seq(
  \"com.lihaoyi\" %% \"ammonite-ops\" % \"0.5.7\"
)
*/

!#

" > $script_name
chmod +ux $script_name
