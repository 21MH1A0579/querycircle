import 'package:flutter/material.dart';
class AddOutpass extends StatelessWidget {
  const AddOutpass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Apply for New Pass"),centerTitle: true,titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),

    );
  }
}
