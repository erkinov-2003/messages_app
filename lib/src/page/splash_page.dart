import "package:flutter/material.dart";
import "package:lottie/lottie.dart";
import "package:messag_app/src/page/examination.dart";
import "package:messag_app/src/page/register_page.dart";
import "package:messag_app/src/page/sign_in_page.dart";

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Examination(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          "assets/animation_lnnnw1kf.json",
          height: 270,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
