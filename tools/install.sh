#!/bin/sh

#url="http://beta.unity3d.com/download/7083239589/unity-4.6.9.dmg"
url="http://netstorage.unity3d.com/unity/649f48bbbf0f/MacEditorInstaller/Unity-5.4.1f1.pkg"
package="unity.pkg"
echo Downloading from $url ...
curl -o $package $url
echo Done: `ls $package`

echo Installing $package ...
sudo installer -dumplog -package $package -target /
echo Done
