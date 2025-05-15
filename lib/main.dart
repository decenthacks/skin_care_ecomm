

import 'package:bodyandbeauty/data/repositories/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';
import 'app.dart';

/// Entry point to the Flutter app
Future<void> main() async {


  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  // Await Splash until other item load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform).then(
          (FirebaseApp value) => Get.put(AuthenticationRepository()),
    );



  /// Run the app
  runApp(const App());
}




// import 'package:bodyandbeauty/data/repositories/authentication_repository.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'app.dart';
// /// Entry point to thee flutter app
// Future<void> main() async {
//
//   //Widget binding
//   final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
//
//   /// GetX local Storage
//   await GetStorage.init();
//
//   // Await Splash until other item load
//   FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
//
//   await Get.put(AuthenticationRepository());
//
//
//   runApp(const App());
// }