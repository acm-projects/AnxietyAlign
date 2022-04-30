// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCKCAwibLmt9Wl757mg00sOd9Lj09KZzdM',
    appId: '1:802468649001:android:78ed46d0152a670411e438',
    messagingSenderId: '802468649001',
    projectId: 'axal-74aa7',
    databaseURL: 'https://axal-74aa7-default-rtdb.firebaseio.com',
    storageBucket: 'axal-74aa7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCKCAwibLmt9Wl757mg00sOd9Lj09KZzdM',
    appId: '1:802468649001:ios:8a2cd977ce0e5fc111e438',
    messagingSenderId: '802468649001',
    projectId: 'axal-74aa7',
    databaseURL: 'https://axal-74aa7-default-rtdb.firebaseio.com',
    storageBucket: 'axal-74aa7.appspot.com',
    iosClientId: '802468649001-8c0ikie7e0tkqd5br1s4h86bjrrjfp52.apps.googleusercontent.com',
    iosBundleId: 'com.example.ios',
  );
}