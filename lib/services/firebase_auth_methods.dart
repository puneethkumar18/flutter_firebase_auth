// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebaseauth/utils/showotpdilouge.dart';

import '../utils/show_snackaar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  //signup function
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //Email verification message
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

//Login with email and password
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (!_auth.currentUser!.emailVerified) {
        await sendEmailVerification(context);
      }
      showSnackBar(context, "Successfullly login!!");
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //phone number verification
  Future<void> phoneSignIn({
    required String phoneNumber,
    required BuildContext context,
  }) async {
    TextEditingController codeController = TextEditingController();
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (e) {
        showSnackBar(context, e.toString());
      },
      codeSent: (String verificationId, int? resendtoken) {
        showOtpDialouge(
          context: context,
          controller: codeController,
          onPressed: () async {
            PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationId,
              smsCode: codeController.text.trim(),
            );
            await _auth.signInWithCredential(credential);
            Navigator.of(context).pop();
          },
        );
      },
      codeAutoRetrievalTimeout: (String credential) {
        //
      },
    );
  }
}
