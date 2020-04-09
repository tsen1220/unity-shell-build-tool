# UnityShellBuildTool

Build the Unity App With Shell Scripts.

We can create App with Unity BuildPipeline.

You need to change Unity path to run and decide your app destination path.

Otherwise, We need customized static methods in Unity Editor directory for commandline args (-executeMethod).

- UNITY_PATH is your Unity location.
- PROJECT_PATH is your unity project location.
- BUILD_LOG_PATH is logfile path.
- DESTINATION_PATH is an argument in Unity Editor C# script. Build App Directory.
- BUILD_VERSION is an argument in Unity Editor C# script. Build App Version.
- BUILD_CODEVERSION is an argument in Unity Editor C# script. Android BundleCodeVersion for google play.
- EXECUTE_METHOD is default argument in Unity. Execute static Build methods. For example, -executeMethod iOSShellBuild.Build
- BUILD_TARGET is default argument in Unity. Choose your build app platform.
