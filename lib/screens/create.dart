import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testtest/constant/app_color.dart';
import 'package:testtest/constant/images.dart';

import '../controller/postController.dart';
import '../widgets/postcreation.dart';

class PostScreen extends StatelessWidget {
  final PostController controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          padding: EdgeInsets.only(left: 12, right: 12, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back(); // Use GetX navigation to pop the screen
                    },
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.black,
                      size: 22,
                    ),
                  ),
                  Text(
                    "Create Post",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle post button press
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.primarygreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    child: Text(
                      "Post",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 31,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.toggleSelection();
                    },
                    child: Obx(() => Container(
                          width: 165,
                          height: 34,
                          decoration: BoxDecoration(
                            color: controller.isSelected.value
                                ? AppColor.primarygreen
                                : Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: controller.isSelected.value
                                ? null
                                : Border.all(color: Colors.black87),
                          ),
                          child: Center(
                            child: Text(
                              "Public",
                              style: TextStyle(
                                color: controller.isSelected.value
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.toggleSelection();
                    },
                    child: Obx(() => Container(
                          width: 165,
                          height: 34,
                          decoration: BoxDecoration(
                            color: controller.isSelected.value
                                ? Colors.white
                                : AppColor.primarygreen,
                            borderRadius: BorderRadius.circular(30),
                            border: controller.isSelected.value
                                ? Border.all(color: Colors.black87)
                                : null,
                          ),
                          child: Center(
                            child: Text(
                              "Business",
                              style: TextStyle(
                                color: controller.isSelected.value
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 8),
                  child: TextFormField(
                    cursorColor: Colors.black54,
                    maxLines: null, // Allows for unlimited lines of text
                    expands: true, // Expands to fill available space
                    decoration: InputDecoration(
                      hintText: "Type something...",
                      hintStyle: TextStyle(color: Colors.black87, fontSize: 16),
                      border: InputBorder.none, // Remove underline border
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Topic",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16.5,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Obx(
                () => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      TopicChip(
                        topic: "Climate Change & Sustainability",
                        isSelected: controller.selectedTopic.value ==
                            "Climate Change & Sustainability",
                        onTap: () {
                          controller
                              .selectTopic("Climate Change & Sustainability");
                        },
                      ),
                      SizedBox(width: 10),
                      TopicChip(
                        topic: "Conscious Art",
                        isSelected:
                            controller.selectedTopic.value == "Conscious Art",
                        onTap: () {
                          controller.selectTopic("Conscious Art");
                        },
                      ),
                      SizedBox(width: 10),
                      TopicChip(
                        topic: "Business Post",
                        isSelected:
                            controller.selectedTopic.value == "Business Post",
                        onTap: () {
                          controller.selectTopic("Business Post");
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      controller.pickImage(ImageSource.camera);
                    },
                    child: Image.asset(
                      AppImages.camera,
                      color: AppColor.secondaryblude,
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      controller.pickImage(ImageSource.gallery);
                    },
                    child: Image.asset(
                      AppImages.gallery,
                      color: AppColor.secondaryblude,
                    ),
                  ),
                ],
              ),
              Obx(() {
                if (controller.selectedImage.value.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.file(
                      File(controller.selectedImage.value),
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  );
                } else {
                  return Container();
                }
              }),
              SizedBox(height: 20), // Adjust as needed
            ],
          ),
        ),
      ),
    );
  }
}
