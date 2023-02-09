import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore <= 8) {
      resultText = 'Pretty Likeable!';
    } else if (resultScore <= 12) {
      resultText = 'awesome!';
    } else if (resultScore <= 16) {
      resultText = 'Super awesome!';
    } else {
      resultText = 'good!';
    }
    return resultText;
  } //getter never receive an argument

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(onPressed:resetHandler, child: Text('Restart Quiz!'),
          style: TextButton.styleFrom(primary:Colors.purple ),)
        ],
      ),
    );
  }
}
