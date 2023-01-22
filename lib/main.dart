import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:mobile_project/firebase_options.dart';
import 'package:mobile_project/language.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'login_page.dart';
import 'package:flutter/material.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //FlutterNativeSplash.removeAfter(initialization);
  runApp(const MyApp());
}

/*Future initialization(BuildContext? contex) async {
  await Future.delayed(Duration(seconds: 10));
}*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Messages(),
      // ignore: unnecessary_const
      home: LoginPage(),
    );
  }
}
