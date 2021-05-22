#! /bin/bash

echo '\n- Installing Homebrew\n'
brew -v
if [[ $? != 0 ]] ; then
    # Install Homebrew
     ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo 'brew already installed!'
    brew update
fi

echo '\n- Installing XCode command line tools\n'
xcode-select --install

echo '\n- Installing Java\n'
brew tap adoptopenjdk/openjdk
brew install adoptopenjdk8

echo '\n- Installing Scala\n'
brew install scala

echo '\n- Installing Spark\n'
brew install apache-spark	

echo '\n- Setup Spark HOME\n'
SPARK_VERSION=$(spark-shell --version &> tmp.data ; grep version tmp.data | head -1 | awk '{print $NF}';rm tmp.data)
echo 'Add this to your bash profile ->'
echo "export SPARK_HOME=/usr/local/Cellar/apache-spark/$SPARK_VERSION/libexecexport"

echo '\n- Done ☜(⌒▽⌒)☞'
