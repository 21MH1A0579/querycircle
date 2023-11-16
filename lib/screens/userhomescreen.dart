import 'package:flutter/material.dart';
import 'package:querycircle/screens/screen3/Screen4.dart';

import 'Screen2.dart';
import 'Screen3.dart';
import 'chat.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedpage=0;
  final pageoptions=[
    ChatScreen(),
    PostMessages(),
    Screen4()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageoptions[selectedpage],
      bottomNavigationBar: BottomNavigationBar(

        elevation:double.infinity,
        currentIndex: selectedpage,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        onTap: (int index)
        {
          setState(() {
            selectedpage=index;
          });
          //_onTap();
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat),label: "Query"),
          BottomNavigationBarItem(icon: Icon(Icons.post_add),label: "Posts"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Account"),
        ],
      ),

    );
  }
}
