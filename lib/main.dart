import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:messag_app/firebase_options.dart';
import 'package:messag_app/src/service/notification_service.dart';
import 'src/widget/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  NotificationService()
    ..requestPermission()
    ..generateToken();
  runApp(
    const MyApplication(),
  );
}
