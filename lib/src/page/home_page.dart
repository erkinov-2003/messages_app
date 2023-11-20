import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messag_app/src/service/auth_service.dart';
import 'chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final service = FirebaseAuth.instance;
  final FirebaseFirestore store = FirebaseFirestore.instance;

  Future signOut() async {
    final service = Auth().signOut();
    return service;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 32, 45),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "MESSANGER",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                  IconButton(
                    onPressed: signOut,
                    icon: const Icon(
                      Icons.login,
                      size: 30,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: Container(
                height: 700,
                width: double.infinity,
                decoration:  BoxDecoration(
                  color: const Color.fromARGB(255, 41, 47, 63),
                  border: Border.all(color: Colors.white, width: 0.4),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: _userBuildList(),
              ),
            )
          ],
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
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.green,
            ),
          );
        }
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.only(top: 15),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children:
                  snapshot.data!.docs.map((e) => _buildUserListItem(e)).toList(),
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Widget _buildUserListItem(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
    if (service.currentUser!.email != data["email"]) {
      return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  userEmail: data["email"],
                  userId: data["uid"],
                ),
              ),
            );
          },
          title: Text(
            data["email"],
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
