import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './widgets/calculator_button.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  int firstNum = 0;
  int secondNum = 0;
  String history = '';
  String textToDisplay = '';
  String res = '';
  String operation = '';

  void btnOnClick(String btnVal) {
    print(btnVal);
    if (btnVal == 'C') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
      operation = '';
    } else if (btnVal == 'AC') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
      history = '';
      operation = '';
    } else if (btnVal == '+/-') {
      if (textToDisplay.isNotEmpty && textToDisplay[0] == '-') {
        res = textToDisplay.substring(1);
      } else {
        res = '-' + textToDisplay;
      }
    } else if (btnVal == 'DEL') {
      if (textToDisplay.isNotEmpty) {
        res = textToDisplay.substring(0, textToDisplay.length - 1);
      }
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'X' ||
        btnVal == '/') {
      firstNum = int.tryParse(textToDisplay) ?? 0;
      res = '';
      operation = btnVal;
      history = firstNum.toString() + ' ' + operation + ' ';
    } else if (btnVal == '=') {
      secondNum = int.tryParse(textToDisplay) ?? 0;
      if (operation == '+') {
        res = (firstNum + secondNum).toString();
      } else if (operation == '-') {
        res = (firstNum - secondNum).toString();
      } else if (operation == 'X') {
        res = (firstNum * secondNum).toString();
      } else if (operation == '/') {
        if (secondNum != 0) {
          res = (firstNum / secondNum).toString();
        } else {
          res = 'Error';
        }
      }
      history = '$firstNum $operation $secondNum = $res';
      operation = '';
      textToDisplay = res;
    } else {
      res = textToDisplay + btnVal;
      textToDisplay = res;
    }

    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Calculator',
            style: GoogleFonts.teko(
              textStyle: TextStyle(fontSize: 28, color: Colors.black),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 4,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              alignment: Alignment.bottomRight,
              child: Text(
                history,
                style: GoogleFonts.teko(
                  textStyle: const TextStyle(fontSize: 24, color: Colors.grey),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              alignment: Alignment.bottomRight,
              child: Text(
                textToDisplay,
                style: GoogleFonts.teko(
                  textStyle: const TextStyle(
                      fontSize: 80, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                color: Colors.grey[200],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalculatorButton(
                          text: 'AC',
                          fillColor: 0xffd71313,
                          textColor: 0xfffff2f2,
                          textSize: 30,
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: 'C',
                          fillColor: 0xfff4ce14,
                          textColor: 0xff181815,
                          textSize: 30,
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '+/-',
                          fillColor: 0xfff4ce14,
                          textColor: 0xff181815,
                          textSize: 30,
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '/',
                          fillColor: 0xff005c78,
                          textColor: 0xfffff2f2,
                          textSize: 30,
                          callback: btnOnClick,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalculatorButton(
                          text: '7',
                          fillColor: 0xff43766c,
                          textColor: 0xfffff2f2,
                          textSize: 30,
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '8',
                          fillColor: 0xff43766c,
                          textColor: 0xfffff2f2,
                          textSize: 30,
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '9',
                          fillColor: 0xff43766c,
                          textColor: 0xfffff2f2,
                          textSize: 30,
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: 'X',
                          fillColor: 0xff005c78,
                          textColor: 0xfffff2f2,
                          textSize: 30,
                          callback: btnOnClick,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalculatorButton(
                          text: '4',
                          fillColor: 0xff43766c,
                          textColor: 0xfffff2f2,
                          textSize: 30,
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '5',
                          fillColor: 0xff43766c,
                          textColor: 0xfffff2f2,
                          textSize: 30,
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '6',
                          fillColor: 0xff43766c,
                          textColor: 0xfffff2f2,
                          textSize: 30,
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '-',
                          fillColor: 0xff005c78,
                          textColor: 0xfffff2f2,
                          textSize: 30,
                          callback: btnOnClick,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalculatorButton(
                          text: '1',
                          fillColor: 0xff43766c,
                          textColor: 0xfffff2f2,
                          textSize: 30,
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '2',
                          fillColor: 0xff43766c,
                          textColor: 0xfffff2f2,
                          textSize: 30,
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '3',
                          fillColor: 0xff43766c,
                          textColor: 0xfffff2f2,
                          textSize: 30,
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '+',
                          fillColor: 0xff005c78,
                          textColor: 0xfffff2f2,
                          textSize: 30,
                          callback: btnOnClick,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalculatorButton(
                          text: '0',
                          fillColor: 0xff43766c,
                          textColor: 0xfffff2f2,
                          textSize: 30,
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '00',
                          fillColor: 0xff43766c,
                          textColor: 0xfffff2f2,
                          textSize: 30,
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '.',
                          fillColor: 0xff43766c,
                          textColor: 0xfffff2f2,
                          textSize: 30,
                          callback: btnOnClick,
                        ),
                        CalculatorButton(
                          text: '=',
                          fillColor: 0xffff8225,
                          textColor: 0xff181815,
                          textSize: 30,
                          callback: btnOnClick,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
