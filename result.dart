import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore == 5) {
      resultText = ' You got 5/5 :) \nExcellent\n';
    } else if (resultScore == 4) {
      resultText = ' You got 4/5.....\nKeep Trying\n';
    } else if (resultScore == 3) {
      resultText = ' You got 3/5.....\nKeep Trying\n';
    } else if (resultScore == 2) {
      resultText = ' You got 2/5.....\nKeep Trying\n';
    } else if (resultScore == 1) {
      resultText = ' You got 1/5 :(';
    } else {
      resultText = 'Oops...\nYou got nothing, Try again!\n';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(20, 200, 20, 50),
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetHandler,
            child: Text(
              'Restart Quiz',
              style: TextStyle(fontSize: 28, color: Colors.purple[400]),
            ),
          )
        ],
      ),
    );
  }
}
