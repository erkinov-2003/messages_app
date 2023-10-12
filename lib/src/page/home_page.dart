import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  void logOut() async {
    final service = Provider.of<AuthService>(context, listen: false);
    service.logOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            onPressed: logOut,
            icon: const Icon(
              Icons.login,
              size: 30,
            ),
          ),
        ],
      ),
      body: _userBuildList(),
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
        title: Text(data["email"]),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ChatPage(userEmail: data["email"], userId: data["uid"]),
          ),
        ),
      );
    }else{
      return Container();
    }
  }
}
