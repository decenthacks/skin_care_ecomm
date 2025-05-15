

/// Custom Exception for Firebase Auth
class TFirebaseAuthException implements Exception {
  final String code;

  TFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'This email is already in use. Please try another one.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'operation-not-allowed':
        return 'Email/password accounts are not enabled.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'user-disabled':
        return 'This user has been disabled.';
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'Incorrect password.';
      default:
        return 'An unknown Firebase Auth error occurred.';
    }
  }
}

/// General Firebase Exception
class TFirebaseException implements Exception {
  final String code;

  TFirebaseException(this.code);

  String get message => 'Firebase Error [$code]';
}

/// Platform Exception (e.g. when dealing with native plugins)
class TPlatformException implements Exception {
  final String code;

  TPlatformException(this.code);

  String get message => 'Platform Error [$code]';
}

/// Format Exception (invalid or unexpected data)
class TFormatException implements Exception {
  const TFormatException();

  String get message => 'Invalid format or unexpected input.';
}
