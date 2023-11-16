
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:querycircle/screens/postscreen/user_image_picker.dart';
import '../../homepage.dart';
import '../../widgets/user_image_picker.dart';
class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final postcontroller=TextEditingController();
  File?_selectedImage;
  void _onsubmit () async
  {
    var intvalue=Random().nextInt(1000)+10;
    final storageRef = await FirebaseStorage.instance
        .ref()
        .child('user_images')
        .child('post${intvalue}.jpg');
    await storageRef.putFile(_selectedImage!);
    final imageUrl = await storageRef.getDownloadURL();
    FirebaseFirestore.instance.collection('Post').add({
      'text': postcontroller.text,
      'createdAt': Timestamp.now(),
      'userImage': imageUrl,
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

      //  appBar: AppBar(title: Text("Admin Panel"),backgroundColor:Color.fromRGBO(192, 219, 234,1),),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.purple,
                    child: IconButton(
                      color: Colors.white,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>homepage()));
                      }, icon: Icon(Icons.arrow_back),),
                  ),
                ),
                SizedBox(height: 50,),
                Column(
                  children: [
                    UserImagePicker(onPickImage: (pickedimage)
                    {
                      _selectedImage=pickedimage;
                    }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                    controller: postcontroller,
                    maxLines: 5,
                    decoration: InputDecoration(
                      counterText: "Discription",
                      hintText: "Enter Your Discription......",
                      hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 25),
                      // filled: true,
                      // fillColor: Colors.pink,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width:2,color: Colors.purple),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderSide: BorderSide(width:2,color: Colors.green),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                ElevatedButton(
                  style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.purple)),
                    onPressed: (){
                  _onsubmit();
                  Get.snackbar(
                      "Hurraih", "Posted Successfully.",
                      margin: const EdgeInsets.only(
                        top: 35,
                        left: 10,
                        right: 10,
                      ),
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                      icon: const Icon(Icons.notifications_active, color: Colors.white,),
                      duration: const Duration(seconds: 3),
                      backgroundGradient: LinearGradient(
                          colors: [Colors.green.shade700, Colors.green.shade500]
                      )
                  );
                }, child: Text("Post")),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
