#!/bin/bash

echo "Type library name:"
read name

echo "Type package name:"
read package


# replace strings
sed -i.bak 's/android-library-template/$name/g' Library/src/main/res/values/strings.xml
sed -i.bak 's/com.github.techisfun/$package/g'  Library/src/main/AndroidManifest.xml
sed -i.bak 's/com.github.techisfun/$package/g'  Library/build.gradle

# create dirs
DIR_TREE=`sed 's/./\//g' $package`
mkdir -p Library/src/main/java/$DIR_TREE

# cleanup
rm Library/src/main/res/values/strings.xml.bak