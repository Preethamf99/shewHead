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
    apiKey: 'AIzaSyBQhgPzn-AHAx35ulpTnQ__3pH5_Hpbz0o',
    appId: '1:780101139140:web:263c9730a8362e51fee791',
    messagingSenderId: '780101139140',
    projectId: 'shewhead-395e9',
    authDomain: 'shewhead-395e9.firebaseapp.com',
    storageBucket: 'shewhead-395e9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDkqyP9LtWaTMos6ZMR1BsTw7YjJRmMBxg',
    appId: '1:780101139140:android:1a71e907667461a2fee791',
    messagingSenderId: '780101139140',
    projectId: 'shewhead-395e9',
    storageBucket: 'shewhead-395e9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCtmIR5N4pe-etdn4o7XtH3i34t_49wZr8',
    appId: '1:780101139140:ios:e5527ae8fc448b69fee791',
    messagingSenderId: '780101139140',
    projectId: 'shewhead-395e9',
    storageBucket: 'shewhead-395e9.appspot.com',
    iosBundleId: 'com.example.shewheadShoesApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCtmIR5N4pe-etdn4o7XtH3i34t_49wZr8',
    appId: '1:780101139140:ios:a10aa676009d3b01fee791',
    messagingSenderId: '780101139140',
    projectId: 'shewhead-395e9',
    storageBucket: 'shewhead-395e9.appspot.com',
    iosBundleId: 'com.example.shewheadShoesApp.RunnerTests',
  );
}