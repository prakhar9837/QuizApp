import 'package:flutter/material.dart';
import 'QuizBrainFile.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text('Quiz App'),
          backgroundColor: Colors.blue[900],
        ),
        body: SafeArea(child: QuesPage()),
      ),
    );
  }
}

class QuesPage extends StatefulWidget {
  @override
  _QuesPageState createState() => _QuesPageState();
}

class _QuesPageState extends State<QuesPage> {
  List<Widget> scoreKeeper = [];

  void checkAnswer(bool userPickAnswer) {
    setState(() {
      bool ans = quizBrain.returnAnswer();
      if (ans == userPickAnswer) {
        print('Correct answer');
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        print('wrong answer');
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      quizBrain.increQuestion();
      bool a = quizBrain.endFile();

      if (a == true) {
        scoreKeeper.clear();
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizBrain.returnQuestion(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              child: Text('True'),
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              child: Text('False'),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
