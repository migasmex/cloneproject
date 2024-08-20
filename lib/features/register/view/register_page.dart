import 'package:flutter/material.dart';
import 'package:spotify/features/news/view/news_page.dart';
import 'package:spotify/features/login/view/login_page.dart';
import 'package:spotify/features/register/widgets/register.dart';
import 'package:spotify/services/auth/service_auth.dart';
import 'package:spotify/services/database/database_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _db = DatabaseService();
  final _auth = AuthService();

  void register() async {
    if (passwordContoller.text == confirmPasswordContoller.text) {
      ShowLoadingCircle(context);
      try {
        await _auth.registerEmailPassword(
            emailContoller.text, passwordContoller.text);

        if (mounted) {
          hideLoadingCircle(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }

        await _db.saveUserInfoInFirebase(
            name: nameContoller.text, email: emailContoller.text);
      } catch (e) {
        if (mounted) hideLoadingCircle(context);
        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(title: Text(e.toString())),
          );
        }
      }
    } else {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Password don't match"),
          ),
        );
      }
    }
  }

  final TextEditingController nameContoller = TextEditingController();
  final TextEditingController confirmPasswordContoller =
      TextEditingController();
  final TextEditingController emailContoller = TextEditingController();
  final TextEditingController passwordContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Icon(
                    Icons.lock_open_rounded,
                    size: 72,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text("Create an account",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16,
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  CustomTextField(
                      controller: nameContoller,
                      hintText: "Enter name",
                      obscureText: false),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      controller: emailContoller,
                      hintText: "Enter email",
                      obscureText: false),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: passwordContoller,
                    hintText: "Enter password",
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: confirmPasswordContoller,
                    hintText: "Confirm password",
                    obscureText: true,
                  ),
                  SizedBox(height: 10),
                  CustomButton(
                    text: "Sign in",
                    onTap: register,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already a member?",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Text(
                            "Login now",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
