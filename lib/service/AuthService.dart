import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get current Firebase user
  User? get currentUser => _auth.currentUser;

  // Check if user is authenticated
  bool get isAuthenticated => _auth.currentUser != null;

  // Stream of authentication state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Sign in with email and password
  Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth Error: ${e.message}');
      throw e;
    }
  }

  // Sign up with email and password
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

  // Check if current user's email is verified
  Future<bool> isEmailVerified() async {
    User? user = _auth.currentUser;
    await user?.reload(); // Refresh user data
    return user?.emailVerified ?? false;
  }

  // Resend verification email
  Future<void> resendVerificationEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Error signing out: $e');
      throw e;
    }
  }

  // Send password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      print('Password reset error: ${e.message}');
      throw e;
    }
  }

  // Delete current user account
  Future<void> deleteAccount() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.delete();
      }
    } on FirebaseAuthException catch (e) {
      print('Delete account error: ${e.message}');
      throw e;
    }
  }

  // Update user email
  Future<void> updateEmail(String newEmail) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.verifyBeforeUpdateEmail(newEmail); // Use verifyBeforeUpdateEmail
        // await updateEmail(user, newEmail); // This is for web, not Flutter
        await user.sendEmailVerification();
      }
    } on FirebaseAuthException catch (e) {
      print('Update email error: ${e.message}');
      throw e;
    }
  }

  // Update user password
  Future<void> updatePassword(String newPassword) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);
      }
    } on FirebaseAuthException catch (e) {
      print('Update password error: ${e.message}');
      throw e;
    }
  }

  // Reauthenticate user (required for sensitive operations)
  Future<void> reauthenticateWithPassword(String password) async {
    try {
      User? user = _auth.currentUser;
      if (user != null && user.email != null) {
        AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!,
          password: password,
        );
        await user.reauthenticateWithCredential(credential);
      }
    } on FirebaseAuthException catch (e) {
      print('Reauthentication error: ${e.message}');
      throw e;
    }
  }

}
