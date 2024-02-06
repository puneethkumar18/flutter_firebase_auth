import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebaseauth/services/firebase_auth_methods.dart';

import '../widgets/custom_text_field.dart';

class EmailPasswordSignUp extends StatefulWidget {
  static const String routeName = '/email-password-sigup';
  const EmailPasswordSignUp({super.key});

  @override
  State<EmailPasswordSignUp> createState() => _EmailPasswordSignUpState();
}

class _EmailPasswordSignUpState extends State<EmailPasswordSignUp> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void signUpUser() async {
    await FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
      email: _emailController.text,
      password: _passwordController.text,
      context: context,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: _emailController,
              text: "Enter your Email",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomTextField(
              controller: _passwordController,
              text: "Enter your Password",
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: signUpUser,
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.blue),
              minimumSize: MaterialStatePropertyAll(
                Size(double.infinity, 50),
              ),
              textStyle: MaterialStatePropertyAll(
                TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            child: const Text(
              "SignUp",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
