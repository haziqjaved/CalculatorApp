import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = "";

  Widget btn(texttt) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.grey,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(50.0)),
            padding: EdgeInsets.all(45)),
        onPressed: () {
          abc(texttt);
        },
        child: Text(
          texttt,
        ));
  }

  Widget funBtn(texttt) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.deepOrange,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(50.0)),
            padding: EdgeInsets.all(45)),
        onPressed: () {
          abc(texttt);
        },
        child: Text(
          texttt,
        ));
  }

  abc(texttt) {
    setState(() {
      result = result + texttt;
    });
  }

  clearr() {
    setState(() {
      result = "";
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });
  }

  // Main Body

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Calculator App",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.tealAccent),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              "$result",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn("1"),
              btn("2"),
              btn("3"),
              funBtn("+"),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn("4"),
              btn("5"),
              btn("6"),
              funBtn("-"),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn("7"),
              btn("8"),
              btn("9"),
              funBtn("*"),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn("0"),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0)),
                      padding: EdgeInsets.all(45)),
                  onPressed: output,
                  child: Text('=')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0)),
                      padding: EdgeInsets.all(45)),
                  onPressed: clearr,
                  child: Text('AC')),
              funBtn("/"),
            ],
          ),
        ],
      ),
      //  )
    );
  }
}
