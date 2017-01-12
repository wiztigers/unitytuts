#!/bin/sh

url="http://beta.unity3d.com/download/7083239589/unity-4.6.9.dmg"
package="unity.pkg"
echo Downloading from $url ...
curl -o $package $url
echo Done: `ls $package`

echo Installing $package ...
sudo installer -dumplog -package $package -target /
echo Done
