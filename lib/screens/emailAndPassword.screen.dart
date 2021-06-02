import 'package:flutter/material.dart';
import 'package:tcp_knowledge_sharing/components/buildAppBar.component.dart';

import 'loggedIn.screen.dart';

class EmailAndPasswordScreen extends StatefulWidget {
  @override
  _EmailAndPasswordScreenState createState() => _EmailAndPasswordScreenState();
}

class _EmailAndPasswordScreenState extends State<EmailAndPasswordScreen> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Log in with email and password",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(5)),
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  onChanged: (val) => username = val,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Username"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(5)),
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  onChanged: (val) => password = val,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Password"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  print(username);
                },
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoggedInScreen()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Log in",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Icon(
                          Icons.login,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
