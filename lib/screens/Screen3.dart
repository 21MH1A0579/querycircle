import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Group Chat",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.exit_to_app,color: Colors.green,),
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
