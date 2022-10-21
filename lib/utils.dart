import 'package:image_picker/image_picker.dart';

Future imagePicked() async {
  final ImagePicker picker = ImagePicker();
  XFile? image = await picker.pickImage(
    source: ImageSource.gallery,
  );
  return image;
}
