import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebaseauth/services/firebase_auth_methods.dart';
import 'package:flutter_firebaseauth/widgets/custom_button.dart';
import 'package:flutter_firebaseauth/widgets/custom_text_field.dart';

class PhoneScreen extends StatefulWidget {
  static const String routeName = "/phone-screen";
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final TextEditingController phonecontroller = TextEditingController();

  void phoneSignIn() async {
    await FirebaseAuthMethods(FirebaseAuth.instance).phoneSignIn(
      phoneNumber: phonecontroller.text.trim(),
      context: context,
    );
  }

  @override
  void dispose() {
    super.dispose();
    phonecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Phone Number",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 40,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: CustomTextField(
              text: "Enter your Phone Number",
              controller: phonecontroller,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            onTap: phoneSignIn,
            text: "SEND OTP",
          ),
        ],
      ),
    );
  }
}
