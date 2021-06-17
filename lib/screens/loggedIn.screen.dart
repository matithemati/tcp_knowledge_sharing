import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tcp_knowledge_sharing/components/SignInButton.component.dart';
import 'package:tcp_knowledge_sharing/components/buildAppBar.component.dart';
import 'package:tcp_knowledge_sharing/screens/loading.screen.dart';
import 'package:tcp_knowledge_sharing/screens/loginSelect.screen.dart';
import 'package:tcp_knowledge_sharing/services/auth.service.dart';

class LoggedInScreen extends StatefulWidget {
  const LoggedInScreen({Key? key}) : super(key: key);

  @override
  _LoggedInScreenState createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen> {
  User? user;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  getCurrentUser() async {
    User? fireBaseUser = await AuthService().getUser();
    setState(() {
      this.user = fireBaseUser;
      this.isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: isLoading
            ? LoadingScreen()
            : Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (this.user!.isAnonymous)
                        SvgPicture.asset(
                          "assets/anonymous.svg",
                          height: 200,
                        ),
                      if (!this.user!.isAnonymous &&
                          this.user!.photoURL != null)
                        Image.network(this.user!.photoURL.toString()),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Logged in as:",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        this.user!.email != null
                            ? this.user!.email.toString()
                            : this.user!.uid,
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SignInButton(
                        onTap: () {
                          print(this.user.toString());
                        },
                        imageUrl: "assets/user.svg",
                        text: "Print user object",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SignInButton(
                        onTap: () async {
                          try {
                            await AuthService().signOut();
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => LoginSelectScreen()),
                              (Route<dynamic> route) => false,
                            );
                          } catch (e) {
                            print(e);
                          }
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
