#!/bin/sh


builder="/Applications/Unity/Unity.app/Contents/MacOS/Unity"
project="Roll-a-ball"
logfile="unity.log"

#echo -n "Build $project for Windows ..."
#$builder -batchmode -nographics -silent-crashes \
#-projectPath $(pwd) \
#-logFile $(pwd)/$logfile \
#-buildWindowsPlayer "$(pwd)/bin/windows/$project.exe" \
#-quit
#echo "Done."

echo -n "Build $project for Linux ..."
$builder -batchmode -nographics -silent-crashes \
-projectPath $(pwd) \
-logFile $(pwd)/$logfile \
-buildLinuxUniversalPlayer "$(pwd)/bin/linux/$project.sh" \
-quit
echo "Done."
cd bin/linux ; zip -r ../../linux.zip . ; cd -
ls -lR

echo 'Build log:'
cat $(pwd)/unity.log
