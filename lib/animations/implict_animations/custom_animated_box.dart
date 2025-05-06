import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animations/reusable_widgets.dart/custom_button.dart';

class CustomAnimatedBox extends StatefulWidget {
  const CustomAnimatedBox({super.key});

  @override
  State<CustomAnimatedBox> createState() => _CustomAnimatedBoxState();
}

class _CustomAnimatedBoxState extends State<CustomAnimatedBox> {
  final double sizedBoxValue = 15;

  //Random Number Generator For Random Properties
  final Random _random = Random();
  bool _isExpanded = false;

  //Initial Properties
  double _width = 100;
  double _height = 100;
  Color _color = Colors.lightBlue;
  double _borderRadius = 10;
  Alignment _alignment = Alignment.center;

  //Method to Toggle the Box State
  void _toggleBox() {
    setState(() {
      _isExpanded = !_isExpanded;
      _width = _isExpanded ? 200 : 100;
      _height = _isExpanded ? 200 : 100;
      _color = _isExpanded ? Colors.green : Colors.lightBlue;
      _borderRadius = _isExpanded ? 50 : 10;
      _alignment = _isExpanded ? Alignment.bottomRight : Alignment.topCenter;
    });
  }

  //Randomize Properties
  void _randomizeProperties() {
    setState(() {
      _width = 100.00 + _random.nextInt(200);
      _height = 100.00 + _random.nextInt(200);
      _color = Color.fromRGBO(
        _random.nextInt(256),
        _random.nextInt(226),
        _random.nextInt(226),
        2,
      );
      _borderRadius = _random.nextDouble() * 100;
      _alignment = Alignment(
        _random.nextDouble() * 2 - 1,
        _random.nextDouble() * 2 - 1,
      );
    });
  }

  //Reset Values
  void _resetValues() {
    setState(() {
      _width = 100;
      _height = 100;
      _color = Colors.lightBlue;
      _borderRadius = 10;
      _alignment = Alignment.center;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Animated Box",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _toggleBox,
              child: AnimatedContainer(
                padding: EdgeInsets.all(10),
                width: _width,
                height: _height,
                alignment: _alignment,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
                duration: Duration(seconds: 1),
                child: FlutterLogo(size: 60),
              ),
            ),
            SizedBox(height: sizedBoxValue * 2),
            CustomButton(
              text: "Randomize Properties",
              onTap: _randomizeProperties,
            ),
            SizedBox(height: sizedBoxValue),
            CustomButton(text: "Reset Properties", onTap: _resetValues),
          ],
        ),
      ),
    );
  }
}
