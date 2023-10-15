import 'package:flutter/cupertino.dart';
import 'package:messag_app/src/controller/provider.dart';
import 'package:messag_app/src/page/sign_in_page.dart';
import 'package:messag_app/src/page/sign_up_page.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProFunc>(context);
    final reversedPage = Provider.of<ProFunc>(context).pages;
    if(reversedPage){
      return SignIn(onTap: provider.changePages);
    }else{
      return SignUpPage(onTap: provider.changePages);
    }
  }
}
