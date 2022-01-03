import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

Future<XFile?> choosePicture({
  required BuildContext context,
  XFile? pickedImage,
}) async {
  XFile? image;
  image = await showCupertinoModalPopup<XFile>(
    context: context,
    barrierDismissible: true,
    builder: (_) {
      return CupertinoActionSheet(
        title: const Text('Pick image from'),
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Camera'),
            onPressed: () async {
              final image =
              await _pickImageForMobile(source: ImageSource.camera);
              Navigator.of(context).pop(image);
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Gallery'),
            onPressed: () async {
              final image =
              await _pickImageForMobile(source: ImageSource.gallery);
              Navigator.of(context).pop(image);
            },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
          isDestructiveAction: true,
        ),
      );
    },
  );

  return image;
}

Future<XFile?> _pickImageForMobile({required ImageSource source}) async {
  // STEP 1: Pick image.
  final picker = ImagePicker();
  final image = await picker.pickImage(source: source);
  if (image == null) {
    return null;
  }

  // STEP 2: Crop image.
  File? croppedImage;
  croppedImage = File(image.path);

  // STEP 3: Compress image.
  File? finalImage;
  finalImage = croppedImage;

  return finalImage == null ? null : XFile(finalImage.path);
}