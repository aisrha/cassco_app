import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Topic1Screen extends StatefulWidget {
  Topic1Screen({Key? key}) : super(key: key);

  @override
  State<Topic1Screen> createState() => _Topic1ScreenState();
}

class _Topic1ScreenState extends State<Topic1Screen> {
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
        title: const Text('Topic 1 : Introduction to CSS'),
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
              'CSS is an abbreviation of Cascading Style Sheets. The content of the document is defined by HTML and the presentation of the content is defined by the style sheet.'),
          spaceBetween(20),
          buildImageAsset('assets/topic1pic01.png'),
          spaceBetween(50),
          // ------------------------------------------- CSS Syntax sub-section
          buildSubtopic('CSS Syntax'),
          spaceBetween(10),
          buildContent(
              'A CSS rule consists of a selector and a declaration, which may be one or more. The syntax is shown in the following diagram.'),
          spaceBetween(25),
          buildImageAsset('assets/topic1pic02.png'),
          spaceBetween(25),
          buildBulletList('Selector : HTML element to be styled'),
          buildBulletList('Declaration : Made up of property and value'),
          buildBulletList('Property : Attribute to be changed'),
          buildBulletList('Value : Attribute to be set as'),
          spaceBetween(20),
          buildContent(
              'The declaration ends with a semi-colon. The set of declaration is wrapped with curly brackets.'),
          spaceBetween(50),
          // ------------------------------------------------ Type of Selectors
          buildSubtopic('Type of Selectors'),
          spaceBetween(15),

          buildContent('a) ID'),
          buildBulletList('Using HTML id attribute to select specific element'),
          buildBulletList(
              'Write the hash (#) character followed by the element id'),
          spaceBetween(10),
          buildContent('Example: '),
          spaceBetween(5),
          buildCode('#style1 { text-align: center; }'),
          spaceBetween(20),

          buildContent('b) Class'),
          buildBulletList('HTML elements with a specific class attribute'),
          buildBulletList(
              'Write the period (.) character followed by the class name'),
          spaceBetween(10),
          buildContent('Example: '),
          spaceBetween(5),
          buildCode('.redText { color: red; }'),
          spaceBetween(20),

          buildContent('c) Universal'),
          buildBulletList('Affects all HTML elements on the page'),
          buildBulletList('Defined using asterisk character (*)'),
          spaceBetween(10),
          buildContent('Example: '),
          spaceBetween(5),
          buildCode('* { color: black; }'),
          spaceBetween(20),

          buildContent('d) Grouping'),
          buildBulletList('Grouped by specific HTML elements'),
          buildBulletList('Defined using the HTML elements'),
          spaceBetween(10),
          buildContent('Example: '),
          spaceBetween(5),
          buildCode('p { color: black; }'),

          spaceBetween(50),
          // ---------------------------------------------------- CSS Comments
          buildSubtopic('CSS Comments'),
          spaceBetween(10),
          buildContent(
              'A comment can span multiple lines, but it cannot be nested. Here are examples of a single-line comment and multi-line comment.'),
          spaceBetween(25),
          buildContent('Example: '),
          spaceBetween(5),
          buildCode('/* comment here */'),
          spaceBetween(25),
        ],
      ),
    );
  }
}
