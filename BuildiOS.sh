#!/bin/bash

UNITY_PATH=/Applications/Unity/Hub/Editor/2019.2.13f1/Unity.app/Contents/MacOS/Unity
PROJECT_PATH=/ProjectPath
BUILD_LOG_PATH=${PROJECT_PATH}/build.log
DESTINATION_PATH=./UnityBuildApp

if [ ! -d ${DESTINATION_PATH} ]; then
  mkdir ${DESTINATION_PATH}
fi

$UNITY_PATH 
  -quit \
  -batchmode \
  -projectPath ${PROJECT_PATH} \
  -buildTarget iOS \
  -executeMethod iOSShellBuild.Build \
  -logFile ${BUILD_LOG_PATH} \
  -destinationPath ${DESTINATION_PATH}
