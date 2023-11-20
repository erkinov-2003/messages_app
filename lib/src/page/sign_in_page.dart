import 'package:flutter/material.dart';
import 'package:messag_app/src/service/auth_service.dart';
import 'package:messag_app/src/view/text_fild_view.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key, this.onTap});

  final Function()? onTap;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  Future signIn() async {
    if (passwordController.text.isEmpty && emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Iltimos bosh qoldirmang"),
        ),
      );
    } else {
      final service = Auth().signIn(
        email: emailController.text,
        password: passwordController.text,
      );
      return service;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 32, 45),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(right: 15, left: 15, top: 85),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "LOGIN HERE ",
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
                    "Welcome back you’ve been missed",
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
                const SizedBox(height: 30),
                CustomTextFild(
                  hintText: "enter your password",
                  counterText: "Forgot your password",
                  controller: passwordController,
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
                  onPressed: signIn,
                  child: const Text(
                    "SIGN IN",
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
                      "Don’t have an account ? ",
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
                        "Sign Up",
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
