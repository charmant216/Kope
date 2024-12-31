import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculatrice Simple',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _displayText = '0';
  String _operand = '';
  double? _firstNumber;
  double? _secondNumber;

  void _onButtonPressed(String value) {
    setState(() {
      if (RegExp(r'[0-9]').hasMatch(value)) {
        // Gérer les chiffres
        if (_displayText == '0') {
          _displayText = value;
        } else {
          _displayText += value;
        }
      } else if (['+', '-', '×', '÷'].contains(value)) {
        // Gérer les opérateurs
        _operand = value;
        _firstNumber = double.tryParse(_displayText);
        _displayText = '0';
      } else if (value == '=') {
        // Gérer le calcul
        _secondNumber = double.tryParse(_displayText);
        if (_firstNumber != null && _secondNumber != null) {
          switch (_operand) {
            case '+':
              _displayText = (_firstNumber! + _secondNumber!).toString();
              break;
            case '-':
              _displayText = (_firstNumber! - _secondNumber!).toString();
              break;
            case '×':
              _displayText = (_firstNumber! * _secondNumber!).toString();
              break;
            case '÷':
              if (_secondNumber! != 0) {
                _displayText = (_firstNumber! / _secondNumber!).toString();
              } else {
                _displayText = 'Erreur';
              }
              break;
          }
        }
        _operand = '';
        _firstNumber = null;
        _secondNumber = null;
      } else if (value == 'C') {
        // Gérer la réinitialisation
        _displayText = '0';
        _operand = '';
        _firstNumber = null;
        _secondNumber = null;
      }
    });
  }

  Widget _buildButton(String text, Color color) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.all(20),
        ),
        onPressed: () => _onButtonPressed(text),
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculatrice Simple'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black12,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(20),
              child: Text(
                _displayText,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  _buildButton('7', Colors.blue),
                  _buildButton('8', Colors.blue),
                  _buildButton('9', Colors.blue),
                  _buildButton('÷', Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton('4', Colors.blue),
                  _buildButton('5', Colors.blue),
                  _buildButton('6', Colors.blue),
                  _buildButton('×', Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton('1', Colors.blue),
                  _buildButton('2', Colors.blue),
                  _buildButton('3', Colors.blue),
                  _buildButton('-', Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton('C', Colors.red),
                  _buildButton('0', Colors.blue),
                  _buildButton('=', Colors.green),
                  _buildButton('+', Colors.orange),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
