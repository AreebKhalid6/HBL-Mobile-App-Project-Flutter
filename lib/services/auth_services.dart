import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices {
  Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      // show loading
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      // try logging in
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: email,
              password: password,
            )
            .whenComplete(() => Navigator.pop(context));
      } on FirebaseAuthException catch (e) {
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(e.code),
          ),
        );
      } catch (e) {
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(e.toString()),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text("Enter credentials.. !!"),
        ),
      );
    }
  }

  Future<void> signUp({
    required BuildContext context,
    required String fullName,
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (email.isNotEmpty &&
        password.isNotEmpty &&
        userName.isNotEmpty &&
        confirmPassword.isNotEmpty) {
      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text("Password don't match...!!!"),
          ),
        );
      } else {
        // show loading
        showDialog(
          context: context,
          builder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );

        // try logging in
        try {
          UserCredential? userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password)
              .whenComplete(() => Navigator.pop(context));

          createUserDocument(userCredential, userName, fullName);
          // ignore: use_build_context_synchronously
        } on FirebaseAuthException catch (e) {
          // ignore: use_build_context_synchronously
          Navigator.pop(context);
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(e.code),
            ),
          );
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text("Enter values...!!!"),
        ),
      );
    }
  }

  createUserDocument(
      UserCredential userCredential, String userName, String fullName) async {
    if (userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'username': userName,
        'fullName': fullName,
      });
    }
  }

  updateUserDocument(User user, String userName, String fullName) async {
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user.email)
          .update({
        'email': user.email,
        'username': userName,
        'fullName': fullName,
      });
    }
  }

  createResumeDocument(User user, String userName, String fullName) async {
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('Resume')
          .doc(user.email)
          .set({
        'email': user.email,
        'username': userName,
        'fullName': fullName,
      });
    }
  }
}
