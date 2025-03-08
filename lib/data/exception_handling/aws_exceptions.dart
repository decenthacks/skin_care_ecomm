import 'package:amplify_flutter/amplify_flutter.dart';
import 'aws_auth_exceptions.dart';
import 'exceptions.dart';

class AWSException extends AppException {
  AWSException(super.message);

  /// Handles AWS service-related exceptions
  static String handle(Exception e) {
    if (e is AuthException) {
      return AWSAuthException.handle(e);
    } else if (e is NetworkException) {
      return "No internet connection. Please check your network.";
    } else if (e is StorageException) {
      return "AWS Storage error: ${e.message}";
    } else if (e is ApiException) {
      return "AWS API error: ${e.message}";
    } else if (e is AmplifyException) {
      return "AWS Amplify error: ${e.message}";
    } else {
      return "An unexpected AWS error occurred.";
    }
  }
}
