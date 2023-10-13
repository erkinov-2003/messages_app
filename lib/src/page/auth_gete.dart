import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messag_app/src/page/home_page.dart';
import 'package:messag_app/src/page/sign_in_page.dart';
import 'package:messag_app/src/page/sign_up_page.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return const HomePage();
          }
          if(snapshot.hasData) {
            return const SignUpPage();
          }else{
            return const SignInPage();
          }
        },
      ),
    );
  }
}
