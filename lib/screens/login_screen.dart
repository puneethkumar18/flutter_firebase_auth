import "package:flutter/material.dart";
import 'package:flutter_firebaseauth/screens/email_password_login.dart';
import "package:flutter_firebaseauth/screens/email_password_signup.dart";
import "package:flutter_firebaseauth/screens/phone_screen.dart";
import "package:flutter_firebaseauth/widgets/custom_button.dart";

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomButton(
              onTap: (){
                Navigator.pushNamed(context, EmailPasswordLogin.routeName);
              },
              text: "LoginScreen",
              ),
              const SizedBox(height:10),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, EmailPasswordSignUp.routeName);
              },
              text: "SighUpScreen",
            ),
            const SizedBox(height: 10),
            CustomButton(
              onTap:(){
                 Navigator.pushNamed(context, PhoneScreen.routeName);
              },
              text: "Phone",
            ),
            const SizedBox(height: 10),
            CustomButton(
              onTap: () {},
              text: "Google",
            ),
          ],
        ),
      ),
    );
  }
}