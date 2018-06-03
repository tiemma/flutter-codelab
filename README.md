# flutter-codelab
This the sample repository for the flutter codelab to be used at the GDG UNILAG io Extended #18

Flutter is a native framework for building high performance android/iOS apps using Dart. More details here (https://en.wikipedia.org/wiki/Flutter_(software))

Dart is a programming language. More details here(https://en.wikipedia.org/wiki/Dart_(programming_language))

Flutter and Dart were both developed at Google.

The entire app structure is as follows:

## android
> This is where the configuration settings and local gradle builds are stored for android

> All local configuration regarding android builds can be done here

> Requires android studio SDK's to perform a complete build

## ios
> This is where the config settings for an iOS app build can be done

> Requires xCode and the iOS SDK to perform a complete build

## lib
> This is where all the dart code we'd be using for the codelab is stored

> The flutter framework pulls your applications from this folder

## test
> All tests for the application running in lib are placed here

> The tests are platform-independent and only require dart

## \*.iml
> These are local configs used to hold dependencies

>>textIML is a module file created by IntelliJ IDEA, an IDE used to develop Java applications. It stores information about a development module, which may be a Java, Plugin, Android, or Maven component; saves the module paths, dependencies, and other settings.

## pubspec.yaml
> This is the flutter configuration file where your project related settings are done.

> Dependencies, assets and all that are put in this file

> It's like a package.json but for Flutter


# Dependencies and Installations

## Intro
To run this project, you have to setup a few dependencies which are listed below
 - Dart
 - Flutter SDK
 - Android SDK / XCode [Platform Dependent] for Android/ iOS respectively
 - An editor (VSCode / IntelliJ / Android Studio) preferably
 - An ADB enabled Android device / emulator or an iPhone (MAC dependent)
 
 ## Flutter and Dart
 
Visit here(https://flutter.io/get-started/install/) and click on the installation guide for your operating system

## Android SDK

This will be provided at the venue due to size limits. 
You can also copy it from your friends also

Reference this link(https://stackoverflow.com/questions/25176594/android-sdk-location?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa) for help finding the SDK for your OS

Linux - $HOME/Android/Sdk

Mac - Kindly reference the link above 

## Editor
-  This is your personal preference, use nano as far as I'm concerned 

## Phone
 -  So sorry if you don't have one....LOL!
 - Enable ADB settings on your android, if not active and plug it in with your usb cable
 - Higlight to any of the co-ordinators or peers for help with this
 
 
 After all this is done, you can verify that all dependency installations are good by running
 > flutter doctor -v
 
 You should ideally get *No issues found* as shown below
 
![Flutter Doctor Example](Flutter_Doctor_Visuals.png?raw=true "Flutter Doctor Example")

If you have any issues, kindly ask for any of the co-ordinators to assist you with the setup

## Run the application
> flutter run 

You should be setup and see an application open on your phone afterwards. 
Congrats on running your first flutter app



 
