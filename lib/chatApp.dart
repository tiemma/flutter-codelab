import 'chatScreen.dart';
import 'package:flutter/material.dart';


class ChatApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /**
     * This creates a new material app
     * template with which our application
     * can run it
     */
    return new MaterialApp(
      //Title of the application
      title: 'IO Extended',
      //Theme the application can have
      theme: new ThemeData(
        primarySwatch: Colors.grey,
      ),
      //The default constructor our application can start from
        //This is where the application resides
      home: new ChatScreen()
    );
  }
}