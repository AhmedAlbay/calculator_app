import 'package:calculator_app/const_color.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  double firstnum = 0.0;
  double secondnum = 0.0;
  var input = '';
  var output = '';
  var operation = '';
  // ignore: non_constant_identifier_names
  OnButtonClick(value) {
    if (value == "AC") {
      input = '';
      output = '';
    } else if (value == "Del") {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == "=") {
      if (input.isNotEmpty) {
        var useInput = input;
        useInput = input.replaceAll('x', '*');
        Parser p = Parser();
        Expression expression = p.parse(useInput);
        ContextModel cm = ContextModel();
        var finalvalue = expression.evaluate(EvaluationType.REAL, cm);

        output = finalvalue.toString();
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }
        input = output;
      }
    } else {
      input = input + value;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  input,
                  style: const TextStyle(fontSize: 48, color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  output,
                  style: TextStyle(
                      fontSize: 34, color: Colors.white.withOpacity(.7)),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )),
          Row(
            children: [
              button(
                  text: 'AC',
                  tcolor: orangecolor,
                  backcolorbutton: operatorcolor),
              button(
                  text: 'Del',
                  backcolorbutton: operatorcolor,
                  tcolor: orangecolor),
              button(
                  text: 'none',
                  backcolorbutton: operatorcolor,
                  tcolor: orangecolor),
              button(
                  text: '/',
                  backcolorbutton: operatorcolor,
                  tcolor: orangecolor),
            ],
          ),
          Row(
            children: [
              button(text: '7'),
              button(text: '8'),
              button(text: '9'),
              button(
                  text: 'x',
                  tcolor: orangecolor,
                  backcolorbutton: operatorcolor),
            ],
          ),
          Row(
            children: [
              button(text: '4'),
              button(text: '5'),
              button(text: '6'),
              button(
                  text: '-',
                  tcolor: orangecolor,
                  backcolorbutton: operatorcolor),
            ],
          ),
          Row(
            children: [
              button(text: '1'),
              button(text: '2'),
              button(text: '3'),
              button(
                  text: '+',
                  tcolor: orangecolor,
                  backcolorbutton: operatorcolor),
            ],
          ),
          Row(
            children: [
              button(
                  text: '%',
                  tcolor: orangecolor,
                  backcolorbutton: operatorcolor),
              button(text: '0'),
              button(
                text: '.',
              ),
              button(text: '=', backcolorbutton: orangecolor),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({text, tcolor = Colors.white, backcolorbutton = buttoncolor}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backcolorbutton,
            padding: const EdgeInsets.all(22),
          ),
          onPressed: () => OnButtonClick(text),
          child: Text(text,
              style: TextStyle(
                  fontSize: 18, color: tcolor, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
