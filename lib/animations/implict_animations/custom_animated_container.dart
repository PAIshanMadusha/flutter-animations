import 'package:flutter/material.dart';

class CustomAnimatedContainer extends StatefulWidget {
  const CustomAnimatedContainer({super.key});

  @override
  State<CustomAnimatedContainer> createState() =>
      _CustomAnimatedContainerState();
}

class _CustomAnimatedContainerState extends State<CustomAnimatedContainer> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Animated Container",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: AnimatedContainer(
            padding: EdgeInsets.all(10),
            duration: Duration(seconds: 1),
            width: _isExpanded ? 300 : 170,
            height: _isExpanded ? 300 : 170,
            decoration: BoxDecoration(
              color: _isExpanded ? Colors.blueAccent : Colors.amberAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            curve: Curves.easeInOut,
            child: Center(
              child: Text(
                "Flutter With PAIshanMadusha",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
