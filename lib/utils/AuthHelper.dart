import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../service/AuthService.dart';
import '../providers/AppStateManager.dart';
import '../models/Userdata.dart';
import 'Alerts.dart';

class AuthHelper {
  static final AuthService _authService = AuthService();

  /// Check if user is currently authenticated with Firebase
  static bool get isFirebaseAuthenticated => _authService.isAuthenticated;

  /// Get current Firebase user
  static User? get currentFirebaseUser => _authService.currentUser;

  /// Stream of Firebase authentication state changes
  static Stream<User?> get authStateChanges => _authService.authStateChanges;

  /// Check if user is logged into the app (has user data in app state)
  static bool isAppAuthenticated(BuildContext context) {
    final appManager = Provider.of<AppStateManager>(context, listen: false);
    return appManager.userdata != null && appManager.userdata!.email != "";
  }

  /// Get current app user data
  static Userdata? getCurrentAppUser(BuildContext context) {
    final appManager = Provider.of<AppStateManager>(context, listen: false);
    return appManager.userdata;
  }

  /// Sign in with Firebase and sync with app state
  static Future<bool> signInWithFirebase(BuildContext context, String email, String password) async {
    try {
      UserCredential? userCredential = await _authService.signInWithEmailAndPassword(email, password);
      
      if (userCredential != null && userCredential.user != null) {
        // Check if email is verified
        if (!userCredential.user!.emailVerified) {
          Alerts.show(context, "Email Verification Required", 
            "Please verify your email address before signing in. Check your inbox for the verification link.");
          return false;
        }
        
        print('Firebase sign-in successful for: ${userCredential.user!.email}');
        return true;
      }
      
      return false;
    } on FirebaseAuthException catch (e) {
      _handleFirebaseAuthError(context, e);
      return false;
    } catch (e) {
      print('Unexpected sign-in error: $e');
      Alerts.show(context, "Error", "An unexpected error occurred during sign-in.");
      return false;
    }
  }

  /// Sign out from both Firebase and app state
  static Future<void> signOut(BuildContext context) async {
    try {
      // Sign out from Firebase
      await _authService.signOut();
      
      // Clear app state
      final appManager = Provider.of<AppStateManager>(context, listen: false);
      await appManager.unsetUserData();
      
      print('User signed out successfully');
    } catch (e) {
      print('Error during sign out: $e');
      // Still try to clear app state even if Firebase sign out fails
      final appManager = Provider.of<AppStateManager>(context, listen: false);
      await appManager.unsetUserData();
    }
  }

  /// Send password reset email using Firebase
  static Future<bool> sendPasswordReset(BuildContext context, String email) async {
    try {
      await _authService.sendPasswordResetEmail(email);
      Alerts.show(context, "Success", 
        "Password reset email sent! Please check your inbox and follow the instructions.");
      return true;
    } on FirebaseAuthException catch (e) {
      _handleFirebaseAuthError(context, e);
      return false;
    } catch (e) {
      print('Unexpected password reset error: $e');
      Alerts.show(context, "Error", "An unexpected error occurred. Please try again.");
      return false;
    }
  }

  /// Create account with Firebase
  static Future<bool> createAccount(BuildContext context, String email, String password) async {
    try {
      String? result = await _authService.signUp(email, password);
      
      if (result != null) {
        Alerts.show(context, "Account Created", result);
        return true;
      }
      
      return false;
    } on FirebaseAuthException catch (e) {
      _handleFirebaseAuthError(context, e);
      return false;
    } catch (e) {
      print('Unexpected account creation error: $e');
      Alerts.show(context, "Error", "An unexpected error occurred during account creation.");
      return false;
    }
  }

  /// Check if current user's email is verified
  static Future<bool> isEmailVerified() async {
    return await _authService.isEmailVerified();
  }

  /// Resend email verification
  static Future<void> resendEmailVerification(BuildContext context) async {
    try {
      await _authService.resendVerificationEmail();
      Alerts.show(context, "Verification Email Sent", 
        "A new verification email has been sent. Please check your inbox.");
    } catch (e) {
      print('Error resending verification email: $e');
      Alerts.show(context, "Error", "Failed to send verification email. Please try again.");
    }
  }

