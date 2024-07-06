
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:testtest/screens/bottomNave.dart';
import 'package:testtest/screens/chat.dart';
import 'package:testtest/screens/mainfeed.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: BottomNavBarDemo(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => BottomNavBarDemo()),
        GetPage(name: '/mainFeed', page: () => MainFeed()),
        GetPage(name: '/chatScreen', page: () => ChatScreen()),
      ],
    );
  }
}
