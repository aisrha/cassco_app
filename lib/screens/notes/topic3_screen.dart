import 'package:flutter/material.dart';

class Topic3Screen extends StatefulWidget {
  Topic3Screen({Key? key}) : super(key: key);

  @override
  State<Topic3Screen> createState() => _Topic3ScreenState();
}

class _Topic3ScreenState extends State<Topic3Screen> {
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
        title: Text('Topic 3 : Styling'),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: Center(child: Text("Topic3", style: TextStyle(fontSize: 60))),
    );
  }
}
