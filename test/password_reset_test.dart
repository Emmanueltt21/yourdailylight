import 'package:email_validator/email_validator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yourdailylight/auth/ForgotPasswordScreen.dart';

void main() {
  group('Password Reset Tests', () {
    test('Forgot password route remains stable', () {
      expect(ForgotPasswordScreen.routeName, '/forgotpassword');
    });

    test('Email validation accepts common valid formats', () {
      const validEmails = [
        'test@example.com',
        'user.name@domain.co.uk',
        'user+tag@example.org',
      ];

      for (final email in validEmails) {
        expect(EmailValidator.validate(email), isTrue, reason: '$email should be valid');
      }
    });

    test('Email validation rejects malformed addresses', () {
      const invalidEmails = [
        'invalid-email',
        '@domain.com',
        'user@',
        '',
        'user space@domain.com',
      ];

      for (final email in invalidEmails) {
        expect(EmailValidator.validate(email), isFalse, reason: '$email should be invalid');
      }
    });
  });
}
