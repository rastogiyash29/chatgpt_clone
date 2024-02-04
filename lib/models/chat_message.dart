import '../utils/sender_enum.dart';

class ChatMessage{
  final String message;
  final Sender sender;
  ChatMessage({required this.message,required this.sender});
}