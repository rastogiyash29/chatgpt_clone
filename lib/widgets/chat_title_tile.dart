import 'package:flutter/material.dart';

class ChatTitleTile extends StatelessWidget {
  final String chatTitle;

  ChatTitleTile({required this.chatTitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MediaQuery.of(context).platformBrightness == Brightness.light?Colors.grey.shade200:Colors.grey.shade900,
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
      child: Text(
        chatTitle,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w400,
            color: MediaQuery.of(context).platformBrightness == Brightness.light
                ? Colors.black
                : Colors.white),
      ),
    );
  }
}
