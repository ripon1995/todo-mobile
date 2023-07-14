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
    apiKey: 'AIzaSyAACMlUg_CRY3NbV6hxQQ0k8vt6XONplOU',
    appId: '1:831726913060:web:aed10dc1e4199cd5d5fab1',
    messagingSenderId: '831726913060',
    projectId: 'todo-1938b',
    authDomain: 'todo-1938b.firebaseapp.com',
    storageBucket: 'todo-1938b.appspot.com',
    measurementId: 'G-BEKVTKZLJW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBy2xd78rbLLXKlioVRcRjeEjqMGmYAU2c',
    appId: '1:831726913060:android:920f9c13ad301c86d5fab1',
    messagingSenderId: '831726913060',
    projectId: 'todo-1938b',
    storageBucket: 'todo-1938b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBcQ5QkdYD4Un9fYcixxEJ4IlhErYQoXqA',
    appId: '1:831726913060:ios:e9bb6ad230799584d5fab1',
    messagingSenderId: '831726913060',
    projectId: 'todo-1938b',
    storageBucket: 'todo-1938b.appspot.com',
    iosClientId: '831726913060-h7q52h9u7lto0pajlqif7hmsjhrpmr2t.apps.googleusercontent.com',
    iosBundleId: 'com.rootless.flutterBasic',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBcQ5QkdYD4Un9fYcixxEJ4IlhErYQoXqA',
    appId: '1:831726913060:ios:e9bb6ad230799584d5fab1',
    messagingSenderId: '831726913060',
    projectId: 'todo-1938b',
    storageBucket: 'todo-1938b.appspot.com',
    iosClientId: '831726913060-h7q52h9u7lto0pajlqif7hmsjhrpmr2t.apps.googleusercontent.com',
    iosBundleId: 'com.rootless.flutterBasic',
  );
}