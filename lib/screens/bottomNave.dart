import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/bottomnav.dart';
import '../widgets/bottomNave.dart';

class BottomNavBarDemo extends StatelessWidget {
  final BottomNavBarController _controller = Get.put(BottomNavBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => getScreen(_controller.selectedIndex.value)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _controller.selectedIndex.value,
        onTap: (index) {
          _controller.changeIndex(index);
        },
        selectedItemColor: Colors.green, // Selected item color
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/home.png"),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/search.png"),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/create.png"),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/chat.png"),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/profle1.png"),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
