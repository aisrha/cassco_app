import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    // topic 1 card
    final buildTopic1Card = Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                      Color.fromARGB(255, 220, 220, 220), BlendMode.darken),
                  child: Image.asset(
                    "assets/topic1.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    'Topic 1 : Introduction to CSS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'In this topic, you will learn : \n \u2022 CSS Syntax \n \u2022 CSS Selectors \n \u2022 CSS Comments',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Notes',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ],
        ));

    // topic 2 card
    final buildTopic2Card = Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ColorFiltered(
                  colorFilter:
                      const ColorFilter.mode(Colors.grey, BlendMode.darken),
                  child: Image.asset(
                    "assets/topic2.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    'Topic 2 : Ways to insert CSS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'In this topic, you will learn the ways to insert CSS in your code : \n \u2022 External Style Sheet \n \u2022 Internal Style Sheet \n \u2022 Inline style',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Notes',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ],
        ));

    // topic 3 card
    final buildTopic3Card = Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ColorFiltered(
                  colorFilter:
                      const ColorFilter.mode(Colors.grey, BlendMode.softLight),
                  child: Image.asset(
                    "assets/topic3.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    'Topic 3 : Styling',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'In this topic, you will learn a few different types of styling in CSS : \n \u2022 Text Styling \n \u2022 Font Styling \n \u2022 Background styling \n \u2022 Tables styling \n \u2022 Border styling \n \u2022 Position styling',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Notes',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ],
        ));

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          buildTopic1Card,
          SizedBox(height: 14),
          buildTopic2Card,
          SizedBox(height: 14),
          buildTopic3Card,
        ],
      ),
    );
  }
}
