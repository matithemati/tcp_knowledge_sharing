import 'package:flutter/material.dart';
import 'package:tcp_knowledge_sharing/components/SignInButton.component.dart';
import 'package:tcp_knowledge_sharing/components/buildAppBar.component.dart';
import 'package:tcp_knowledge_sharing/screens/emailAndPassword.screen.dart';
import 'package:tcp_knowledge_sharing/screens/loggedIn.screen.dart';
import 'package:tcp_knowledge_sharing/screens/register.screen.dart';

class LoginSelectScreen extends StatelessWidget {
  const LoginSelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SignInButton(
                  imageUrl: "assets/padlock.svg",
                  text: "Sign in with email and password",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmailAndPasswordScreen()));
                  }),
              SizedBox(
                height: 30,
              ),
              SignInButton(
                  imageUrl: "assets/register.svg",
                  text: "Sign up with email and password",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  }),
              SizedBox(
                height: 30,
              ),
              SignInButton(
                  imageUrl: "assets/anonymous.svg",
                  text: "Sign in anonymously",
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => LoggedInScreen(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  }),
              SizedBox(
                height: 30,
              ),
              SignInButton(
                  imageUrl: "assets/google-logo.svg",
                  text: "Sign in with Google",
                  onTap: () {
                    print("123");
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
