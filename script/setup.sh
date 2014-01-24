#!/bin/bash

echo "Type library name:"
read name

echo "Type package name:"
read package


# replace strings
sed -i.bak "s/android-library-template/$name/g" Library/src/main/res/values/strings.xml
sed -i.bak "s/android-library-template/$name/g" Library/build.gradle
sed -i.bak "s/com.github.techisfun/$package/g"  Library/src/main/AndroidManifest.xml
sed -i.bak "s/com.github.techisfun/$package/g"  Library/build.gradle
sed -i.bak "s/com.github.techisfun/$package/g"  Library/src/test/java/RobolectricGradleTestRunner.java

# create dirs
DIR_TREE=`echo $package | sed "s/\./\//g"`
mkdir -p "Library/src/main/java/$DIR_TREE"
mkdir -p "Library/src/test/java/$DIR_TREE"

# move RobolectricGradleTestRunner.java in correct path
mv Library/src/test/java/RobolectricGradleTestRunner.java Library/src/test/java/$DIR_TREE/RobolectricGradleTestRunner.java

# add new path to git
git add Library/src/test/java/com

# cleanup
rm Library/src/main/res/values/strings.xml.bak
rm Library/src/main/AndroidManifest.xml.bak
rm Library/build.gradle.bak
rm Library/src/test/java/RobolectricGradleTestRunner.java.bak