import 'package:flutter/material.dart';

class Topic1Screen extends StatefulWidget {
  Topic1Screen({Key? key}) : super(key: key);

  @override
  State<Topic1Screen> createState() => _Topic1ScreenState();
}

class _Topic1ScreenState extends State<Topic1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
        title: Text('Topic 1 : Introduction to CSS'),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: Center(child: Text("Topic1", style: TextStyle(fontSize: 60))),
    );
  }
}
