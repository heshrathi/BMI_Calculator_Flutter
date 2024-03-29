import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../widgets/left_bar.dart';
import '../widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  // State<HomeScreen> createState() => _HomeScreenState();
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            color: accentColor,
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 50,
          ),
          LeftBar(barWidth: 100),
          SizedBox(
            height: 20,
          ),
          LeftBar(barWidth: 70),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Container for the Input Height
              Container(
                width: 130,
                child: TextField(
                  controller: _heightController,
                  style: TextStyle(
                    fontSize: 42.0,
                    fontWeight: FontWeight.w300,
                    color: accentColor,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(0.8))),
                ),
              ),

              //Container for the Input Weight
              Container(
                width: 130,
                child: TextField(
                  controller: _weightController,
                  style: TextStyle(
                    fontSize: 42.0,
                    fontWeight: FontWeight.w300,
                    color: accentColor,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(0.8))),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //for calculation button
              GestureDetector(
                onTap: () {
                  double _h = double.parse(_heightController.text);
                  double _w = double.parse(_weightController.text);
                  setState(() {
                    _bmiResult = _w / (_h * _h);
                    if (_bmiResult > 25) {
                      _textResult = "You\'re Over Weight";
                    } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                      _textResult = "You have Normal Weight";
                    } else {
                      _textResult = "You\'re Under Weight";
                    }
                  });
                },
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: accentColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: Text(
              _bmiResult.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 90,
                color: accentColor,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Visibility(
            visible: _textResult.isNotEmpty,
            child: Container(
              child: Text(
                _textResult,
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: accentColor),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          RightBar(barWidth: 60),
          SizedBox(
            height: 20,
          ),
          RightBar(barWidth: 90),
          SizedBox(
            height: 20,
          ),
          RightBar(barWidth: 130),
          SizedBox(
            height: 20,
          ),
          RightBar(barWidth: 90),
          SizedBox(
            height: 20,
          ),
          RightBar(barWidth: 60),
        ]),
      ),
    );
  }
}
