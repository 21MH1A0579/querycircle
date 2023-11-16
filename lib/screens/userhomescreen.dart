import 'package:flutter/material.dart';

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
    Screen3()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageoptions[selectedpage],
      bottomNavigationBar: BottomNavigationBar(
        elevation:double.infinity,
        currentIndex: selectedpage,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.blue,
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
