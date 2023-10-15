import 'package:flutter/material.dart';
import 'package:messag_app/src/controller/provider.dart';
import 'package:messag_app/src/page/splash_page.dart';

import 'package:provider/provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => ProFunc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
