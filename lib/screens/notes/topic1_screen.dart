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
      body: ListView(
        padding: EdgeInsets.all(25),
        children: <Widget>[
          // Introduction section
          Text(
            'Introduction',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'CSS is an abbreviation of Cascading Style Sheets. The content of the document is defined by HTML and the presentation of the content is defined by the style sheet.',
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(height: 20),
          SizedBox(
            child: Image.asset(
              "assets/topic1pic01.png",
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 50),
          // CSS Syntax sub-section
          Text(
            'CSS Syntax',
            style: TextStyle(
              fontSize: 20,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'A CSS rule consists of a selector and a declaration, which may be one or more. The syntax is shown in the following diagram.',
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(height: 25),
          SizedBox(
            child: Image.asset(
              "assets/topic1pic02.png",
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 25),
          Text(
            '\u2022 Selector : HTML element to be styled \n\u2022 Declaration : Made up of property and value \n\u2022 Property : Attribute to be changed \n\u2022 Value : Attribute to be set as \n\nThe declaration ends with a semi-colon. The set of declaration is wrapped with curly brackets.',
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(height: 50),
          // CSS Comments
          Text(
            'CSS Comments',
            style: TextStyle(
              fontSize: 20,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'A comment can span multiple lines, but it cannot be nested. Here are examples of a single-line comment and multi-line comment.',
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(height: 25),
          SizedBox(
            height: 150,
            child: Image.asset(
              "assets/topic1pic03.png",
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
