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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBs7lT5uSjZYXhrTxTZlAvBbShE-DjBx8Y',
    appId: '1:1045291876056:web:6441596bbd38361808e1ad',
    messagingSenderId: '1045291876056',
    projectId: 'message-app-80ac3',
    authDomain: 'message-app-80ac3.firebaseapp.com',
    databaseURL: 'https://message-app-80ac3-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'message-app-80ac3.appspot.com',
    measurementId: 'G-8S7WSSHBRH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDFkwmKEq9Wae7L7j6OGATaStd6q0jcVXs',
    appId: '1:1045291876056:android:a7e6f2e57e741aed08e1ad',
    messagingSenderId: '1045291876056',
    projectId: 'message-app-80ac3',
    databaseURL: 'https://message-app-80ac3-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'message-app-80ac3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBtbAWYeJFSwUZYBjMW6uY7D5Pq-0rEtHg',
    appId: '1:1045291876056:ios:b2cb5d3627868aec08e1ad',
    messagingSenderId: '1045291876056',
    projectId: 'message-app-80ac3',
    databaseURL: 'https://message-app-80ac3-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'message-app-80ac3.appspot.com',
    iosBundleId: 'dev.erkinov.messagApp',
  );
}
