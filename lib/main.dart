import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:messag_app/firebase_options.dart';
import 'package:messag_app/src/page/sign_in_page.dart';
import 'package:messag_app/src/service/auth_service.dart';
import 'package:provider/provider.dart';

import 'src/widget/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: const MyApplication(),
    ),
  );
}