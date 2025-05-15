import 'package:flutter/services.dart';
import 'exceptions.dart';

class PlatformExceptionHandler extends AppException {
  PlatformExceptionHandler(super.message);

  /// Handles platform-specific exceptions (e.g., Android/iOS)
  static String handle(PlatformException e) {
    return "Platform Error: ${e.message ?? "Something went wrong"}";
  }
}
