import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostCard extends StatelessWidget {
  final String assetImage;
  final String cname;
  final int numberlines;
  final String compname;
  final String time;
  final String user;
  final String name;
  final String description;
  final String likes;
  final VoidCallback likeonTap;
  final String comments;
  final String views;
  final Color? color;
  final bool showdiomand;
  final bool showcircle;
  final VoidCallback navigation;
  final bool deivider;
  final TextStyle textStyle;
  final bool ispadding;
  final String? commentime;
  final Color companycolor;
  final Color usercolor;
  final IconData iCon;

  PostCard({
    required this.assetImage,
    required this.cname,
    required this.compname,
    required this.time,
    required this.user,
    required this.name,
    required this.description,
    required this.likes,
    required this.comments,
    required this.views,
    required this.likeonTap,
    this.color,
    required this.showdiomand,
    required this.showcircle,
    required this.navigation,
    required this.deivider,
    required this.numberlines,
    this.commentime,
    required this.textStyle,
    required this.ispadding,
    required this.companycolor,
    required this.usercolor,
    required this.iCon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigation,
      child: Card(
        elevation: 2,
        color: Color(0xffECF3F6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!showcircle)
                    Image.asset(
                      assetImage,
                      height: 37,
                      width: 37,
                    ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              cname,
                              style: GoogleFonts.getFont(
                                'Poppins',
                                fontSize: 12,
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 2),
                            Image.asset("assets/images/verify.png"),
                            SizedBox(width: 4),
                            Text(
                              time,
                              style: GoogleFonts.getFont(
                                'Poppins',
                                fontSize: 10,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Spacer(),
                            Image.asset("assets/images/menues.png"),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          compname,
                          style: GoogleFonts.getFont(
                            'Poppins',
                            fontSize: 10,
                            color: companycolor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: navigation,
                child: Text(
                  description,
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontSize: 12,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: numberlines,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (showcircle) Image.asset("assets/images/frame.png"),
              SizedBox(height: 12),
              Row(
                children: [
                  InkWell(
                    onTap: likeonTap,
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/heart.png",
                      color: color,
                    ),
                  ),
                  SizedBox(width: 30),
                  InkWell(
                    onTap: navigation,
                    child: Image.asset(
                      'assets/images/chat.png',
                      color: Color(0xff141414),
                    ),
                  ),
                  SizedBox(width: 30),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/images/send.png',
                      color: Color(0xff141414),
                    ),
                  ),
                  Spacer(),
                  if (showcircle)
                    InkWell(
                      onTap: likeonTap,
                      child: Image.asset("assets/images/save.png"),
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
