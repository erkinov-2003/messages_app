import 'package:flutter/cupertino.dart';
import 'package:messag_app/src/page/sign_in_page.dart';
import 'package:messag_app/src/page/sign_up_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  bool reversedPage = true;

  void reversedButton(){
    setState(() {
      reversedPage =! reversedPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(reversedPage){
      return SignIn(onTap: reversedButton);
    }else{
      return SignUpPage(onTap: reversedButton);
    }
  }
}
