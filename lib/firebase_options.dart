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
    apiKey: 'AIzaSyDu9sA6e51T9PvHobSTK74UrFsVSpI4s_M',
    appId: '1:813341630510:android:df432121a8fc4c26c37fbf',
    messagingSenderId: '813341630510',
    projectId: 'smart-patient-monitoring-44c28',
    authDomain: 'smart-patient-monitoring-44c28.firebaseapp.com',
    storageBucket: 'smart-patient-monitoring-44c28.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDu9sA6e51T9PvHobSTK74UrFsVSpI4s_M',
    appId: '1:813341630510:android:df432121a8fc4c26c37fbf',
    messagingSenderId: '813341630510',
    projectId: 'smart-patient-monitoring-44c28',
    storageBucket: 'smart-patient-monitoring-44c28.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDu9sA6e51T9PvHobSTK74UrFsVSpI4s_M',
    appId: '1:813341630510:android:df432121a8fc4c26c37fbf',
    messagingSenderId: '813341630510',
    projectId: 'smart-patient-monitoring-44c28',
    storageBucket: 'smart-patient-monitoring-44c28.appspot.com',
    iosBundleId: 'com.example.smart_patient_monitoring_system',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDu9sA6e51T9PvHobSTK74UrFsVSpI4s_M',
    appId: '1:813341630510:android:df432121a8fc4c26c37fbf',
    messagingSenderId: '813341630510',
    projectId: 'smart-patient-monitoring-44c28',
    storageBucket: 'smart-patient-monitoring-44c28.appspot.com',
    iosBundleId: 'com.example.smart_patient_monitoring_system.RunnerTests',
  );
}
