#!/bin/sh

# https://support.unity3d.com/hc/en-us/articles/211013503-How-can-I-have-a-fully-automated-build-process-that-can-fetch-and-install-any-version-of-Unity-into-our-build-environment-
#
#For Windows:
#http://download.unity3d.com/download_unity/{Changeset}/Windows64EditorInstaller/UnitySetup64.exe
#http://download.unity3d.com/download_unity/{Changeset}/WindowsDocumentationInstaller/UnityDocumentationSetup.exe
#http://download.unity3d.com/download_unity/{Changeset}/WindowsDevelopmentWebPlayerInstaller/UnityWebPlayerDevelopment.exe
#http://download.unity3d.com/download_unity/{Changeset}/WindowsStandardAssetsInstaller/UnityStandardAssetsSetup.exe
#http://download.unity3d.com/download_unity/{Changeset}/WindowsExampleProjectInstaller/UnityExampleProjectSetup.exe
#http://download.unity3d.com/download_unity/{Changeset}/TargetSupportInstaller/UnitySetup-Windows-Support-for-Editor-{version}.exe
#http://download.unity3d.com/download_unity/{Changeset}/TargetSupportInstaller/UnitySetup-Android-Support-for-Editor-{version}.exe
#http://download.unity3d.com/download_unity/{Changeset}/TargetSupportInstaller/UnitySetup-iOS-Support-for-Editor-{version}.exe
#http://download.unity3d.com/download_unity/{Changeset}/TargetSupportInstaller/UnitySetup-AppleTV-Support-for-Editor-{version}.exe
#http://download.unity3d.com/download_unity/{Changeset}/TargetSupportInstaller/UnitySetup-Linux-Support-for-Editor-{version}.exe
#http://download.unity3d.com/download_unity/{Changeset}/TargetSupportInstaller/UnitySetup-Mac-Support-for-Editor-{version}.exe
#http://download.unity3d.com/download_unity/{Changeset}/TargetSupportInstaller/UnitySetup-Metro-Support-for-Editor-{version}.exe
#http://download.unity3d.com/download_unity/{Changeset}/TargetSupportInstaller/UnitySetup-UWP-IL2CPP-Support-for-Editor-{version}.exe
#http://download.unity3d.com/download_unity/{Changeset}/TargetSupportInstaller/UnitySetup-Samsung-TV-Support-for-Editor-{version}.exe
#http://download.unity3d.com/download_unity/{Changeset}/TargetSupportInstaller/UnitySetup-Tizen-Support-for-Editor-{version}.exe
#http://download.unity3d.com/download_unity/{Changeset}/TargetSupportInstaller/UnitySetup-WebGL-Support-for-Editor-{version}.exe
#
#For OSX:
#http://download.unity3d.com/download_unity/{Changeset}/MacEditorInstaller/Unity.pkg
#http://download.unity3d.com/download_unity/{Changeset}/MacDocumentationInstaller/Documentation.pkg
#http://download.unity3d.com/download_unity/{Changeset}/MacWebPlayerInstaller/WebPlayer.pkg
#http://download.unity3d.com/download_unity/{Changeset}/MacStandardAssetsInstaller/StandardAssets.pkg
#http://download.unity3d.com/download_unity/{Changeset}/MacExampleProjectInstaller/Examples.pkg
#http://download.unity3d.com/download_unity/{Changeset}/MacEditorTargetInstaller/UnitySetup-Mac-Support-for-Editor-{version}.pkg
#http://download.unity3d.com/download_unity/{Changeset}/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-{version}.pkg
#http://download.unity3d.com/download_unity/{Changeset}/MacEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-{version}.pkg
#http://download.unity3d.com/download_unity/{Changeset}/MacEditorTargetInstaller/UnitySetup-AppleTV-Support-for-Editor-{version}.pkg
#http://download.unity3d.com/download_unity/{Changeset}/MacEditorTargetInstaller/UnitySetup-Linux-Support-for-Editor-{version}.pkg
#http://download.unity3d.com/download_unity/{Changeset}/MacEditorTargetInstaller/UnitySetup-Samsung-TV-Support-for-Editor-{version}.pkg
#http://download.unity3d.com/download_unity/{Changeset}/MacEditorTargetInstaller/UnitySetup-Tizen-Support-for-Editor-{version}.pkg
#http://download.unity3d.com/download_unity/{Changeset}/MacEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-{version}.pkg
#http://download.unity3d.com/download_unity/{Changeset}/MacEditorTargetInstaller/UnitySetup-Windows-Support-for-Editor-{version}.pkg

# $base_url/$changeset/unity-$version-$platform.ini
# (where platform is 'osx' or 'win') has this info

target=$1
#base_url=http://netstorage.unity3d.com/unity
base_url=http://download.unity3d.com/download_unity
changeset=38b4efef76f0
version=5.5.0f3

download() {
  url="$base_url/$changeset/$package"
  echo "Download from $url:"
  curl -o `basename "$package"` "$url"
}

install() {
  package=$1
  download "$package"

  echo "Install "`basename "$package"`" ..."
  sudo installer -dumplog -package `basename "$package"` -target /
  echo "Done."
}

install "MacEditorInstaller/Unity.pkg"
install "MacEditorTargetInstaller/UnitySetup-$target-Support-for-Editor-$version.pkg"

