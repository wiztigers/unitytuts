#!/bin/sh

builder="/Applications/Unity/Unity.app/Contents/MacOS/Unity"
logfile="unity.log"

build() {
  project="$1"
  pushd "$project"
  target=$2
  option=$3
  echo "Build project:$project for target:$target ..."
  $builder -batchmode -nographics -silent-crashes \
    -projectPath "$(pwd)" \
    -logFile "$logfile" \
    -$option "bin/$target/$project.sh" \
    -quit
  echo "Create artefact \"$project-$target.zip\" ..."
  pushd bin/$target && zip -r "../$project-$target.zip" . && popd

  echo "Unity build log \"$logfile\":"
  cat $logfile

  popd
}

build $1 $2 $3

