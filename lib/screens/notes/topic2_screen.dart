import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Topic2Screen extends StatefulWidget {
  Topic2Screen({Key? key}) : super(key: key);

  @override
  State<Topic2Screen> createState() => _Topic2ScreenState();
}

class _Topic2ScreenState extends State<Topic2Screen> {
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
        title: const Text('Topic 2 : Ways to insert CSS'),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: <Widget>[
          // --------------------------------------------- Introduction section
          buildTopic('Introduction'),
          spaceBetween(10),
          buildContent(
              'There are three ways to insert CSS in HTML, which are External Style Sheet, Internal Style Sheet and Inline Style.'),
          spaceBetween(50),
          // ------------------------------------------- External Style Sheet
          buildSubtopic('External Style Sheet'),
          spaceBetween(10),
          buildBulletList(
              'It is separate from the HTML file, which has the .css extension to the name of the file'),
          buildBulletList('The CSS file should not contain any HTML tags'),
          buildBulletList(
              'Each HTML page that implements the styling set in the external style sheet must include a reference to the file by using <link> element in the <head> section'),
          spaceBetween(15),
          buildContent('Example of HTML file'),
          buildImageAsset('assets/topic2pic01.png'),
          spaceBetween(15),
          buildContent('Example of CSS file'),
          buildImageAsset('assets/topic2pic02.png'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic2pic03.png'),
          spaceBetween(50),
          // ------------------------------------------- Internal Style Sheet
          buildSubtopic('Internal Style Sheet'),
          spaceBetween(10),
          buildBulletList(
              'For a single HTML page that implements a different style'),
          buildBulletList(
              'The internal CSS is defined in the <style> element, which is in the <head> section'),
          spaceBetween(15),
          buildContent('Example of internal CSS'),
          buildImageAsset('assets/topic2pic04.png'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic2pic05.png'),
          spaceBetween(50),
          // ------------------------------------------- Inline CSS
          buildSubtopic('Inline CSS'),
          spaceBetween(10),
          buildBulletList('To apply a different style to a single element'),
          buildBulletList(
              'The style attribute is added to the element and it can contain any CSS property'),
          spaceBetween(15),
          buildContent('Example of inline CSS'),
          buildImageAsset('assets/topic2pic06.png'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic2pic07.png'),

          spaceBetween(25),
        ],
      ),
    );
  }
}
