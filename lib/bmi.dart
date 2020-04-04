import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'bmi_result.dart';
import 'about.dart';

enum PageEnum {
  aboutPage
}

class InputBMI extends StatefulWidget {
  @override
  _InputBMIState createState() => _InputBMIState();
}

class _InputBMIState extends State<InputBMI> {
  int tinggi = 0;
  int berat = 0;
  String name = '';
  int age = 0;
  DateTime date;
  String _valGender;
  List _listGender = ["Male", " Female"];

  _onSelect (PageEnum value){
    switch(value){
      case PageEnum.aboutPage:
        Navigator.of(context).push(
          CupertinoPageRoute(builder: (BuildContext context)=>AboutPage())
        );
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator App'),
        actions: <Widget>[
          PopupMenuButton<PageEnum>(
            onSelected: _onSelect,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<PageEnum>(
                  value: PageEnum.aboutPage,
                  child: ListTile(
                    leading: Icon(Icons.feedback),
                    title: Text('About'),
                  ),
                ),
              ];
            },
          ),
        ],
        centerTitle: true,
        leading: Icon(
          Icons.favorite,
          color: Colors.pink[300],
          size: 30.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image.asset(
                'images/19834.jpg',
                height: 150.0,
                width: 200.0,
              ),
            ),
            Text(
              'Calculated Your BMI',
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 0.5,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'serif',
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                onChanged: (txt) {
                  setState(() {
                    name = (txt);
                  });
                },
                keyboardType: TextInputType.text,
                style: TextStyle(
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  filled: true,
                  labelText: 'Name',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(3),
                      ],
                      onChanged: (txt) {
                        setState(() {
                          tinggi = int.parse(txt);
                        });
                      },
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        suffix: Text('cm'),
                        filled: true,
                        labelText: 'Height',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(3),
                      ],
                      onChanged: (txt) {
                        setState(() {
                          berat = int.parse(txt);
                        });
                      },
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        suffix: Text('kg'),
                        filled: true,
                        labelText: 'Weight',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 60,
                      padding: EdgeInsets.all(13.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(color: Colors.black),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          hint: Center(
                              child: Text(
                            "Gender",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 19.0,
                            ),
                          )),
                          value: _valGender,
                          items: _listGender.map((value) {
                            return DropdownMenuItem(
                              child: Text(value,
                                  style: TextStyle(fontSize: 19.0),
                                  textAlign: TextAlign.center),
                              value: value,
                            );
                          }).toList(),
                          onChanged: (txt) {
                            setState(() {
                              _valGender = txt;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      onChanged: (txt) {
                        setState(() {
                          age = int.parse(txt);
                        });
                      },
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        filled: true,
                        labelText: 'Age',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: DateTimePickerFormField(
                inputType: InputType.date,
                format: DateFormat("yyyy-MM-dd"),
                onChanged: (txt) {
                  setState(() {
                    date = (txt);
                  });
                },
                style: TextStyle(
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  filled: true,
                  labelText: 'Date of Birth',
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: RaisedButton(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BMIResult(
                              tinggiBadan: tinggi,
                              beratBadan: berat,
                              nama: name,
                              umur: age,
                              gender: _valGender,
                              tanggal: date,
                            )),
                  );
                },
                color: Colors.blue,
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
