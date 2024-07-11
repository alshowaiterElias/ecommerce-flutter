class TFirebaseAuthenticationException implements Exception {
  TFirebaseAuthenticationException(this.code);
  final String code;

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already registered';
      case 'invalid-email':
        return 'The email address provided is invalid';
      case 'weak-password':
        return 'This password is to weak';
      case 'user-disabled':
        return 'this user account is disabled';
      case 'user-not-found':
        return 'Invalid log in details';
      case 'wrong-password':
        return 'Incorrect Password';
      case 'invalid-verification-code':
        return 'Invalid verification code';
      case 'invalid-verification-id':
        return 'Invalid verification ID';
      case 'quota-exceeded':
        return 'Quota exceeded';
      case 'email-already-exists':
        return 'Email already exists';

      default:
        return "";
    }
  }
}
