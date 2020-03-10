#!/bin/bash
UNITY_PATH=/Applications/Unity/Hub/Editor/2019.2.13f1/Unity.app/Contents/MacOS/Unity
DESTINATION_PATH=./BuildUnityApp
BUILD_LOG_PATH=./Logs/build.log

# Only ios & Android mobile App
if [ $1 != "ios" ] && [ $1 != "android" ]; then
  echo "Please select your mobile app platform."
  exit 1
fi

# Build App Directory
if [ ! -d ${DESTINATION_PATH} ]; then
  mkdir ${DESTINATION_PATH}
fi

# App Platform
if [ $1 == "ios" ]; then
  BUILD_TARGET="iOS"
  EXECUTE_METHOD="iOSShellBuild.Build"
else
  BUILD_TARGET="Android"
  EXECUTE_METHOD="AndroidIL2CPPShellBuild.Build"
fi

# App Version
if [ -z $2 ]; then
  echo "Need Unity app Version."
  exit 1
else
  BUILD_VERSION=$2
fi

# Bundle Code Version (Android). Only integer is accpected.
BUILD_CODEVERSION=$3
regex="^[0-9]+$"
if ! [[ $BUILD_CODEVERSION =~ $regex ]]; then
  echo "Bundle code version need to input an integer."
  exit 1 
else
  BUILD_CODEVERSION=$3
fi  

$UNITY_PATH \
  -quit \
  -batchmode \
  -projectPath . \
  -buildTarget ${BUILD_TARGET} \
  -executeMethod ${EXECUTE_METHOD} \
  -logFile ${BUILD_LOG_PATH} \
  -destinationPath ${DESTINATION_PATH} \
  -version ${BUILD_VERSION} \
  -bundleCodeVersion ${BUILD_CODEVERSION}

echo "Built app on ${BUILD_TARGET} platform."
