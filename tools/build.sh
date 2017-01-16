#!/bin/sh

builder="/Applications/Unity/Unity.app/Contents/MacOS/Unity"
logfile="unity.log"

build() {
  project=$1
  target=$2
  echo "Build project:$project for target:$target ..."
  option=$3
  $builder -batchmode -nographics -silent-crashes \
    -projectPath $(pwd) \
    -logFile $(pwd)/$logfile \
    -$option "$(pwd)/bin/$target/$project.sh" \
    -quit
  echo "Create artefact "$project"_"$target".zip ..."
  cd "$(pwd)/bin/$target" ; zip -r "../"$project"_"$target".zip" . ; cd -
}

build $1 $2 $3

echo 'Build log:'
cat $(pwd)/unity.log

