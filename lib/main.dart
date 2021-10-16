import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './Questions.dart';
import 'quiz_FlatButtons.dart';
import './question_brain.dart';
import 'package:fancy_dialog/fancy_dialog.dart';

QuestionsBrain questionsBrain = QuestionsBrain();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: true, home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Icon> showTrueFalse = [];
  //Here Score are Counted
  int userScore = 0;
  @override
  Widget build(BuildContext context) {
    //This is method to reset by AlertDialog
    void reset() {
      questionsBrain.alert(context, userScore, () {
        setState(() {
          Navigator.pop(context);
          questionsBrain.resetQuestionValue();
          userScore = 0;
          showTrueFalse.clear();
        });
      });
    }

    //This method is To Control Range of List Of Answer Questions
    void userAnswerCheck(bool userPickedAnswer) {
      bool correctAnswer = questionsBrain.getAnswer();
      if (questionsBrain.questionValue() <
          questionsBrain.quizBrainLength() - 1) {
        setState(() {
          if (userPickedAnswer == correctAnswer) {
            userScore++;
            showTrueFalse.add(
              Icon(
                Icons.check,
                color: Colors.green,
              ),
            );
          } else {
            showTrueFalse.add(
              Icon(
                Icons.close,
                color: Colors.red,
              ),
            );
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  '${questionsBrain.getQuestion()},',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),

          //True Button
          QuizFlatButton('True', () {
            //Check Conditions And Control answerQuestion Index And Add Check Icon

            userAnswerCheck(true);
            reset();
            questionsBrain.increaseQuestion();
          }, Colors.red),
          QuizFlatButton('False', () {
            reset();
            userAnswerCheck(false);
            questionsBrain.increaseQuestion();
          }, Colors.green),

          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: showTrueFalse,
            ),
          )
        ],
      ),
    );
  }
}
/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
