import 'package:E_Soor/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:E_Soor/models/message_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  ChatScreen({this.user});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe){
    return Container(
      margin: isMe
      ? EdgeInsets.only(
        top:5,  bottom:5,left: 110, right: 10
      )
      :EdgeInsets.only(
        top: 5, bottom:5, right: 110, left: 10
      ),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15), 
      decoration: BoxDecoration(
      color: isMe
      ? Theme.of(context).primaryColor
      :null,
        borderRadius:  
      BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomLeft: Radius.circular(20),
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20)        
        ),
       border: isMe 
       ?null
       :Border.all(
         color: Colors.white
       )
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.time,
            style: TextStyle(
              fontWeight :FontWeight.w300  
            )
          ),
          SizedBox(height: 5),
          Text(
            message.text,
            style: TextStyle(
               fontSize: 15
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildMessageComposer(){
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          IconButton(
            iconSize: 25,
            icon: Icon(Icons.image),
            onPressed: (){

            }
          ),
          Expanded(
            child: TextField(
              maxLines: 5,
              minLines: 1,
              decoration: InputDecoration.collapsed(
                hintText: "Send Message"
              )
            ),
          ),
          IconButton(
            iconSize: 25,
            icon: Icon(Icons.send),
            onPressed: (){

            }
          ),         
        ],
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Omar Yehia",
          style:TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300  
          )
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.more_horiz)
          )
        ]
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)
                )
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)
                ),
                child: ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.only(top: 10),
                  itemCount: chats.length,
                  itemBuilder: (BuildContext context, int index){
                    final Message message = messages[index];
                    final bool isMe = message.sender.id == currentUser.id;
                    return _buildMessage(message, isMe);
                  },
                )
              )
            ),
          ),
          _buildMessageComposer()
        ],
      )
    );
  }
}