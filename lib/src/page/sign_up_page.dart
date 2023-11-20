import 'package:flutter/material.dart';

import 'package:messag_app/src/service/auth_service.dart';
import 'package:messag_app/src/view/text_fild_view.dart';

  class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, this.onTap});

  final Function()? onTap;

  @override
  State<SignUpPage> createState() => _SignInState();
  }

  class _SignInState extends State<SignUpPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }


  Future signUp() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Iltimos kataklarni bo'sh qoldirmang!"),
        ),
      );
    }

    if(!RegExp(r"^[a-z0-9](\.?[a-z0-9]){5,}@gmail\.com$").hasMatch(emailController.text)){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email error example: aziz@gmail.com"),
        ),
      );
    }

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Iltimos parolingizni bir xil kiriting"),
        ),
      );
      return;
    } else {
      final service = Auth().signUp(
        email: emailController.text,
        password: passwordController.text,
      );
      return service;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 27, 32, 45),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 85, right: 15, left: 15),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "REGISTER HERE",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    "Welcome back you’ve been missed!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                CustomTextFild(
                  hintText: "enter your email",
                  controller: emailController,
                ),
                const SizedBox(height: 20),
                CustomTextFild(
                  hintText: "enter your password",
                  counterText: "Forgot your password",
                  controller: passwordController,
                ),
                const SizedBox(height: 10),
                CustomTextFild(
                  hintText: "enter your password",
                  counterText: "Forgot your password",
                  controller: confirmPasswordController,
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(340, 55),
                    backgroundColor: const Color.fromARGB(255, 31, 65, 187),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  onPressed: signUp,
                  child: const Text(
                    "SIGN UP",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Im alerady an account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 7),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
