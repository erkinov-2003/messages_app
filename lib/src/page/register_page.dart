import 'package:flutter/material.dart';
import 'package:messag_app/src/page/sign_in_page.dart';
import 'package:messag_app/src/page/sign_up_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Image(
              image: AssetImage("assets/images/register_images.png"),
              height: 350,
              fit: BoxFit.cover,
            ),
          ),
          const Center(
            child: Text(
              "WELCOME TO REGISTER PAGE",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                fontSize: 23,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              "GO REGISTRATION WITH",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                fontSize: 23,
              ),
            ),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(140, 40),
                  backgroundColor: const Color(0xFF1F41BB),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignIn(),
                    ),
                  );
                },
                child: const Text(
                  "LOGIN",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(140, 40),
                  backgroundColor: const Color(0xFF1F41BB),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpPage(),
                    ),
                  );
                },
                child: const Text(
                  "REGISTER",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
