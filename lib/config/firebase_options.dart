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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyCkDGrtnWc0Y044zI-WqkkWr6Yze8Hp1vo',
    appId: '1:52812092248:web:2c45fcbc9d453892b94b2d',
    messagingSenderId: '52812092248',
    projectId: 'xianinfotect-task',
    authDomain: 'xianinfotect-task.firebaseapp.com',
    storageBucket: 'xianinfotect-task.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCiv92wT046scwAj5jk9JuMtSlWwq3IOvk',
    appId: '1:52812092248:android:ea97eca80fc484dcb94b2d',
    messagingSenderId: '52812092248',
    projectId: 'xianinfotect-task',
    storageBucket: 'xianinfotect-task.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCuCV9757kuYHSfQoDHLL7RibbeuetaWtk',
    appId: '1:52812092248:ios:f41b69392289fd30b94b2d',
    messagingSenderId: '52812092248',
    projectId: 'xianinfotect-task',
    storageBucket: 'xianinfotect-task.appspot.com',
    iosBundleId: 'com.example.xaininfotectTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCuCV9757kuYHSfQoDHLL7RibbeuetaWtk',
    appId: '1:52812092248:ios:f41b69392289fd30b94b2d',
    messagingSenderId: '52812092248',
    projectId: 'xianinfotect-task',
    storageBucket: 'xianinfotect-task.appspot.com',
    iosBundleId: 'com.example.xaininfotectTask',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCkDGrtnWc0Y044zI-WqkkWr6Yze8Hp1vo',
    appId: '1:52812092248:web:621c3cb4229a4a62b94b2d',
    messagingSenderId: '52812092248',
    projectId: 'xianinfotect-task',
    authDomain: 'xianinfotect-task.firebaseapp.com',
    storageBucket: 'xianinfotect-task.appspot.com',
  );
}
