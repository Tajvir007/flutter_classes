import 'package:flutter/material.dart';
import 'package:flutter_classes/module%2012/calculator/widgets/build_button.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  // Calculator Functional
  // 1. Initialize variable
  String _input = '0';
  String _output = '0';
  String _operator = '';
  double num1 = 0;
  double num2 = 0;

  void onPressed(String value){
    print('Button clicked: ${value}');

    setState(() {

      if(value == 'C'){
         _input = '0';
         _output = '0';
         _operator = '';
         num1 = 0;
         num2 = 0;
      } else if(value == '='){
        if(_operator.isNotEmpty && _input.isNotEmpty){

          num2 = double.parse(_input);
          switch(_operator){
            case '+':
              _output = (num1 + num2).toString();
              break;

            case '-':
              _output = (num1 - num2).toString();
              break;

            case '*':
              _output = (num1 * num2).toString();
              break;

            case '/':
              _output = num2 != 0              // division এ 0 হলে error
                  ? (num1/num2).toString()     // num1 / num2 output এ রাখছি
                  : "Error";                   // num2 == 0 হলে Error দেখাবে
          }
          _input = _output;
          _operator = '';

        }
        return;
      }

      else if(['+', '-', '*', '/'].contains(value)){
        num1 = double.parse(_input);
        _operator = value;
        _input = '';
        return;
      } else{
        if(_input == '0'){
          _input = value;
        } else{
          _input += value;
        }
        _output = _input;
        print(_output);
      }



    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          children: [
            
            Expanded(
              child: Container(
              
                alignment: Alignment.bottomRight,
              
               child: Column(
                 children: [
                   Text(
                     '$num1 $_operator $_input',
                   style: TextStyle(
                     fontSize: 24,
                     color: Colors.grey,
                   ),),
              
              
                   SizedBox(height: 20,),
                   Text(
                     _output,
                     style: TextStyle(
                         fontSize: 50,
                         color: Colors.white,
                         fontWeight: FontWeight.bold
                     ),)
              
                 ],
               ),
              ),
            ),

            Row(
              children: [
                BuildButton(onClick: () => onPressed('7'), text: '7',),
                BuildButton(onClick: () => onPressed('8'), text: '8',),
                BuildButton(onClick: () => onPressed('9'), text: '9',),
                BuildButton(onClick: () => onPressed('/'), text: '/', color: Colors.green,),
              ],
            ),
            Row(
              children: [
                BuildButton(onClick: () => onPressed('4'), text: '4',),
                BuildButton(onClick: () => onPressed('5'), text: '5',),
                BuildButton(onClick: () => onPressed('6'), text: '6',),
                BuildButton(onClick: () => onPressed('*'), text: '*', color: Colors.green,),
              ],
            ),
            Row(
              children: [
                BuildButton(onClick: () => onPressed('1'), text: '1',),
                BuildButton(onClick: () => onPressed('2'), text: '2',),
                BuildButton(onClick: () => onPressed('3'), text: '3',),
                BuildButton(onClick: () => onPressed('-'), text: '-', color: Colors.green,),
              ],
            ),
            Row(
              children: [
                BuildButton(onClick: () => onPressed('C'), text: 'C',),
                BuildButton(onClick: () => onPressed('0'), text: '0',),
                BuildButton(onClick: () => onPressed('='), text: '=', color: Colors.green,),
                BuildButton(onClick: () => onPressed('+'), text: '+', color: Colors.green,),
              ],
            ),

          ],
        ),
      ),
    );
  }
}


