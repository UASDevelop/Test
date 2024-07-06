import 'package:flutter/cupertino.dart';

import '../screens/chat.dart';
import '../screens/create.dart';
import '../screens/mainfeed.dart';

Widget getScreen(int selectedIndex) {
  switch (selectedIndex) {
    case 0:
      return MainFeed();
    case 1:
      return Container(child:Text("Search Screenß"),);
    case 2:
      return PostScreen(); // Replace with Notifications screen
    case 3:
      return ChatScreen(); // Replace with Search screen
    case 4:
      return Container(); // Replace with Profile screen
    default:
      return MainFeed(); // Default to MainFeed screen
  }
}
