import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Topic3Screen extends StatefulWidget {
  Topic3Screen({Key? key}) : super(key: key);

  @override
  State<Topic3Screen> createState() => _Topic3ScreenState();
}

class _Topic3ScreenState extends State<Topic3Screen> {
  @override
  Widget build(BuildContext context) {
    // height spacer
    spaceBetween(double val) {
      return SizedBox(height: val);
    }

    // build image asset
    buildImageAsset(String path) {
      return SizedBox(
        child: Image.asset(
          path,
          fit: BoxFit.contain,
        ),
      );
    }

    // build image asset with height
    buildImageAssetHeight(double val, String path) {
      return SizedBox(
        height: val,
        child: Image.asset(
          path,
          fit: BoxFit.contain,
        ),
      );
    }

    // build topic
    buildTopic(String topic) {
      return Text(
        topic,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    // build subtopic title
    buildSubtopic(String subtopic) {
      return Text(
        subtopic,
        style: const TextStyle(
          fontSize: 20,
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    // build content
    buildContent(String content) {
      return Text(
        content,
        style: const TextStyle(fontSize: 17),
      );
    }

    // build bullet points
    buildBulletList(String content) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("\u2022 "),
          Expanded(
            child: Text(
              content,
              style: const TextStyle(fontSize: 17),
            ),
          ),
        ],
      );
    }

    // build code
    buildCode(String code) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          code,
          style: GoogleFonts.robotoMono(
            textStyle: const TextStyle(
              fontSize: 15,
              color: Colors.blue,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
        title: const Text('Topic 3 : Styling'),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: <Widget>[
          // --------------------------------------------------- Text Styling
          buildSubtopic('Text Styling'),
          spaceBetween(10),
          buildContent('a) color'),
          buildBulletList('To set the color of the text'),
          buildBulletList('Specified by using the color name'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode('h1 { color: blue; }'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic01.png'),

          spaceBetween(20),
          buildContent('b) background-color'),
          buildBulletList('To set the background color of an element'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode('h1 { background-color: yellow; }'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic02.png'),

          spaceBetween(20),
          buildContent('c) text-alignment'),
          buildBulletList('To set the horizontal alignment of a text'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode('h1 { text-align: center; }'),
          buildCode('h2 { text-align: left; }'),
          buildCode('h3 { text-align: right; }'),
          buildCode('p { text-align: justify; }'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic03.png'),

          spaceBetween(20),
          buildContent('d) text-transform'),
          buildBulletList(
              'To specify uppercase, lowercase or capitalization of first letter of each word letters in a text'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode('h1 { text-transform: uppercase; }'),
          buildCode('h2 { text-transform: lowercase; }'),
          buildCode('h3 { text-transform: capitalize; }'),
          spaceBetween(15),
          buildContent('Example body'),
          buildImageAsset('assets/topic3pic04.png'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic05.png'),

          spaceBetween(25),
        ],
      ),
    );
  }
}
