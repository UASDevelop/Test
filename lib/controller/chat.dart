import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Models/chatmodel.dart';

class ChatController extends GetxController {
  TextEditingController messageController = TextEditingController();
  RxList<ChatMessage> messages = <ChatMessage>[].obs;

  @override
  void onInit() {
    // Initialize with some dummy messages (remove this in production)
    messages.addAll([
      ChatMessage(
        isMe: true,
        message:
        'Lorem ipsum dolor sit amet consectetur. Nisl id mattis hac quisque sed. Nec massa dui malesuada et urna. Vel ultricies ipsum nec nibh quam habitant eget massa dui. In eu ac curabitur mattis. Neque diam.',
        time: DateTime.now(),
      ),
      ChatMessage(
        isMe: false,
        message: 'I\'m good, thanks!',
        time: DateTime.now().add(Duration(minutes: 1)),
      ),
    ]);
    super.onInit();
  }

  void sendMessage() {
    String messageText = messageController.text.trim();
    if (messageText.isNotEmpty) {
      ChatMessage newMessage = ChatMessage(
        isMe: true,
        message: messageText,
        time: DateTime.now(),
      );
      messages.add(newMessage);
      messageController.clear();
    }
  }
}