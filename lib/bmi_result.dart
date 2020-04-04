import 'package:flutter/material.dart';
import 'dart:math';

class BMIResult extends StatelessWidget {
  BMIResult(
      {@required this.tinggiBadan,
      @required this.beratBadan,
      @required this.nama,
      @required this.umur,
      @required this.gender,
      @required this.tanggal});

  final int tinggiBadan;
  final int beratBadan;
  final String nama;
  final int umur;
  final String gender;
  final DateTime tanggal;

  @override
  Widget build(BuildContext context) {
    double bmi = beratBadan / pow(tinggiBadan / 100, 2);
    String cBMI;
    if (bmi >= 28)
      cBMI = "Obese";
    else if (bmi >= 23)
      cBMI = "Overweight";
    else if (bmi >= 17.5)
      cBMI = "Normal";
    else
      cBMI = "Underweight";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('RESULT'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Hello, " + nama + ' ' + 'this your result:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'serif',
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.only(top: 35.0),
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(52),
                  topRight: Radius.circular(52),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Age : ' + umur.toString(),
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Gender: ' + gender,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                  Text(
                    'Birth Date: $tanggal',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                  Text(
                    cBMI,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    bmi.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.w800,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    'Normal BMI Range',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '17,5 -  22.9 ',
                    style: TextStyle(
                      height: 2.0,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 80,
        child: RaisedButton(
          color: Colors.black54,
          child: Text(
            'BACK',
            style: TextStyle(fontSize: 30),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
