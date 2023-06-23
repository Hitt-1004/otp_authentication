import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:otp_authentication/screens/contact.dart';
import 'package:otp_authentication/screens/lang.dart';
import 'package:otp_authentication/screens/signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const SelectLanguage(),
        "/contact": (context) => const Contact(),
        "/signin": (context) => const SignIn()
      },
    );
  }
}
