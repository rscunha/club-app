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
    apiKey: 'AIzaSyCXlbXxMX46fhCGUnwejZ3Rhz3JBIiyR3Y',
    appId: '1:733480386698:web:e5632d729050b13234ed73',
    messagingSenderId: '733480386698',
    projectId: 'fertyl-club',
    authDomain: 'fertyl-club.firebaseapp.com',
    storageBucket: 'fertyl-club.appspot.com',
    measurementId: 'G-1M3DTHKPRE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAiQrINdauBGsp81Q63jXWGJ_EeVa2mLLw',
    appId: '1:733480386698:android:94cf45243da7e10834ed73',
    messagingSenderId: '733480386698',
    projectId: 'fertyl-club',
    storageBucket: 'fertyl-club.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDoEy0ViY03jskNcx1xALAhAcJMetetvFs',
    appId: '1:733480386698:ios:1b1904041136033b34ed73',
    messagingSenderId: '733480386698',
    projectId: 'fertyl-club',
    storageBucket: 'fertyl-club.appspot.com',
    iosClientId: '733480386698-br8m82upc71tkrb6grs08ktttdl24cjj.apps.googleusercontent.com',
    iosBundleId: 'com.fertyl.mobile.b2cApp',
  );
}
