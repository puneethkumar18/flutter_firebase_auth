import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebaseauth/services/firebase_auth_methods.dart';
import 'package:flutter_firebaseauth/widgets/custom_button.dart';
import 'package:flutter_firebaseauth/widgets/custom_text_field.dart';

class EmailPasswordLogin extends StatefulWidget {
  static const String routeName = "/login-email-password";
  const EmailPasswordLogin({super.key});

  @override
  State<EmailPasswordLogin> createState() => _EmailPasswordLoginState();
}

class _EmailPasswordLoginState extends State<EmailPasswordLogin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void logInUser() async {
    await FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "LogIn",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: emailController,
              text: "Enter your Email",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomTextField(
              controller: passwordController,
              text: "Enter your Password",
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          CustomButton(
            onTap: logInUser,
            text: "login",
          ),
        ],
      ),
    );
  }
}
