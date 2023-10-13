import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messag_app/src/page/home_page.dart';
import 'package:messag_app/src/page/sign_in_page.dart';
import 'package:provider/provider.dart';
import '../controller/provider.dart';
import '../service/auth_service.dart';
import '../view/button_view.dart';
import '../view/text_fild_view.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey2 = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future signUp() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 32, 45),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xFF9F28CC),
        title: const Text("Sign Up"),
      ),
      body: Form(
        key: _formKey2,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                "Welcome back! Glad\nto see you, Again!",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 35,
                ),
              ),
              const SizedBox(height: 60),
              CustomTextFild(
                hintText: "your email",
                validator: (p0) =>
                    Provider.of<ProFunc>(context, listen: false).nameUp(p0),
              ),
              const SizedBox(height: 20),
              CustomTextFild(
                controller: emailController,
                hintText: "your email",
                validator: (p0) =>
                    Provider.of<ProFunc>(context, listen: false).emailUp(p0),
              ),
              const SizedBox(height: 20),
              CustomTextFild(
                controller: passwordController,
                hintText: "password",
                validator: (p0) =>
                    Provider.of<ProFunc>(context, listen: false).passwordUp(p0),
              ),
              const Spacer(),
              CustomElevatedButton(
                text: "LogUp",
                onPressed: () {
                  if (_formKey2.currentState!.validate()) {
                    createUserWithEmailAndPassword();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignIn(),
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
                        text: " SingIn now",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> createUserWithEmailAndPassword() async {
    await Auth().createUserWithEmailAndPassword(
      email: emailController.value.text,
      password: passwordController.value.text,
    );
  }
}
