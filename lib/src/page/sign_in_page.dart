import 'package:flutter/material.dart';
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

  void signIn() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signIn(
        _emailController.text,
        _passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
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
          SizedBox(height: 70),
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
            onPressed: signIn,
          ),
          const SizedBox(height: 50),
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
                fontSize: 19,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
