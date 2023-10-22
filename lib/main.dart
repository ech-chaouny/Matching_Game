import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepOrange[100],
        appBar: AppBar(
          title: const Text(
            'Match Game',
            style: TextStyle(
              fontFamily: 'Gabarito',
            ),
          ),
          backgroundColor: Colors.deepOrange[400],
        ),
        body: const ImagePage(),
      ),
    );
  }
}

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  var leftImageName = 'naruto';
  var rightImageName = 'sasuke';

  final List<String> arrayList = [
    'boy',
    'burto',
    'cat',
    'dog',
    'elephant',
    'elephant_1',
    'giraffe',
    'jin',
    'lion',
    'monkey',
    'naruto',
    'sasuke',
  ];
  void changeImageName() {
    leftImageName = arrayList[Random().nextInt(arrayList.length)];
    rightImageName = arrayList[Random().nextInt(arrayList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Text(
            leftImageName == rightImageName
                ? 'Congratulations, you won'
                : 'Try again !',
            style: const TextStyle(
              fontFamily: 'Gabarito',
              color: Colors.black87,
              fontSize: 30.0,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      changeImageName();
                    });
                  },
                  child: Image.asset('images/$leftImageName.png'),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      changeImageName();
                    });
                  },
                  child: Image.asset('images/$rightImageName.png'),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: FilledButton(
            onPressed: () {
              setState(() {
                changeImageName();
              });
            },
            style: ElevatedButton.styleFrom(
              primary:
                  Colors.deepOrange, // Change the button background color here
              padding: const EdgeInsets.only(
                  left: 50.0, right: 50.0), // Set padding here
            ),
            child: Text(
              leftImageName == rightImageName ? 'Replay' : 'Play',
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Gabarito',
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
