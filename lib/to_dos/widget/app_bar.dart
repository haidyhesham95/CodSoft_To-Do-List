import 'package:flutter/material.dart';

AppBar noteAppBar(BuildContext context,String title) {
  return AppBar(
    backgroundColor: Colors.purple.shade200,
    centerTitle: true,
    title: Text(title),
    titleTextStyle: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
  );
}
