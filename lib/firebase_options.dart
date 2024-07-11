// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyC3AzTqiC3wqWEK5_8Ul28rKjkju_i-VwQ',
    appId: '1:294397099045:web:015d3a473165710ae6d3cc',
    messagingSenderId: '294397099045',
    projectId: 'ecommerceapp-e97d1',
    authDomain: 'ecommerceapp-e97d1.firebaseapp.com',
    storageBucket: 'ecommerceapp-e97d1.appspot.com',
    measurementId: 'G-948HFWSE3M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAZuM7TOBs2n-35sO50uWwMJ6f0XnxgBJg',
    appId: '1:294397099045:android:f402bef35b5e2f5ae6d3cc',
    messagingSenderId: '294397099045',
    projectId: 'ecommerceapp-e97d1',
    storageBucket: 'ecommerceapp-e97d1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD6FtkiaSR0wQLUk_AzA92QlOXbagGFxWM',
    appId: '1:294397099045:ios:733e4946c3001f10e6d3cc',
    messagingSenderId: '294397099045',
    projectId: 'ecommerceapp-e97d1',
    storageBucket: 'ecommerceapp-e97d1.appspot.com',
    androidClientId: '294397099045-avut0emnti89onk3volda57n3p0ef5q3.apps.googleusercontent.com',
    iosClientId: '294397099045-eqrm6hntf1j7t06h3c7rr6lm7bli8u9u.apps.googleusercontent.com',
    iosBundleId: 'com.example.footballApp',
  );

}