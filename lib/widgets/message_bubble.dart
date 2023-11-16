import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../screens/chatpic.dart';

// A MessageBubble for showing a single chat message on the ChatScreen.
class MessageBubble extends StatelessWidget {
  // Create a message bubble which is meant to be the first in the sequence.
  const MessageBubble.first({
    super.key,
    required this.userImage,
    required this.imgUrl,
    required this.timestamp,
    required this.username,
    required this.message,
    required this.isMe,
  }) : isFirstInSequence = true;

  // Create a amessage bubble that continues the sequence.
  const MessageBubble.next({
    super.key,
    required this.imgUrl,
    required this.message,
    required this.timestamp,
    required this.isMe,
  })  : isFirstInSequence = false,
        userImage = null,
        username = null;

  // Whether or not this message bubble is the first in a sequence of messages
  // from the same user.
  // Modifies the message bubble slightly for these different cases - only
  // shows user image for the first message from the same user, and changes
  // the shape of the bubble for messages thereafter.
  final bool isFirstInSequence;
  final Timestamp timestamp;
  final String imgUrl;
  // Image of the user to be displayed next to the bubble.
  // Not required if the message is not the first in a sequence.
  final String? userImage;

  // Username of the user.
  // Not required if the message is not the first in a sequence.
  final String? username;
  final String message;

  // Controls how the MessageBubble will be aligned.
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    //print(DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch));
    String readTimestamp(int timestamp) {
      var now = new DateTime.now();
      var format = new DateFormat('HH:mm a');
      var date = new DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
      var diff = date.difference(now);
      var time = '';

      if (diff.inSeconds <= 0 || diff.inSeconds > 0 && diff.inMinutes == 0 || diff.inMinutes > 0 && diff.inHours == 0 || diff.inHours > 0 && diff.inDays == 0) {
        time = format.format(date);
      } else {
        if (diff.inDays == 1) {
          time = diff.inDays.toString() + 'DAY AGO';
        } else {
          time = diff.inDays.toString() + 'DAYS AGO';
        }
      }
      return time;
    }

    return Stack(
      children: [
        if (userImage != null)
          Positioned(
            top: 15,
            // Align user image to the right, if the message is from me.
            right: isMe ? 0 : null,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                userImage!,
              ),
              backgroundColor: theme.colorScheme.primary.withAlpha(180),
              radius: 23,
            ),
          ),
        Container(
          // Add some margin to the edges of the messages, to allow space for the
          // user's image.
          margin: const EdgeInsets.symmetric(horizontal: 46),
          child: Row(
            // The side of the chat screen the message should show at.
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  // First messages in the sequence provide a visual buffer at
                  // the top.
                 // Text(DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch).toString().substring(11,16)),
                 // Text( readTimestamp(timestamp.millisecondsSinceEpoch)),
                  if (isFirstInSequence) const SizedBox(height: 18),
                  if (username != null)
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 13,
                        right: 13,
                      ),
                      child: Text(
                        username!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),

                  // The "speech" box surrounding the message.
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          // color: isMe
                          //     ? Colors.grey[300]: theme.colorScheme.secondary.withAlpha(200),
                          gradient: LinearGradient(
                            colors: isMe ? [Colors.grey,Colors.grey.shade500]:[Color.fromARGB(255,114,3,219),Color.fromARGB(255,144,5,218),Color.fromARGB(255,144,6,200),Color.fromARGB(255,165,36,200)],
                          ),
                          // Only show the message bubble's "speaking edge" if first in
                          // the chain.
                          // Whether the "speaking edge" is on the left or right depends
                          // on whether or not the message bubble is the current user.
                          borderRadius: BorderRadius.only(
                            topLeft: !isMe && isFirstInSequence
                                ? Radius.zero
                                : const Radius.circular(12),
                            topRight: isMe && isFirstInSequence
                                ? Radius.zero
                                : const Radius.circular(12),
                            bottomLeft: const Radius.circular(12),
                            bottomRight: const Radius.circular(12),
                          ),
                        ),
                        // Set some reasonable constraints on the width of the
                        // message bubble so it can adjust to the amount of text
                        // it should show.
                        constraints: const BoxConstraints(maxWidth: 200),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 14,
                        ),
                        // Margin around the bubble.
                        margin: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 12,
                        ),
                        child: Column(
                          children: [
                            imgUrl=="null"?Icon(Icons.ice_skating,size: 1,):GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Chatpic(url: imgUrl)));
                                },
                                child: Container(height:200,width:250,child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                    child: Image.network(imgUrl,fit: BoxFit.fill,)))
                            ),
                            SizedBox(height: 5,),
                            Text(
                              message,
                              style: TextStyle(
                                // Add a little line spacing to make the text look nicer
                                // when multilined.
                                height: 1.3,
                                color: isMe
                                    ? theme.colorScheme.onSecondary
                                    : theme.colorScheme.onSecondary,
                              ),
                              softWrap: true,
                            ),

                          ],
                        ),
                      ),
                      isMe?Padding(
                        padding: const EdgeInsets.only(left: 75),
                        child: Text(readTimestamp(timestamp.millisecondsSinceEpoch),style: TextStyle(color: Colors.green,fontSize: 12),),
                      ):Padding(
                        padding: const EdgeInsets.only(right: 75),
                        child: Text(readTimestamp(timestamp.millisecondsSinceEpoch),style: TextStyle(color: Colors.red,fontSize: 12),),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
