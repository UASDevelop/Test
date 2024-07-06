import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PostController extends GetxController {
  var isSelected = true.obs;
  var selectedTopic = "".obs;
  var selectedImage = "".obs;

  void toggleSelection() {
    isSelected.value = !isSelected.value;
  }

  void selectTopic(String topic) {
    selectedTopic.value = topic;
  }

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      selectedImage.value = pickedFile.path;
    } else {
      print('No image selected.');
    }
  }
}
