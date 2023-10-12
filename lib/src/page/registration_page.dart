import 'package:flutter/material.dart';
import 'package:messag_app/src/page/sign_in_page.dart';
import 'package:messag_app/src/page/sign_up_page.dart';
import 'package:messag_app/src/view/button_view.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "REGISTRATION",
              style: TextStyle(
                fontSize: 28,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 30),
            CustomElevatedButton(
              text: "Sign in",
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignInPage(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            CustomElevatedButton(
              text: "Sign Up",
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
