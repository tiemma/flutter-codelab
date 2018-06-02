import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  ChatMessage({this.text, this.animationController});


  final String text;
  final AnimationController animationController;

  String _name = "Bakare Emmanuel";

  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      // opacity: new CurvedAnimation(
      //   parent: animationController,
      //   curve: Curves.bounceInOut,
      // ),
      sizeFactor: new CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn),
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(child: new Text(_name[0])),
            ),
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(_name, style: Theme.of(context).textTheme.subhead),
                  new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: new Text(text),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}