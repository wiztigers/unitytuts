#!/bin/sh

builder="/Applications/Unity/Unity.app/Contents/MacOS/Unity"
project="Roll-a-ball"
logfile="unity.log"

build() {
  target=$1
  if [ "$target" == "linux" ]; then
    option="buildLinuxUniversalPlayer"
  fi
  if [ "$target" == "windows" ]; then
    option="buildWindowsPlayer"
  fi
  echo -n "Build $project for $target ..."
  $builder -batchmode -nographics -silent-crashes \
    -projectPath $(pwd) \
    -logFile $(pwd)/$logfile \
    -$option "$(pwd)/bin/$target/$project.sh" \
    -quit
  cd "bin/$target" ; zip -r "../$project-$target.zip" . ; cd -
}

build "linux"
build "windows"

echo 'Build log:'
cat $(pwd)/unity.log

