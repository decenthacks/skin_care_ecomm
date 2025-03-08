import 'package:amplify_flutter/amplify_flutter.dart';
import 'exceptions.dart';

class AWSAuthException extends AppException {
  AWSAuthException(super.message);

  /// Handles AWS Amplify authentication-related exceptions
  static String handle(AuthException e) {
    String errorMessage = "An unknown authentication error occurred.";

    if (e is InvalidStateException) {
      errorMessage = "Invalid state. Please try again.";
    } else if (e.message.contains("UserNotFoundException")) {
      errorMessage = "User not found. Please sign up first.";
    } else if (e.message.contains("NotAuthorizedException")) {
      errorMessage = "Incorrect email or password.";
    } else if (e.message.contains("UsernameExistsException")) {
      errorMessage = "This email is already registered. Try logging in.";
    } else if (e.message.contains("CodeMismatchException")) {
      errorMessage = "Invalid verification code. Please check your email.";
    } else if (e.message.contains("ExpiredCodeException")) {
      errorMessage = "Your verification code has expired. Request a new one.";
    } else if (e.message.contains("LimitExceededException")) {
      errorMessage = "Too many attempts. Please try again later.";
    } else if (e.message.contains("UserNotConfirmedException")) {
      errorMessage = "Account not verified. Please check your email.";
    }

    return errorMessage;
  }
}
