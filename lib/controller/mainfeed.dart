import 'package:get/get.dart';

class MainFeedController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void selectTab(int index) {
    selectedIndex.value = index;
  }
}