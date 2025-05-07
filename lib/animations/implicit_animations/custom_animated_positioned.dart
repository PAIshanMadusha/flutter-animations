import 'package:flutter/material.dart';

class CustomAnimatedPositioned extends StatefulWidget {
  const CustomAnimatedPositioned({super.key});

  @override
  State<CustomAnimatedPositioned> createState() =>
      _CustomAnimatedPositionedState();
}

class _CustomAnimatedPositionedState extends State<CustomAnimatedPositioned> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Position"), centerTitle: true),
      body: Center(
        child: SizedBox(
          width: 320,
          height: 420,
          child: Stack(
            children: [
              AnimatedPositioned(
                width: _isSelected ? 300 : 100,
                height: _isSelected ? 90 : 200,
                top: _isSelected ? 50 : 150,
                duration: Duration(seconds: 1),
                curve: Curves.easeInBack,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSelected = !_isSelected;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueAccent,
                    ),
                    child: Center(
                      child: Text(
                        "Tap Me",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
