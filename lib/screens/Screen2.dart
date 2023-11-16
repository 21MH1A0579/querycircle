import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PostMessages extends StatelessWidget {
  const PostMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Post')
          .orderBy(
        'createdAt',
        descending: true,
      )
          .snapshots(),
      builder: (context, PostSnapshots) {
        if (PostSnapshots.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!PostSnapshots.hasData || PostSnapshots.data!.docs.isEmpty) {
          return const Center(
            child: Text('No Posts found.',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          );
        }
        if (PostSnapshots.hasError) {
          return const Center(
            child: Text('Something went wrong.',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          );
        }

        final loadedMessages = PostSnapshots.data!.docs;

        return ListView.builder(
          padding: const EdgeInsets.only(
            bottom: 40,
            left: 13,
            right: 13,
          ),
          reverse: true,
          itemCount: loadedMessages.length,
          itemBuilder: (BuildContext context, int index) {
            final chatMessage = loadedMessages[index].data();
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(35)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(

                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(45),
                            child: Image.network(chatMessage["userImage"],fit: BoxFit.fill,)),
                      ),
                      SizedBox(height: 5,),
                      Text("Discription:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(chatMessage["text"],style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),),
                      ), SizedBox(height: 25,),
                    ],
                  ),
                ),
              ),
            );
            return Container(
              color: Colors.orange.shade100,
              height: 350,
              width: 300,
              child: Column(
                children: [
                  Image.network(chatMessage["userImage"],fit: BoxFit.fill,),
                  Text(chatMessage["text"]),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
