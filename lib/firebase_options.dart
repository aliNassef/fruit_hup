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
    apiKey: 'AIzaSyD8FZNbh0c6DIgJFlDtLODCI8Y_E6P11yk',
    appId: '1:922353646678:web:f7025774907e66f5104ff7',
    messagingSenderId: '922353646678',
    projectId: 'fruits-hup',
    authDomain: 'fruits-hup.firebaseapp.com',
    storageBucket: 'fruits-hup.appspot.com',
    measurementId: 'G-M64X1QNXDB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyARYyDuj1-giFdtlhqfH_963D0RgD2ez3k',
    appId: '1:922353646678:android:e9df363122443d53104ff7',
    messagingSenderId: '922353646678',
    projectId: 'fruits-hup',
    storageBucket: 'fruits-hup.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDpLb0rbVYEqA7ftNWDbWGAdpweMGk1Cdo',
    appId: '1:922353646678:ios:8c95d96e972273d4104ff7',
    messagingSenderId: '922353646678',
    projectId: 'fruits-hup',
    storageBucket: 'fruits-hup.appspot.com',
    iosBundleId: 'com.example.fruitHup',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDpLb0rbVYEqA7ftNWDbWGAdpweMGk1Cdo',
    appId: '1:922353646678:ios:c80e7a9bbf19bfa2104ff7',
    messagingSenderId: '922353646678',
    projectId: 'fruits-hup',
    storageBucket: 'fruits-hup.appspot.com',
    iosBundleId: 'com.example.fruitHup.RunnerTests',
  );
}
