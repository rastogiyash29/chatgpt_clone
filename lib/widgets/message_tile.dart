import 'package:flutter/material.dart';
import '../models/chat_message.dart';
import '../utils/sender_enum.dart';

class MessageTile extends StatelessWidget {
  final ChatMessage chatMessage;

  MessageTile({required this.chatMessage});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double iconPadding = width * 0.01;
    double iconSize=width*0.05;
    return Padding(
      padding:  EdgeInsets.only(bottom: iconSize),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(iconPadding),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: chatMessage.sender == Sender.bot ? (MediaQuery.of(context).platformBrightness==Brightness.light?Colors.black:Colors.white) : Colors.orangeAccent),
            child: Icon(
              chatMessage.sender==Sender.bot? Icons.model_training:Icons.person,
              color: chatMessage.sender==Sender.bot? (MediaQuery.of(context).platformBrightness==Brightness.light?Colors.white:Colors.black):Colors.white,
              size: iconSize,
            ),
          ),
          SizedBox(width: iconSize/2,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(chatMessage.sender==Sender.bot? 'ChatGPT':'You',style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight:FontWeight.w500),),
                Text(chatMessage.message),
              ],
            ),
          )
        ],
      ),
    );
  }
}
