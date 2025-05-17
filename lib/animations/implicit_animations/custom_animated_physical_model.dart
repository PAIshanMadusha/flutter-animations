import 'package:flutter/material.dart';
import 'package:flutter_animations/reusable_widgets/custom_button.dart';

class CustomAnimatedPhysicalModel extends StatefulWidget {
  const CustomAnimatedPhysicalModel({super.key});

  @override
  State<CustomAnimatedPhysicalModel> createState() =>
      _CustomAnimatedPhysicalModelState();
}

class _CustomAnimatedPhysicalModelState
    extends State<CustomAnimatedPhysicalModel> {
  bool _isFlat = true;
  void _toggleElavation() {
    setState(() {
      _isFlat = !_isFlat;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double sizedBoxValue = 15;
    return Scaffold(
      appBar: AppBar(title: Text("Animated Physical Model"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedPhysicalModel(
              color: Colors.blueGrey,
              shadowColor: Colors.white,
              duration: Duration(seconds: 1),
              elevation: _isFlat ? 0 : 20,
              borderRadius: BorderRadius.circular(_isFlat ? 10 : 25),
              child: SizedBox(
                height: 250,
                width: 250,
              ),
            ),
            SizedBox(height: sizedBoxValue * 3),
            CustomButton(text: "Toggle Elavation", onTap: _toggleElavation),
          ],
        ),
      ),
    );
  }
}
