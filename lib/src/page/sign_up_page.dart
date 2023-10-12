// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:messag_app/src/page/home_page.dart';
import 'package:messag_app/src/page/sign_in_page.dart';
import 'package:provider/provider.dart';

import '../service/auth_service.dart';
import '../view/button_view.dart';
import '../view/text_fild_view.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confrimPasswordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confrimPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confrimPasswordController.dispose();
    super.dispose();
  }

  void signUp() async {
    if (_passwordController.text != _confrimPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Iltimos parolingizni bir xil kiriting!"),
        ),
      );
      return;
    }
    AuthService _authService = Provider.of<AuthService>(context, listen: false);
    try {
      await _authService.signUp(
          _emailController.text, _passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 70),
          CustomTextField(
            controller: _emailController,
            hintText: "Enter email address",
            obscureText: false,
          ),
          const SizedBox(height: 30),
          CustomTextField(
            controller: _passwordController,
            hintText: "Enter password",
            obscureText: false,
          ),
          const SizedBox(height: 30),
          CustomTextField(
            controller: _confrimPasswordController,
            hintText: "Enter confrim password",
            obscureText: false,
          ),
          const SizedBox(height: 50),
          CustomElevatedButton(
            text: "Sign Up",
            onPressed: () => signUp(),
          ),
          const SizedBox(height: 40),
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInPage(),
              ),
            ),
            child: const Text(
              "Sign in with",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 19,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
