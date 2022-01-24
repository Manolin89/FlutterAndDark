import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScrore;

  Result(this.totalScrore);

  String get resultPhase {
    var resultText = 'You did it!';
    if (totalScrore <= 45) {
      resultText = 'You are awesome and inocent';
    } else if (totalScrore <= 50) {
      resultText = 'You are so good';
    } else {
      resultText = 'you are a excelent programer';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text(
        resultPhase,
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      //FlatButton(child: Text('Restart quiz'), onPressed: null,),
    );
  }
}
