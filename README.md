# Renderer(iOS)
the project is iOS Renderer for [iOS](https://www.apple.com/jp/ios).

## Description
the project is develoed by Xcode(10.1).

OpenGLES(1.x).

iOS Renderer supported iOS10.0 Later.

## Usage
***Notes on use for iOS***

1.Add to the following command to Podfile in your project.
- Objective-C

```
use_frameworks!
pod 'iOSObjectiveCGLES1Renderer', git: 'https://github.com/ucreates/ios_renderer/', branch: 'master'
```

* See the following examples.
  * Podfile(Objective-C):https://github.com/ucreates/ios_renderer_opengles1_client/blob/master/objectivec/Podfile

2.Execute command in your ios project.

```pod install```

3.Open ios_renderer_opengles1_client.xcworkspace.
you should set same build settings Your iOS Client App Project and Pods Project.

```
Base SDK
Build Active Architecture Only
Supported Platforms
Valid Architectures
```

4.Build and Running iOS Renderer on your iOS Client App.
