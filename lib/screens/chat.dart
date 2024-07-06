import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:testtest/constant/images.dart';

import '../Models/chatmodel.dart';
import '../controller/chat.dart';
import '../widgets/chat.dart';

class ChatScreen extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back(); // Navigate back using GetX navigation
          },
        ),
        title: Center(
          child: Text(
            'Bruno Pham',
            style: GoogleFonts.nunito(
                color: Color(0xff141414),
                fontSize: 16,
                fontWeight: FontWeight.w800),
          ),
        ), // Replace with dynamic username
        actions: [
          IconButton(
            icon: Image.asset(AppImages.settinng),
            onPressed: () {
              // Handle settings icon press
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
                  () => ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: chatController.messages.length,
                itemBuilder: (context, index) {
                  return ChatMessageWidget(
                    message: chatController.messages[index],
                  );
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF), // Background color of the container
              borderRadius: BorderRadius.circular(25.0), // Rounded corners
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Image.asset(AppImages.gallery),
                  onPressed: () {
                    // Handle camera button press
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: chatController.messageController,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Type something....',
                    ),
                    textInputAction: TextInputAction.send,
                    onSubmitted: (value) {
                      chatController.sendMessage();
                    },
                  ),
                ),
                IconButton(
                  icon: Image.asset("assets/images/bxs_send.png"),
                  onPressed: () {
                    chatController.sendMessage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

