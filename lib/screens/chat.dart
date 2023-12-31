import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:querycircle/screens/screen3/AboutCollage.dart';

import '../widgets/chat_messages.dart';
import '../widgets/new_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void setupPushNotifications() async {
    final fcm = FirebaseMessaging.instance;

    await fcm.requestPermission();

    fcm.subscribeToTopic('chat');
  }

  @override
  void initState() {
    super.initState();

    setupPushNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Ask Your Quries"),
          backgroundColor: Colors.black,actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutCollage())),
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("asserts/adityalogo.jpg"),

              ),
            ),
          )
        ],),
        body: const Column(
          children: [
            Expanded(
              child: ChatMessages(),
            ),
            NewMessage(),
          ],
        ));
  }
}
