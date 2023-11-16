
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatImagePicker extends StatefulWidget {
  const ChatImagePicker({super.key, required this.onPickImage});

  final void Function(File pickedImage) onPickImage;

  @override
  State<ChatImagePicker> createState() => _ChatImagePickerState();
}

class _ChatImagePickerState extends State<ChatImagePicker> {
  File? _pickedImageFile;
@override
  void _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage == null) {
      return ;
    }
    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });
    widget.onPickImage(_pickedImageFile!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){_pickImage();},
          child: _pickedImageFile!=null?CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey,
            foregroundImage:
            _pickedImageFile != null ? FileImage(_pickedImageFile!) :null,
          ):Icon(Icons.image,size: 50,color: Colors.purple,),
        ),
      ],
    );
  }
}
