import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import './Questions.dart';

class QuestionsBrain {
  int _questionIndex = 0;
  List<Question> _questionAnswer = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  void alert(BuildContext context, int score, Function onPress) {
    if (_questionIndex >= _questionAnswer.length - 1) {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Quiz Ends!",
        desc: "You have Gain Score $score.",
        buttons: [
          DialogButton(
            child: Text(
              "Restart",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: onPress,
            width: 120,
          )
        ],
      ).show();
    } else {
      return;
    }
  }

  void increaseQuestion() {
    if (_questionIndex < _questionAnswer.length - 1) {
      _questionIndex++;
    }
  }

  String getQuestion() {
    return _questionAnswer[_questionIndex].questionText;
  }

  bool getAnswer() {
    return _questionAnswer[_questionIndex].answerText;
  }

  int quizBrainLength() {
    return _questionAnswer.length;
  }

  int questionValue() {
    return _questionIndex;
  }

  int resetQuestionValue() {
    return _questionIndex = 0;
  }
}
