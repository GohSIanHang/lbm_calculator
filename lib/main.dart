import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _acontroller = TextEditingController();
  final TextEditingController _bcontroller = TextEditingController();
  double a = 0.0, b = 0.0, boer = 0.0, james = 0.0, hume = 0.0, peters = 0.0;
  double fatB = 0.0, fatJ = 0.0, fatH = 0.0, fatP = 0.0;
  int selectedRadio1;
  int selectedRadio2;

  @override
  void initState() {
    super.initState();
    selectedRadio1 = 1;
    selectedRadio2 = 3;
  }

  setSelectedRadio1(int val) {
    setState(() {
      selectedRadio1 = val;
    });
  }

  setSelectedRadio2(int val) {
    setState(() {
      selectedRadio2 = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lean Body Mass Calculator',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.green[200],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.teal[700],
          title: Text('Lean Body Mass Calculator'),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
              Colors.blue[300],
              Colors.blue[50],
              Colors.blue[300]
            ])),
            height: 480,
            width: 350,
            child: Card(
              elevation: 5,
              color: Colors.white70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Gender?",
                    style: new TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w900),
                  ),
                  ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Radio(
                            value: 1,
                            groupValue: selectedRadio1,
                            onChanged: (val) {
                              setSelectedRadio1(val);
                            }),
                        Text(
                          'Male',
                          style: new TextStyle(fontSize: 15.0),
                        ),
                        Radio(
                            value: 2,
                            groupValue: selectedRadio1,
                            onChanged: (val) {
                              setSelectedRadio1(val);
                            }),
                        Text(
                          'Female',
                          style: new TextStyle(fontSize: 15.0),
                        ),
                      ]),
                  Text(
                    "Age 14 or younger?",
                    style: new TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w900),
                  ),
                  ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Radio(
                            value: 3,
                            groupValue: selectedRadio2,
                            onChanged: (val) {
                              setSelectedRadio2(val);
                            }),
                        Text(
                          'Yes',
                          style: new TextStyle(fontSize: 15.0),
                        ),
                        Radio(
                            value: 4,
                            groupValue: selectedRadio2,
                            onChanged: (val) {
                              setSelectedRadio2(val);
                            }),
                        Text(
                          'No',
                          style: new TextStyle(fontSize: 15.0),
                        ),
                      ]),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Height (cm)'),
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _acontroller,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 1),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Weight (kg)'),
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _bcontroller,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: RaisedButton(
                          color: Colors.blue[200],
                          child: Text("Calculate"),
                          onPressed: _onPress,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: RaisedButton(
                            color: Colors.blue[200],
                            child: Text("Clear"),
                            onPressed: () {
                              _acontroller.clear();
                              _bcontroller.clear();
                              boer = 0.0;
                              james = 0.0;
                              hume = 0.0;
                              peters = 0.0;
                              fatB = 0.0;
                              fatJ = 0.0;
                              fatH = 0.0;
                              fatP = 0.0;
                              setState(() {});
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Results of LBM(Kg) & Body Fat(%):-',
                    style: new TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Peters (for Children):" +
                        peters.toStringAsFixed(1) +
                        "Kg (" +
                        fatP.toStringAsFixed(0) +
                        "%-Body Fat)",
                    style: new TextStyle(fontSize: 15.0),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    "Boer:" +
                        boer.toStringAsFixed(1) +
                        "Kg (" +
                        fatB.toStringAsFixed(0) +
                        "%-Body Fat)",
                    style: new TextStyle(fontSize: 15.0),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    "James:" +
                        james.toStringAsFixed(1) +
                        "Kg (" +
                        fatJ.toStringAsFixed(0) +
                        "%-Body Fat)",
                    style: new TextStyle(fontSize: 15.0),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    "Hume:" +
                        hume.toStringAsFixed(1) +
                        "Kg (" +
                        fatH.toStringAsFixed(0) +
                        "%-Body Fat)",
                    style: new TextStyle(fontSize: 15.0),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onPress() {
    setState(() {
      a = double.parse(_acontroller.text);
      b = double.parse(_bcontroller.text);
      if (selectedRadio1 == 1) {
        boer = (0.407 * b) + (0.267 * a) - 19.2;
        james = (1.1 * b) - (128 * (b / a) * (b / a));
        hume = (0.32810 * b) + (0.33929 * a) - 29.5336;
      } else {
        boer = (0.252 * b) + (0.473 * a) - 48.3;
        james = (1.07 * b) - (148 * (b / a) * (b / a));
        hume = (0.2956 * b) + (0.41813 * a) - 43.2933;
      }
      fatB = 100 - ((boer / b) * 100);
      fatJ = 100 - ((james / b) * 100);
      fatH = 100 - ((hume / b) * 100);
      if (selectedRadio2 == 3) {
        peters = ((0.0215) * (pow(b, 0.6469)) * (pow(a, 0.7236))) * 3.8;
        fatP = 100 - ((peters / b) * 100);
      } else {
        fatP = 0.0;
        peters = 0.0;
      }
    });
  }
}
