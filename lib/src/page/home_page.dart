import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messag_app/src/page/sign_in_page.dart';
import 'package:provider/provider.dart';

import '../service/auth_service.dart';
import 'chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final service = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final logOut = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("WELCOME TO USER PAGE"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              logOut.logOut();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignInPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.login,
              size: 30,
            ),
          ),
        ],
      ),
      body: _userBuildList(),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          children: [],
        ),
      ),
    );
  }

  Widget _userBuildList() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("users").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error snapshot data");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        return ListView(
          children:
              snapshot.data!.docs.map((e) => _buildUserListItem(e)).toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
    if (service.currentUser!.email != data["email"]) {
      return ListTile(
        title: Card(
          child: SizedBox(
            height: 50,
            child: Center(
              child: Text(
                data["email"],
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                ),
              ),
            ),
          ),
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ChatPage(userEmail: data["email"], userId: data["uid"]),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
