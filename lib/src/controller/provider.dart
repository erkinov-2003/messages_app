import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:messag_app/src/page/home_page.dart';


class ProFunc extends ChangeNotifier {
  String? errorMessage = "";

  Future<void> signInWithGoogle(BuildContext context) async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          await FirebaseAuth.instance.signInWithCredential(
            GoogleAuthProvider.credential(
              idToken: googleAuth.idToken,
              accessToken: googleAuth.accessToken,
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        } on FirebaseException catch (eror) {
          return print(eror.code);
        }
      }
    }
  }

  String? emailIn(value) {
    if (value != null && !RegExp(r".{6,}@gmail.com").hasMatch(value)) {
      return "enter your email correctly";
    }
    return null;
  }

  String? passwordIn(value) {
    if (value != null && !RegExp(r".{8,}").hasMatch(value)) {
      return 'at least 8 characters';
    }
    return null;
  }

  String? nameUp(value) {
    if (value != null && !RegExp(r".{3,}").hasMatch(value)) {
      return 'at least 3 characters';
    }
    return null;
  }

  String? emailUp(value) {
    if (value != null && !RegExp(r".{6,}@gmail.com").hasMatch(value)) {
      return "enter your email correctly";
    }
    return null;
  }

  String? passwordUp(value) {
    if (value != null && !RegExp(r".{8,}").hasMatch(value)) {
      return 'at least 8 characters';
    }
    return null;
  }
}
