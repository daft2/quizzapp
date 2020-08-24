import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = new QuizBrain();

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizzPage(),
          ),
        ),
      ),
    );
  }
}

class QuizzPage extends StatefulWidget {
  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  List<Icon> scoreKeeper = [];

  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                quizBrain.questionBank[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: FlatButton(
              onPressed: () {
                bool correctAnswer =
                    quizBrain.questionBank[questionNumber].questionAnswer;

                if (correctAnswer == true) {
                  setState(() {
                    scoreKeeper.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  });
                } else {
                  setState(() {
                    scoreKeeper.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  });
                }
                questionNumber++;
              },
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: FlatButton(
              onPressed: () {
                setState(() {
                  scoreKeeper.removeLast();
                  questionNumber++;
                });
              },
              textColor: Colors.white,
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
/*
question1:  false,
question2:  true,
question3:  true,
*/
