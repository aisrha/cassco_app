import 'package:flutter/material.dart';

class Topic2Screen extends StatefulWidget {
  Topic2Screen({Key? key}) : super(key: key);

  @override
  State<Topic2Screen> createState() => _Topic2ScreenState();
}

class _Topic2ScreenState extends State<Topic2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Topic 2 : Ways to insert CSS'),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: Center(child: Text("Topic2", style: TextStyle(fontSize: 60))),
    );
  }
}
