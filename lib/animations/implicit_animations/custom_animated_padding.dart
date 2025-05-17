import 'package:flutter/material.dart';
import 'package:flutter_animations/reusable_widgets/custom_button.dart';

class CustomAnimatedPadding extends StatefulWidget {
  const CustomAnimatedPadding({super.key});

  @override
  State<CustomAnimatedPadding> createState() => _CustomAnimatedPaddingState();
}

class _CustomAnimatedPaddingState extends State<CustomAnimatedPadding> {
  double _padding = 10.0;

  void _togglePadding() {
    setState(() {
      _padding = _padding == 10.0 ? 60.0 : 10.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double sizedBoxValue = 15;
    return Scaffold(
      appBar: AppBar(title: Text("Animated Opacity"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.blue, width: 2),
              ),
              child: AnimatedPadding(
                padding: EdgeInsets.all(_padding),
                duration: Duration(seconds: 1),
                curve: Curves.easeInOutBack,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: sizedBoxValue * 2),
            CustomButton(text: "Toggle Padding", onTap: _togglePadding),
          ],
        ),
      ),
    );
  }
}
