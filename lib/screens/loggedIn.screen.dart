import 'package:flutter/material.dart';
import 'package:tcp_knowledge_sharing/components/SignInButton.component.dart';
import 'package:tcp_knowledge_sharing/components/buildAppBar.component.dart';
import 'package:tcp_knowledge_sharing/screens/loginSelect.screen.dart';

class LoggedInScreen extends StatelessWidget {
  const LoggedInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Logged in as:",
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  "ID: 32ngnsgs54",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 30,
                ),
                SignInButton(
                  onTap: () {},
                  imageUrl: "assets/user.svg",
                  text: "Print user object",
                ),
                SizedBox(
                  height: 10,
                ),
                SignInButton(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => LoginSelectScreen()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  imageUrl: "assets/logout.svg",
                  text: "Logout",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
