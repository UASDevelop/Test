import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testtest/screens/postcard.dart';

import '../constant/app_color.dart';

class PublicFeed extends StatefulWidget {
  const PublicFeed({super.key});

  @override
  State<PublicFeed> createState() => _PublicFeedState();
}

class _PublicFeedState extends State<PublicFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, left: 10, right: 10, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Feeds",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  "assets/images/filter.png",
                  height: 24, // Adjust size as needed
                  width: 24,
                  color:AppColor.secondaryblude,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 6, // Replace with your actual number of posts
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PostCard(
                      assetImage: 'assets/images/profile.png',
                      cname: "James",
                      compname: "Topic name",
                      time: "1 hour ago",
                      user: 'userName',
                      name: "Topic name",
                      description:
                          "Lorem ipsum dolor sit amet consectetur. Sagittis diam auctor convallis justo pellentesque in eu amet sapien. Arcu pellentesque.Lorem ipsum dolor sit amet consectetur. Sagittis diam auctor convallis justo pellentesque in eu amet sapien. Arcu pellentesque.",
                      likes: "12",
                      comments: "23",
                      views: "34",
                      likeonTap: () async {
                        showBottomSheet(context);
                      },
                      color: Colors.blue,
                      navigation: () {},
                      showdiomand: true,
                      numberlines: 2,
                      showcircle: index % 2 ==
                          1, // Example condition for showing circle
                      deivider: false,
                      commentime: "",
                      textStyle: GoogleFonts.getFont(
                        'Poppins',
                        fontSize: 13,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.bold,
                      ),
                      ispadding: false,
                      companycolor: Color(0xff000000),
                      usercolor: Color(0xff000000),
                      iCon: Icons.favorite_border,
                    ),
                    index % 2 == 1
                        ? SizedBox(
                            height: 20,
                          )
                        : SizedBox(
                            height: 0,
                          ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Topics',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 12),
                _buildTopicItem('Topic 1'),
                _buildTopicItem('Topic 2'),
                _buildTopicItem('Topic 3'),
                _buildTopicItem('Topic 4'),
                _buildTopicItem('Topic 5'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTopicItem(String topicText) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset("assets/images/notes.png"),
          Text(
            topicText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
