import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebaseauth/firebase_options.dart';
import 'package:flutter_firebaseauth/screens/email_password_login.dart';
import 'package:flutter_firebaseauth/screens/email_password_signup.dart';
import 'package:flutter_firebaseauth/screens/phone_screen.dart';

import 'screens/login_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter firebase auth Demo',
      theme: ThemeData(
       primaryColor: Colors.blue,
      ),
      home: const LoginScreen(),
      routes: {
        EmailPasswordLogin.routeName : (context) => const EmailPasswordLogin(),
        EmailPasswordSignUp.routeName : (context) => const EmailPasswordSignUp(),
        PhoneScreen.routeName:(context)=> const PhoneScreen(),
      },
    );
  }
}

