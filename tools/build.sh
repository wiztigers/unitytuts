 #!/bin/sh

builder="/Applications/Unity/Unity.app/Contents/MacOS/Unity"
project="Roll-a-ball"
logfile="unity.log"

echo "Build $project for Windows ..."
$builder -batchmode -nographics -silent-crashes \
-projectPath $(pwd) \
-logFile $(pwd)/$logfile \
-buildWindowsPlayer "$(pwd)/bin/windows/$project.exe" \
-quit

echo "Build $project for Linux ..."
$builder -batchmode -nographics -silent-crashes \
-projectPath $(pwd) \
-logFile $(pwd)/$logfile \
-buildLinuxUniversalPlayer "$(pwd)/bin/linux/$project.sh" \
-quit

echo 'Build log:'
cat $(pwd)/unity.log