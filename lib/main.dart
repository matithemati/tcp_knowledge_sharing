import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tcp_knowledge_sharing/screens/loginSelect.screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginSelectScreen()
    );
  }
}
