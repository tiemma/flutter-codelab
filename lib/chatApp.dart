import 'chatScreen.dart';
import 'package:flutter/material.dart';


class ChatApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'IO Extended',
      theme: new ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: new ChatScreen()
    );
  }
}