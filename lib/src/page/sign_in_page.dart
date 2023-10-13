import 'package:flutter/material.dart';
import 'package:messag_app/src/page/home_page.dart';
import 'package:messag_app/src/page/sign_up_page.dart';
import 'package:messag_app/src/service/auth_service.dart';
import 'package:messag_app/src/view/button_view.dart';
import 'package:messag_app/src/view/text_fild_view.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signIn = Provider.of<AuthService>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: 170,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
            child: const Center(
              child: Text(
                "SIGN IN REGISTRATION",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 29,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
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
          const SizedBox(height: 50),
          CustomElevatedButton(
            text: "Sign In",
            onPressed: () {
              signIn.signIn(_emailController.text, _passwordController.text);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "registation with",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const SizedBox(width: 5),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpPage(),
                  ),
                ),
                child: const Text(
                  "Sign up with",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
