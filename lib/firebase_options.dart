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
    apiKey: 'AIzaSyDx1PES7daZg_DUByhvij8j2Vs8ceZUBtE',
    appId: '1:842008693647:web:9669b7da2e2e997f0dd9fa',
    messagingSenderId: '842008693647',
    projectId: 'fir-quiz-app-3e0b9',
    authDomain: 'fir-quiz-app-3e0b9.firebaseapp.com',
    storageBucket: 'fir-quiz-app-3e0b9.appspot.com',
    measurementId: 'G-H0PDXHHJY3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD84l72VfEAcCSkFY4-y7QgstMJhstXoao',
    appId: '1:842008693647:android:79e5c85e1ced73650dd9fa',
    messagingSenderId: '842008693647',
    projectId: 'fir-quiz-app-3e0b9',
    storageBucket: 'fir-quiz-app-3e0b9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDi1c7B5dpvpj-FswDyFVJTOjV0QY54t5k',
    appId: '1:842008693647:ios:c03d1151e5afe6980dd9fa',
    messagingSenderId: '842008693647',
    projectId: 'fir-quiz-app-3e0b9',
    storageBucket: 'fir-quiz-app-3e0b9.appspot.com',
    iosClientId: '842008693647-h48o4e0kc7u7mbog8u735usjsjudpi1r.apps.googleusercontent.com',
    iosBundleId: 'com.example.quizzApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDi1c7B5dpvpj-FswDyFVJTOjV0QY54t5k',
    appId: '1:842008693647:ios:c03d1151e5afe6980dd9fa',
    messagingSenderId: '842008693647',
    projectId: 'fir-quiz-app-3e0b9',
    storageBucket: 'fir-quiz-app-3e0b9.appspot.com',
    iosClientId: '842008693647-h48o4e0kc7u7mbog8u735usjsjudpi1r.apps.googleusercontent.com',
    iosBundleId: 'com.example.quizzApp',
  );
}
