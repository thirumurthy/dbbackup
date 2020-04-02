#!/bin/bash
export PATH=$PATH:/opt/gradle-6.3/bin
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

rm -rf /home/username/path/to/MobileApp/platforms/android/app/build/
cd /home/username/path/to/MobileApp/
ionic cordova plugin rm cordova-plugin-console
ionic cordova build --release android
cp -R /home/username/path/to/MobileApp/platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk app-release-unsigned.apk
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore kyname.keystore  app-release-unsigned.apk alias_name
/home/kumar/Android/Sdk/build-tools/29.0.3/zipalign -v 4  app-release-unsigned.apk app-release_signed.apk
