import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kind_heart/screens/main/register.dart';
import 'package:kind_heart/screens/main/splash.dart';
import 'package:kind_heart/screens/nav bar/nav.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff3a57e8),
      ),
      home: SplashScreen(),
    );
  }
}
