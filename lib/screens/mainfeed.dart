import 'package:flutter/material.dart';
import 'package:testtest/constant/images.dart';
import 'package:testtest/screens/publicFeed.dart';

class MainFeed extends StatefulWidget {
  const MainFeed({super.key});

  @override
  State<MainFeed> createState() => _MainFeedState();
}

class _MainFeedState extends State<MainFeed>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(AppImages.chance),
            Image.asset(AppImages.verify, height: 30),
            // Replace with your image asset
            Spacer(),
            IconButton(
              icon: Image.asset(AppImages.notificaitonn),
              onPressed: () {
                // Handle notification icon press
              },
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.green, // Set the indicator color to green
          labelColor:
              Colors.green, // Set the label color for selected tab to green
          unselectedLabelColor:
              Color(0xff364960), // Set the label color for unselected tabs
          tabs: [
            Tab(text: 'Public Feed'),
            Tab(text: 'Business Feed'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PublicFeed(),
          Center(child: Text('Content for Tab 2')),
        ],
      ),
    );
  }
}
