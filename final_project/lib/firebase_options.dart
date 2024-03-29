// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAMKYuts2p0CaGf4yVgje-OHy79lv5sqeA',
    appId: '1:681315820816:web:23f0d83a99dcfbeaad7195',
    messagingSenderId: '681315820816',
    projectId: 'flutter-firebase-e6da6',
    authDomain: 'flutter-firebase-e6da6.firebaseapp.com',
    storageBucket: 'flutter-firebase-e6da6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCOc33priXuNmGfbKphnc8mjgRX5bdg2VQ',
    appId: '1:681315820816:android:eb66356d6d41ae11ad7195',
    messagingSenderId: '681315820816',
    projectId: 'flutter-firebase-e6da6',
    storageBucket: 'flutter-firebase-e6da6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCBkaBXcg36buLNME8wd435i4aLWAjCai4',
    appId: '1:681315820816:ios:8b0651084f344343ad7195',
    messagingSenderId: '681315820816',
    projectId: 'flutter-firebase-e6da6',
    storageBucket: 'flutter-firebase-e6da6.appspot.com',
    iosBundleId: 'com.example.midterm',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCBkaBXcg36buLNME8wd435i4aLWAjCai4',
    appId: '1:681315820816:ios:acc05804cdee3b0bad7195',
    messagingSenderId: '681315820816',
    projectId: 'flutter-firebase-e6da6',
    storageBucket: 'flutter-firebase-e6da6.appspot.com',
    iosBundleId: 'com.example.midterm.RunnerTests',
  );
}
