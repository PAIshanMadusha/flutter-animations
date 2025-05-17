import 'package:flutter/material.dart';
import 'package:flutter_animations/reusable_widgets/custom_button.dart';

class CustomAnimatedOpacity extends StatefulWidget {
  const CustomAnimatedOpacity({super.key});

  @override
  State<CustomAnimatedOpacity> createState() => _CustomAnimatedOpacityState();
}

class _CustomAnimatedOpacityState extends State<CustomAnimatedOpacity> {
  double _opacity = 1.0;

  void _toggleOpacity() {
    setState(() {
      _opacity = _opacity == 1.0 ? 0.0 : 1.0;
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
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 1),
              curve: Curves.bounceInOut,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: FlutterLogo(size: 90)),
              ),
            ),
            SizedBox(height: sizedBoxValue * 2),
            CustomButton(text: "Toggle Opacity", onTap: _toggleOpacity),
          ],
        ),
      ),
    );
  }
}
