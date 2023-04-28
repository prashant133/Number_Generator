import 'dart:math';

import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int randomNum1 = Random().nextInt(101);
  int randomNum2 = Random().nextInt(101);
  int totalClicks = 0;
  int correctAnswer = 0;
  int incorrectAnswer = 0;
  bool isGameFinished = false;

  @override
  void initState() {
    super.initState();
    if (randomNum1 == randomNum2) {
      insertRandomNumber();
    }
  }

  void insertRandomNumber() {
    randomNum1 = Random().nextInt(101);
    randomNum2 = Random().nextInt(101);
  }

  void checkAnswer(int buttonNum) {
    if (totalClicks < 10) {
      if (buttonNum == 1) {
        if (randomNum1 > randomNum2) {
          correctAnswer++;
        } else {
          incorrectAnswer++;
        }
      } else if (buttonNum == 2) {
        if (randomNum2 > randomNum1) {
          correctAnswer++;
        } else {
          incorrectAnswer++;
        }
      }

      insertRandomNumber();
      if (randomNum1 == randomNum2) {
        insertRandomNumber();
      }
    } else {
      isGameFinished = true;
    }

    totalClicks++;
  }

  void reset() {
    totalClicks = 0;
    isGameFinished = false;
    correctAnswer = 0;
    incorrectAnswer = 0;
    insertRandomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          checkAnswer(1);
                        });
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                      child: Text(
                        randomNum1.toString(),
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          checkAnswer(2);
                        });
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                      child: Text(
                        randomNum2.toString(),
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              const Text(
                "Result",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Remaining : ${isGameFinished ? 0 : 10 - totalClicks}",
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Correct Answer : ${isGameFinished ? correctAnswer : ""}",
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Incorrect Answer : ${isGameFinished ? incorrectAnswer : ""}",
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    reset();
                  });
                },
                child: const Text(
                  "Reset",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}