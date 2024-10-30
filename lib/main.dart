import 'package:flutter/material.dart';

void main() {
  runApp(KalkulatorApp());
}

class KalkulatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator Sederhana',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Kalkulator(),
    );
  }
}

class Kalkulator extends StatefulWidget {
  @override
  _KalkulatorState createState() => _KalkulatorState();
}

class _KalkulatorState extends State<Kalkulator> {
  String hasil = '0';
  String input = '';
  String operasi = '';
  double angkaPertama = 0;
  double angkaKedua = 0; 

  void tekanTombol(String nilai) {
    setState(() {
      if (nilai == 'C') {
        hasil = '0';
        input = '';
        angkaPertama = 0;
        angkaKedua = 0;
        operasi = '';
      } else if (nilai == '+' || nilai == '-' || nilai == '×' || nilai == '÷') {
        angkaPertama = double.parse(input);
        operasi = nilai;
        input = '';
      } else if (nilai == '=') {
        angkaKedua = double.parse(input);
        if (operasi == '+') {
          hasil = (angkaPertama + angkaKedua).toString();
        } else if (operasi == '-') {
          hasil = (angkaPertama - angkaKedua).toString();
        } else if (operasi == '×') {
          hasil = (angkaPertama * angkaKedua).toString();
        } else {
          hasil = (angkaPertama / angkaKedua).toString();
        }
        input = '';
      } else {
        input += nilai; 
        hasil = input;
      }
    });
  }

  Widget buildButton(String text, Color color) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20.0),
          backgroundColor: color,
        ),
        onPressed: () => tekanTombol(text),
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ini Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              child: Text(
                hasil,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: <Widget>[
                  buildButton('7', Colors.grey),
                  buildButton('8', Colors.grey),
                  buildButton('9', Colors.grey),
                  buildButton('÷', Color.fromARGB(255, 255, 238, 0)),
                ],
              ),
              SizedBox(height: 3,width: 3,),
              Row(
                children: <Widget>[
                  buildButton('4', Colors.grey),
                  buildButton('5', Colors.grey),
                  buildButton('6', Colors.grey),
                  buildButton('×', Color.fromARGB(255, 255, 238, 0)),
                ],
              ),
              SizedBox(height: 3,width: 3,),
              Row(
                children: <Widget>[
                  buildButton('1', Colors.grey),
                  buildButton('2', Colors.grey),
                  buildButton('3', Colors.grey),
                  buildButton('-', Color.fromARGB(255, 255, 238, 0)),
                ],
              ),
              SizedBox(height: 3,width: 3,),
              Row(
                children: <Widget>[
                  buildButton('C', Colors.red),
                  buildButton('0', Colors.grey),
                  buildButton('=', Colors.green),
                  buildButton('+', Color.fromARGB(255, 255, 238, 0)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
