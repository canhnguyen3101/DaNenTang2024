import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 29, 140, 224),
        appBar: AppBar(
          title: const Center(
            child: Text('Magic 8 Ball'),
          ),
          backgroundColor: const Color.fromARGB(255, 29, 140, 224),
        ),
        body: Magic8Ball(),
      ),
    ),
  );
}

class Magic8Ball extends StatefulWidget {
  const Magic8Ball({Key? key});

  @override
  _Magic8BallState createState() => _Magic8BallState();
}

class _Magic8BallState extends State<Magic8Ball> {
  List<String> answers = [
    "Yes",
    "No",
    "Maybe",
    "Try again later",
    "Outlook not so good",
    "Definitely",
    "Ask again",
    "Cannot predict now",
    "Absolutely",
    "Don't count on it",
    "It is certain",
    "Very doubtful",
    "Signs point to yes",
    "Concentrate and ask again",
    "My sources say no",
    "Without a doubt",
    "Reply hazy, try again",
    "Better not tell you now",
    "As I see it, yes",
    "Most likely",
  ];

  String currentAnswer = "Tap the Magic 8 Ball for your answer!";

  void getPrediction() {
    setState(() {
      currentAnswer = answers[Random().nextInt(answers.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
            onPressed: () {
              getPrediction();
            },
            child: Text(
              currentAnswer,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
