import 'package:flutter/material.dart';
import 'chatScreen.dart';
import 'chatMessage.dart';


class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin{

  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;

  void _handleSubmit(String text){
    _textController.clear();

    ChatMessage message = new ChatMessage(
      text: text,
      animationController: new AnimationController(
        duration: new Duration(milliseconds: 700),
        vsync: this
      )
    );

    setState(() {
        _messages.insert(0, message);
    });

    @override
    void dispose() {
      for (ChatMessage message in _messages)
        message.animationController.dispose();
      super.dispose();
    } 


    message.animationController.forward();
  }

  @override
    Widget build(BuildContext context){
      return  new Scaffold(
        body: new Column(
          children: <Widget>[
            new Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length
              )
            ),
            new Divider(height: 1.0),
            new Container(
              decoration: new BoxDecoration(color: Theme.of(context).accentColor),
              child: _buildTextComposer()
            )
          ]
        ),
        appBar: new AppBar(
          title: new Text('iO Extended')
          )
        );
  }

  Widget _buildTextComposer(){ 
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container (
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[ 
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (String text){
                  setState((){
                    _isComposing = text.length > 0;
                  });
                },
                decoration: new InputDecoration.collapsed(
                  hintText: 'Send a message',
                  hintStyle: new TextStyle(color: Colors.black.withOpacity(0.4))
                ),
              )
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                color: Colors.black,
                onPressed: _isComposing ? () =>_handleSubmit(_textController.text) : null, 
              )
            )
          ],
        )
      )
    );
  }
}
