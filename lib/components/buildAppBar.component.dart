import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Text(
      "TCP Knowledge Sharing",
      style: TextStyle(
        color: Colors.black,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.black, //change your color here
    ),
    backgroundColor: Colors.white,
  );
}