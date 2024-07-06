class ChatMessage {
  final bool isMe;
  final String message;
  final DateTime time;

  ChatMessage({
    required this.isMe,
    required this.message,
    required this.time,
  });
}