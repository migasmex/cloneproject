import 'package:flutter/material.dart';
import 'package:spotify/pages/login_page.dart';
import 'package:spotify/pages/register_page.dart';

class LoginOrReg extends StatefulWidget {
  const LoginOrReg({super.key});

  @override
  State<LoginOrReg> createState() => _LoginOrRegState();
}

class _LoginOrRegState extends State<LoginOrReg> {

  bool showLoginPage = true;

  void togglePages() {
    setState((){
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
      );
    } else {
      return RegisterPage(
      );
    }
  }
}