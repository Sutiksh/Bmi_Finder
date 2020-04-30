import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double meters = 0.0;
  double result = 0.0;
  String resultReadig = "";
  String finalResult = "";

  void showResult() {
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text),
          meters = (height) / 100;
      double weight = double.parse(_weightController.text);

      if ((_ageController.text.isNotEmpty || age > 0) &&
          ((_heightController.text.isNotEmpty || meters > 0) &&
              (_weightController.text.isNotEmpty || weight > 0))) {
        result = weight / (meters * meters);

        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          resultReadig = "UNDERWEIGHT";
          print(resultReadig);
        } else if (double.parse(result.toStringAsFixed(1)) >= 18.5 &&
            result < 25) {
          resultReadig = "GREAT SHAPE";
          print(resultReadig);
        } else if (double.parse(result.toStringAsFixed(1)) > 25) {
          resultReadig = 'OVERWEIGHT';
          print(resultReadig);
        }
      } else {
        result = 0.0;
      }
    });
    finalResult = "Your BMI : ${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'BMI',
          style: TextStyle(fontSize: 24),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Image.asset(
            'images/bmi.png',
            height: 90,
            width: 90,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100.0, right: 100.0),
            child: new TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: 'Age',
                prefixIcon: Icon(Icons.person),
              ),
            ),
          ),
          new SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.only(left: 100.0, right: 100.0),
            child: new TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: 'Height in cm',
                prefixIcon: Icon(Icons.assessment),
              ),
            ),
          ),
          new SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.only(left: 100.0, right: 100.0),
            child: new TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: 'Weight in kg',
                prefixIcon: Icon(Icons.toc),
              ),
            ),
          ),
          new SizedBox(height: 10.0),
          new Center(
            child: RaisedButton(
              onPressed: showResult,
              color: Colors.lightBlue,
              child: new Text(
                'Calculate',
                style: new TextStyle(
                  fontSize: 18.5,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          new Text(
            "$finalResult",
            style: new TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),
          ),
          new SizedBox(height: 10.0),
          new Text(
            "$resultReadig",
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: 18.5,
            ),
          ),
        ]),
      ),
    );
  }
}