  /// Update user password
  static Future<bool> updatePassword(BuildContext context, String currentPassword, String newPassword) async {
    try {
      // First reauthenticate the user
      await _authService.reauthenticateWithPassword(currentPassword);
      
      // Then update the password
      await _authService.updatePassword(newPassword);
      
      Alerts.show(context, "Success", "Password updated successfully.");
      return true;
    } on FirebaseAuthException catch (e) {
      _handleFirebaseAuthError(context, e);
      return false;
    } catch (e) {
      print('Unexpected password update error: $e');
      Alerts.show(context, "Error", "An unexpected error occurred while updating password.");
      return false;
    }
  }

  /// Update user email
  static Future<bool> updateEmail(BuildContext context, String password, String newEmail) async {
    try {
      // First reauthenticate the user
      await _authService.reauthenticateWithPassword(password);
      
      // Then update the email
      await _authService.updateEmail(newEmail);
      
      Alerts.show(context, "Email Updated", 
        "Email updated successfully. Please verify your new email address.");
      return true;
    } on FirebaseAuthException catch (e) {
      _handleFirebaseAuthError(context, e);
      return false;
    } catch (e) {
      print('Unexpected email update error: $e');
      Alerts.show(context, "Error", "An unexpected error occurred while updating email.");
      return false;
    }
  }

  /// Delete user account
  static Future<bool> deleteAccount(BuildContext context, String password) async {
    try {
      // First reauthenticate the user
      await _authService.reauthenticateWithPassword(password);
      
      // Clear app state first
      final appManager = Provider.of<AppStateManager>(context, listen: false);
      await appManager.unsetUserData();
      
      // Then delete the Firebase account
      await _authService.deleteAccount();
      
      Alerts.show(context, "Account Deleted", "Your account has been deleted successfully.");
      return true;
    } on FirebaseAuthException catch (e) {
      _handleFirebaseAuthError(context, e);
      return false;
    } catch (e) {
      print('Unexpected account deletion error: $e');
      Alerts.show(context, "Error", "An unexpected error occurred while deleting account.");
      return false;
    }
  }

  /// Handle Firebase authentication errors with user-friendly messages
  static void _handleFirebaseAuthError(BuildContext context, FirebaseAuthException e) {
    String errorMessage;
    
    switch (e.code) {
      case 'user-not-found':
        errorMessage = "No account found with this email address.";
        break;
      case 'wrong-password':
        errorMessage = "Incorrect password. Please try again.";
        break;
      case 'invalid-email':
        errorMessage = "Invalid email address format.";
        break;
      case 'user-disabled':
        errorMessage = "This account has been disabled.";
        break;
      case 'too-many-requests':
        errorMessage = "Too many failed attempts. Please try again later.";
        break;
      case 'operation-not-allowed':
        errorMessage = "This sign-in method is not enabled.";
        break;
      case 'weak-password':
        errorMessage = "Password is too weak. Please choose a stronger password.";
        break;
      case 'email-already-in-use':
        errorMessage = "An account already exists with this email address.";
        break;
      case 'requires-recent-login':
        errorMessage = "Please sign in again to perform this action.";
        break;
      case 'network-request-failed':
        errorMessage = "Network error. Please check your internet connection.";
        break;
      default:
        errorMessage = e.message ?? "An authentication error occurred.";
    }
    
    print('Firebase Auth Error: ${e.code} - ${e.message}');
    Alerts.show(context, "Authentication Error", errorMessage);
  }

  /// Initialize authentication state listener
  static void initializeAuthStateListener(BuildContext context) {
    authStateChanges.listen((User? user) {
      if (user == null) {
        print('User signed out from Firebase');
        // Optionally clear app state when Firebase user signs out
        final appManager = Provider.of<AppStateManager>(context, listen: false);
        if (appManager.userdata != null) {
          appManager.unsetUserData();
        }
      } else {
        print('User signed in to Firebase: ${user.email}');
        print('Email verified: ${user.emailVerified}');
      }
    });
  }
}