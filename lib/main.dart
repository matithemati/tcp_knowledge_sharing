import 'package:flutter/material.dart';
import 'package:tcp_knowledge_sharing/screens/loading.screen.dart';
import 'package:tcp_knowledge_sharing/screens/loginSelect.screen.dart';

void main() {
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
      home: LoadingScreen()
    );
  }
}

