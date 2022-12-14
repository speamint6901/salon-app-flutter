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
    apiKey: 'AIzaSyBcfjFywFKJHGEm7FDNyl__7zyRBUbgnWo',
    appId: '1:232961477914:web:cd8ca1255c2546addab0a3',
    messagingSenderId: '232961477914',
    projectId: 'udemy-salon',
    authDomain: 'udemy-salon.firebaseapp.com',
    storageBucket: 'udemy-salon.appspot.com',
    measurementId: 'G-LEQYJ8Z035',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCVB0CRKa3pz05_PLiUp6OgsySigAhdAfY',
    appId: '1:232961477914:android:0134ef371f1f1984dab0a3',
    messagingSenderId: '232961477914',
    projectId: 'udemy-salon',
    storageBucket: 'udemy-salon.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCv15kywpcHGItkSfiQYvr74FimXaBf4-c',
    appId: '1:232961477914:ios:bb24d6ee8b60973bdab0a3',
    messagingSenderId: '232961477914',
    projectId: 'udemy-salon',
    storageBucket: 'udemy-salon.appspot.com',
    iosClientId: '232961477914-63o4f6nt5vvvvl8dfacdjddba69n1a17.apps.googleusercontent.com',
    iosBundleId: 'com.example.udemySalon',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCv15kywpcHGItkSfiQYvr74FimXaBf4-c',
    appId: '1:232961477914:ios:bb24d6ee8b60973bdab0a3',
    messagingSenderId: '232961477914',
    projectId: 'udemy-salon',
    storageBucket: 'udemy-salon.appspot.com',
    iosClientId: '232961477914-63o4f6nt5vvvvl8dfacdjddba69n1a17.apps.googleusercontent.com',
    iosBundleId: 'com.example.udemySalon',
  );
}
