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

          spaceBetween(20),
          buildContent('e) text-decoration'),
          buildBulletList('To add decoration line to the text'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode('h1 { text-decoration: overline; }'),
          buildCode('h2 { text-decoration: line-through; }'),
          buildCode('h3 { text-decoration: underline; }'),
          buildCode('h4 { text-decoration: underline overline; }'),
          buildCode('p { text-decoration: none; }'),
          spaceBetween(15),
          buildContent('Example body'),
          buildImageAsset('assets/topic3pic06.png'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic07.png'),

          spaceBetween(20),
          buildContent('f) text-shadow'),
          buildBulletList('To add shadow to the text'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode('h1 { text-shadow: 2px 2px; }'),
          buildCode('h2 { text-shadow: 2px 2px red; }'),
          buildCode('h3 { text-shadow: 2px 2px 5px red; }'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic08.png'),
          spaceBetween(50),
          // --------------------------------------------------- Font Styling
          buildSubtopic('Font Styling'),
          spaceBetween(10),
          buildContent('a) font-family'),
          buildBulletList('To specifiy the font of a text'),
          buildBulletList(
              'If the font name is more than one word, it must be defined in quotation marks (")'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode('h1 { font-family: “Times New Roman”; }'),
          buildCode('h2 { font-family: Verdana; }'),
          buildCode('h3 { font-family: “Courier New”; }'),
          buildCode('h4 { font-family: “Lucida Handwriting”; }'),
          buildCode('p { font-family: Papyrus; }'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic09.png'),

          spaceBetween(20),
          buildContent('b) font-size'),
          buildBulletList('To set the text size'),
          buildBulletList(
              'For a responsive sized text, the size is defined with vw'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode('.class1 { font-size: 100%; }'),
          buildCode('.class2 { font-size: 30px; }'),
          buildCode('.class3 { font-size: 10vw; }'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic10.png'),

          spaceBetween(20),
          buildContent('c) font-style'),
          buildBulletList('To specify italic text'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode('h1 { font-style: italic; }'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic11.png'),

          spaceBetween(20),
          buildContent('d) font-weight'),
          buildBulletList('To thicken the font'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode('p { font-weight: bold; }'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic12.png'),
          spaceBetween(50),
          // ----------------------------------------------- Background Styling
          buildSubtopic('Background Styling'),
          spaceBetween(10),
          buildContent('a) background-color'),
          buildBulletList('To specifiy the background color of an element'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode('h3 { background-color: yellow; }'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic13.png'),

          spaceBetween(20),
          buildContent('b) background-image'),
          buildBulletList('To set the background image of an element'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode('body { background-image: url(“paper.jpg”); }'),
          buildCode(
              'p {  background-image: url("https://newevolutiondesigns.com/images/freebies/white-wallpaper-18.jpg"); }'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic14.png'),
          spaceBetween(50),
          // ----------------------------------------------- Tables Styling
          buildSubtopic('Tables Styling'),
          spaceBetween(10),
          buildContent('a) border'),
          buildBulletList('To specifiy the table borders'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode('table, th, td { border: 1px dotted; }'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic15.png'),
          spaceBetween(20),
          buildContent('Example'),
          buildCode('table, th, td { border: 1px dashed; }'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic16.png'),
          spaceBetween(20),
          buildContent('Example'),
          buildCode('table, th, td { border: 1px solid; }'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic17.png'),
          spaceBetween(20),
          buildContent('Example'),
          buildCode('table, th, td { border: 1px inset; }'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic18.png'),
          spaceBetween(20),
          buildContent('Example'),
          buildCode('table, th, td { border: 1px outset; }'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic19.png'),

          spaceBetween(20),
          buildContent('b) border-collapse'),
          buildBulletList('To collapse the table border into a single border'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode(
              'table { border: 1px solid black; border-collapse: collapse; }'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic20.png'),

          spaceBetween(20),
          buildContent('c) width and height'),
          buildBulletList('To set the width and height of the table'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode('table { width: 90%; height: 50%; }'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic21.png'),

          spaceBetween(20),
          buildContent('d) text-align'),
          buildBulletList(
              'To set the horizontal alignment of the content <th> or <td>'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode('.td1 { text-align: center; }'),
          buildCode('.td2 { text-align: left; }'),
          buildCode('.td3 { text-align: right; }'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic22.png'),

          spaceBetween(20),
          buildContent('e) table font and background color'),
          buildBulletList(
              'To set the background color and the font color of specified table'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode('table { background-color: blue; color: white; }'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic23.png'),

          spaceBetween(20),
          buildContent('f) padding'),
          buildBulletList(
              'To add space between the cell edges and cell content'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode('th, td { padding: 15px; }'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic24.png'),
          spaceBetween(50),
          // ----------------------------------------------- Border Styling
          buildSubtopic('Border Styling'),
          spaceBetween(10),
          buildContent('a) Dotted'),
          buildBulletList('Defines a dotted border'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode('.dotted { border-style: dotted; }'),

          spaceBetween(20),
          buildContent('b) Dashed'),
          buildBulletList('Defines a dashed border'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode('.dashed { border-style: dashed; }'),

          spaceBetween(20),
          buildContent('c) Solid'),
          buildBulletList('Defines a solid border'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode('.solid { border-style: solid; }'),

          spaceBetween(20),
          buildContent('d) Double'),
          buildBulletList('Defines a double border'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode('.double { border-style: double; }'),

          spaceBetween(20),
          buildContent('e) No border'),
          buildBulletList('Defines no border'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode('.none { border-style: none; }'),

          spaceBetween(20),
          buildContent('f) Mixed border'),
          buildBulletList('Defines a mixed border'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode('.mixed { border-style: dotted dashed solid double; }'),

          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic25.png'),
          spaceBetween(50),
          // ----------------------------------------------- Position Styling
          buildSubtopic('Position Styling'),
          spaceBetween(10),
          buildContent('a) Static'),
          buildBulletList(
              'By default the HTML elements are positioned as static'),
          buildBulletList(
              'It is not affected by the top, bottom, left and right properties'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode('.static { position: static; border: 1px solid; }'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic26.png'),

          spaceBetween(20),
          buildContent('b) Fixed'),
          buildBulletList(
              'The element is stays in the same place even if the page is scrolled'),
          buildBulletList(
              'The top, bottom, left and right properties are used to position the element'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode(
              '.fixed { position: fixed; right: 0; bottom: 0; border: 1px solid; }'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic27.png'),

          spaceBetween(20),
          buildContent('c) Relative'),
          buildBulletList(
              'The element is positioned relative to its normal position'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode(
              '.relative { position: relative; left: 30px; border: 1px solid; }'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic28.png'),

          spaceBetween(20),
          buildContent('d) Absolute'),
          buildBulletList(
              'The element is positioned relative to the nearest positioned ancestor'),
          buildBulletList(
              'Absolute positioned elements are removed from the normal flow, and can overlap elements'),
          spaceBetween(15),
          buildContent('Example'),
          buildCode(
              '.absolute { position: absolute; top: 80px; right: 0; border: 1px solid; }'),
          spaceBetween(15),
          buildContent('Code Output'),
          buildImageAsset('assets/topic3pic29.png'),

          spaceBetween(25),
        ],
      ),
    );
  }
}
