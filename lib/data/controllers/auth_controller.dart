import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn/data/controllers/base_controller.dart';

final authController =
    ChangeNotifierProvider<AuthController>((ref) => AuthController());

class AuthController extends BaseChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String verificationId;
  String phone = '';

    // Getter to access current user
  User? get currentUser => _auth.currentUser;

  Future<void> verifyPhoneNumber(
      String phoneNumber,
      BuildContext context,
      void Function(String verificationId, String phone)
          navigateToVerifyCode) async {
    log("Number for verification >> $phoneNumber");
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            log('The provided phone number is not valid.');
          } else {
            log("Error is >> ${e.code}");
            log("Situation:: $e");
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          this.verificationId = verificationId;
          navigateToVerifyCode(verificationId, phoneNumber);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          this.verificationId = verificationId;
        },
        timeout: const Duration(seconds: 60),
      );
    } catch (e) {
      log("Verification failed: $e");
    }
  }

  Future<void> verifyCode(
      String smsCode, BuildContext context, void Function() onSuccess) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      if (userCredential.user != null) {
        onSuccess();
      }
    } catch (e) {
      log('Error verifying code: $e');
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Invalid verification code. Please try again."),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> resendCode(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        log('Verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) async {
        this.verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId = verificationId;
      },
    );
  }

  Future<bool> updateDisplayName(String displayName) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updateDisplayName(displayName);
        await user.reload(); // Reload the user to update the display name
        user = _auth.currentUser; // Update the user reference
        log('Display name updated to: $displayName');
        log('updated display name is >> ${user?.displayName}');
        return true;
      }
      return true;
    } catch (e) {
      log('Error updating display name: $e');
      return false;
    }
  }

  Future<void> updateEmail(String email) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.verifyBeforeUpdateEmail(email);
        await user
            .sendEmailVerification(); // Send email verification after update
        await user.reload(); // Reload the user to update the email
        user = _auth.currentUser; // Update the user reference
        log('Email updated to: $email');
      }
    } catch (e) {
      log('Error updating email: $e');
    }
  }
}
