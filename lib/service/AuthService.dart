import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Send verification email
      await userCredential.user?.sendEmailVerification();

      return 'Verification email sent. Please check your inbox.';
    } on FirebaseAuthException catch (e) {
      return e.message; // Return error message
    }
  }

  Future<bool> isEmailVerified() async {
    User? user = _auth.currentUser;
    await user?.reload(); // Refresh user data
    return user?.emailVerified ?? false;
  }

  Future<void> resendVerificationEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

}
