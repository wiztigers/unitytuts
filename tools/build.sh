#!/bin/sh

builder="/Applications/Unity/Unity.app/Contents/MacOS/Unity"
logfile="unity.log"

build() {
  project=$1
  target=$2
  echo -n "Build project:$project for target:$target ..."
  if [ "$target" == "Linux" ]; then
    option="buildLinuxUniversalPlayer"
  fi
  if [ "$target" == "Windows" ]; then
    option="buildWindowsPlayer"
  fi
  $builder -batchmode -nographics -silent-crashes \
    -projectPath $(pwd) \
    -logFile $(pwd)/$logfile \
    -$option "$(pwd)/bin/$target/$project.sh" \
    -quit
  cd "bin/$target" ; zip -r "../$project_$target.zip" . ; cd -
}

build $1 $2

echo 'Build log:'
cat $(pwd)/unity.log

