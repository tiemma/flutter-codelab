import 'package:flutter/material.dart';
import 'chatScreen.dart';
import 'chatMessage.dart';


class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin{

  //List of all messages within our application
  final List<ChatMessage> _messages = <ChatMessage>[];

  //This is the text editing controller which allows us enter messages
  //into our application. They are similar to a normal text field in HTML
  final TextEditingController _textController = new TextEditingController();

  //This is a boolean flag that allows us know when the user is typing
  bool _isComposing = false;

  //Method to handle the user submitting the message
  void _handleSubmit(String text){

    //Clear the text in the input field
    _textController.clear();

    //Create an instance of our message class
    ChatMessage message = new ChatMessage(

      //This is the text from our text field
      text: text,

      //This the animation controller that animates the messages sending
      animationController: new AnimationController(

        duration: new Duration(milliseconds: 700),
        vsync: this
      )
    );

    //For those who've done react, you'd remember this
    //Flutter is a reactive framework meaning that it updates
    //due to certain triggers making it easy to bind function calls
    //to events e.g StateChange, textInput etc
    setState(() {
      //Insert the messages into the messages array
        _messages.insert(0, message);
    });

    //This is what clears up the animations we have in our application
    //This is so that we don't have animations running in the background
    //once the transition is done
    //It's an effective way to clear up memory
    @override
    void dispose() {
      //Loop through messages and clear up the animation events in them
      for (ChatMessage message in _messages)
        message.animationController.dispose();

      //This calls the dispose method in the inherited class
      //TickerProviderStateMixin
      //and clears up the Ticker events in there too...
      super.dispose();
    } 

    //We then set the animation to run
    //The dispose method would clear up the animation events
    //once it's done
    message.animationController.forward();
  }


  /**
   * This is the method that is called on every widget build
   * We define what we want the widget to be from here
   * It's similar to the render method in React
   *
   * //REACT and Flutter do share similar qualities
   */
  @override
    Widget build(BuildContext context){
    //This is the scaffold command
    //It's useful for defining templates such as app  bars, snack bars and the likes
      return  new Scaffold(
        body: new Column(
          children: <Widget>[
            //This takes up as much space as is available
            new Flexible(
              //This is used to generate messages on the fly
              //and insert them into the app layout
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length
              )
            ),
            //This is similar to an hr<Horizontal Rule> in HTML
            //Just a line to indicate a division
            new Divider(height: 1.0),
            //A fixed width section that doesn't increase in width once created
            new Container(
              decoration: new BoxDecoration(color: Theme.of(context).accentColor),
              child: _buildTextComposer()
            )
          ]
        ),
        //This is the app bar of our application that holds the title we see
        appBar: new AppBar(
          title: new Text('iO Extended')
          )
        );
  }

  //This is the widget that we use to create the text field
  Widget _buildTextComposer(){ 
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container (
        //Add a margin of 8 on both sides
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
