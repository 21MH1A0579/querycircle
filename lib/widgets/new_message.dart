import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../screens/chatimagepicker.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _messageController = TextEditingController();
  File?_selectedImage;

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _submitMessage() async {
    final enteredMessage = _messageController.text;
    var intvalue=Random().nextInt(1000)+10;
    final storageRef = await FirebaseStorage.instance
        .ref()
        .child('Chat_Images')
        .child('post${intvalue}.jpg');
    final imageUrl;
    if(_selectedImage==null)
      {
        imageUrl="null";
      }
    else {
      await storageRef.putFile(_selectedImage!);
      imageUrl = await storageRef.getDownloadURL();
    }
    if (enteredMessage.trim().isEmpty) {
      return;
    }
    String? Url(String rollnumber)
{
  if(rollnumber.substring(2,4).toUpperCase()=="MH")
  {
    return "https://info.aec.edu.in/ACOE/StudentPhotos/$rollnumber.jpg";
  }
  else if(rollnumber.substring(2,4).toUpperCase()=="A9")
  {
    return "https://info.aec.edu.in/AEC/StudentPhotos/$rollnumber.jpg";
  }
  else
  {
    return "https://info.aec.edu.in/ACET/StudentPhotos/$rollnumber.jpg";
  }
}
    FocusScope.of(context).unfocus();
    _messageController.clear();

    final user = FirebaseAuth.instance.currentUser!;
    final userData = await FirebaseFirestore.instance
        .collection('Users')
        .doc(user.uid)
        .get();

    FirebaseFirestore.instance.collection('chat').add({
      'text': enteredMessage,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'username': userData.data()!['rollnumber'],
      'userImage': Url(userData.data()!['rollnumber']),
      'ChatPost' : imageUrl,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 1, bottom: 14),
      child: Row(
        children: [
          ChatImagePicker(onPickImage: (pickedimage)
          {
            _selectedImage=pickedimage;
          }),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: TextField(
                controller: _messageController,
                textCapitalization: TextCapitalization.sentences,
                autocorrect: true,
                enableSuggestions: true,
                decoration:InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width:2,
                      color: Colors.purple,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),

                  enabledBorder:OutlineInputBorder(
                    borderSide: BorderSide(
                      width:2,
                      color: Colors.grey,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "Send a Messagee....",
                  suffixIcon: IconButton(onPressed: (){
                    _submitMessage();
                    setState(() {
                      ChatImagePicker(onPickImage: (val){},);
                    });
                  }
                    ,icon: Icon(Icons.send,color: Colors.purple,),)
                ),

              ),
            ),
          ),
          // IconButton(
          //   color: Theme.of(context).colorScheme.primary,
          //   onPressed: _submitMessage,
          //   icon: const Icon(Icons.send),
          // )
        ],
      ),
    );
  }
}
