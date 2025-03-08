import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:bodyandbeauty/data/repositories/authentication_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


import 'app.dart';

/// Entry point to the Flutter app
Future<void> main() async {
  // Ensure Widgets binding is initialized
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// Initialize GetX local storage
  await GetStorage.init();

  /// Preserve splash screen until Amplify & authentication setup is complete
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Initialize AWS Amplify before authentication repository
  await _configureAmplify();

  /// Inject Authentication Repository using GetX
  Get.put(AuthenticationRepository());

  /// Remove splash screen after initialization
  FlutterNativeSplash.remove();

  /// Run the app
  runApp(const App());
}

/// Configure AWS Amplify
Future<void> _configureAmplify() async {
  try {
    final auth = AmplifyAuthCognito();
    await Amplify.addPlugin(auth);
    await Amplify.configure(amplifyconfig);
    if (kDebugMode) {
      print("✅ AWS Amplify configured successfully!");
    }
  } on Exception catch (e) {
    if (kDebugMode) {
      print("❌ Error configuring Amplify: $e");
    }
    Get.snackbar(
      "Amplify Error",
      "Failed to initialize Amplify. Please try again.",
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
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