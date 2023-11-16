import 'package:flutter/material.dart';

class Chatpic extends StatelessWidget {
  final String url;
  const Chatpic({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(url),
      ),
    );
  }
}
