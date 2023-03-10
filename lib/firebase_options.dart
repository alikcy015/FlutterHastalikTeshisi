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
    apiKey: 'AIzaSyB4xEBfHZd6Da47wI4IT6BTWCT6Rc8UqEM',
    appId: '1:123382469156:web:ae745d38c7c346a3f3beb1',
    messagingSenderId: '123382469156',
    projectId: 'hastalikteshisi',
    authDomain: 'hastalikteshisi.firebaseapp.com',
    storageBucket: 'hastalikteshisi.appspot.com',
    measurementId: 'G-3XGZS61VFH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCimjdRUYodFtdh1fYJ_9ns3m_imfKVMjE',
    appId: '1:123382469156:android:2db39d60d94b2351f3beb1',
    messagingSenderId: '123382469156',
    projectId: 'hastalikteshisi',
    storageBucket: 'hastalikteshisi.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCT4AaOb_x90CUHm1-f0iMvUhCF3xcSlqE',
    appId: '1:123382469156:ios:6b3dcefc74a48656f3beb1',
    messagingSenderId: '123382469156',
    projectId: 'hastalikteshisi',
    storageBucket: 'hastalikteshisi.appspot.com',
    iosClientId: '123382469156-5cvm6euuuul0u5up73pvaoodigql7c7g.apps.googleusercontent.com',
    iosBundleId: 'com.example.mobileProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCT4AaOb_x90CUHm1-f0iMvUhCF3xcSlqE',
    appId: '1:123382469156:ios:6b3dcefc74a48656f3beb1',
    messagingSenderId: '123382469156',
    projectId: 'hastalikteshisi',
    storageBucket: 'hastalikteshisi.appspot.com',
    iosClientId: '123382469156-5cvm6euuuul0u5up73pvaoodigql7c7g.apps.googleusercontent.com',
    iosBundleId: 'com.example.mobileProject',
  );
}
