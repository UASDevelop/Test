import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../Models/chatmodel.dart';

class ChatMessageWidget extends StatelessWidget {
  final ChatMessage message;

  const ChatMessageWidget({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat.Hm().format(message.time);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment:
        message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!message.isMe)
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.png'),
              radius: 20.0,
            ),
          SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: message.isMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffECF3F6),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (message.message.isNotEmpty)
                        Text(
                          message.message,
                          style: GoogleFonts.nunito(
                              color: Color(
                                0xff141414,
                              ),
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      SizedBox(height: 4.0),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          formattedTime,
                          style:
                          TextStyle(fontSize: 12.0, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.0),
          if (message.isMe)
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.png'),
              radius: 20.0,
            ),
        ],
      ),
    );
  }
}

