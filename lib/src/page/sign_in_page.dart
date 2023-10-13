import 'package:flutter/material.dart';
import 'package:messag_app/src/page/home_page.dart';
import 'package:messag_app/src/page/sign_up_page.dart';
import 'package:provider/provider.dart';
import '../controller/provider.dart';
import '../service/auth_service.dart';
import '../view/button_view.dart';
import '../view/text_fild_view.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final bool isLogin = true;
  bool loading = false;
  final _formKey1 = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 32, 45),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xFF9F28CC),
        title: const Text("Sign In"),
      ),
      body: Form(
        key: _formKey1,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                "Welcome back! Glad\nto see you, Again!",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 35),
              ),
              const SizedBox(height: 60),
              CustomTextFild(
                controller: emailController,
                hintText: "your email",
                validator: (p0) =>
                    Provider.of<ProFunc>(context, listen: false).emailIn(p0),
              ),
              const SizedBox(height: 20),
              CustomTextFild(
                controller: passwordController,
                hintText: "password",
                validator: (p0) =>
                    Provider.of<ProFunc>(context, listen: false).passwordIn(p0),
              ),
              const Spacer(),
              CustomElevatedButton(
                text: "Login",
                onPressed: signInWithEmailAndPassword,
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUp(),
                    ),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "Don't have an account?",
                        ),
                        TextSpan(
                          text: " SingUp now",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signInWithEmailAndPassword() async {
    await Auth()
        .signInWithEmailAndPassword(
          email: emailController.value.text,
          password: passwordController.value.text,
        )
        .then(
          (value) => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          ),
        );
  }
}
