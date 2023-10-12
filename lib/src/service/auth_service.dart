import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseStorage = FirebaseFirestore.instance;

  Future<UserCredential> signIn(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      firebaseStorage.collection("users").doc(userCredential.user!.uid).set({
        "uid" : userCredential.user!.uid,
        "email": email
      }, SetOptions(merge: true));

      return userCredential;

    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<UserCredential> signUp(String email, String password) async {
    try {
      UserCredential userCredential =
       await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password
      );
      firebaseStorage.collection("users").doc(userCredential.user!.uid).set({
        "uid" : userCredential.user!.uid,
        "email": email
      });

      return userCredential;

    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> logOut() async  {
    return await FirebaseAuth.instance.signOut();
  }
}
