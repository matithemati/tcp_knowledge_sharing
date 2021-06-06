import 'package:flutter/material.dart';
import 'package:tcp_knowledge_sharing/components/buildAppBar.component.dart';
import 'package:tcp_knowledge_sharing/screens/loading.screen.dart';
import 'package:tcp_knowledge_sharing/services/auth.service.dart';
import 'loggedIn.screen.dart';

class EmailAndPasswordScreen extends StatefulWidget {
  @override
  _EmailAndPasswordScreenState createState() => _EmailAndPasswordScreenState();
}

class _EmailAndPasswordScreenState extends State<EmailAndPasswordScreen> {
  String email = "";
  String password = "";

  bool error = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: this.isLoading
            ? LoadingScreen()
            : Container(
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
                        onChanged: (val) => email = val,
                        obscureText: false,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Email"),
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
                    if (this.error)
                      Text(
                        "Error occurred while trying to log in.",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          this.isLoading = true;
                        });

                        bool result = await AuthService()
                            .signInWithEmailAndPassword(email, password);
                        if (result) {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => LoggedInScreen(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                        } else {
                          setState(() {
                            this.isLoading = false;
                            this.error = true;
                          });
                        }
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
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            Icon(
                              Icons.login,
                              color: Colors.white,
                            ),
                          ],
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
