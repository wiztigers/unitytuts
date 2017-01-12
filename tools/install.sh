#!/bin/sh

url="http://beta.unity3d.com/download/7083239589/unity-4.6.9.dmg"
package="unity.dmg"
echo Downloading from $url ...
curl -o $package $url

echo Installing $package ...
sudo installer -dumplog -package $package -target /