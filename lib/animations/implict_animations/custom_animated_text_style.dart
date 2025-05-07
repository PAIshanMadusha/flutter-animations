import 'package:flutter/material.dart';
import 'package:flutter_animations/reusable_widgets.dart/custom_button.dart';

class CustomAnimatedTextStyle extends StatefulWidget {
  const CustomAnimatedTextStyle({super.key});

  @override
  State<CustomAnimatedTextStyle> createState() =>
      _CustomAnimatedTextStyleState();
}

class _CustomAnimatedTextStyleState extends State<CustomAnimatedTextStyle> {
  bool _isStyled = false;

  void _toggleTextStyle() {
    setState(() {
      _isStyled = !_isStyled;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double sizedBoxValue = 15;
    return Scaffold(
      appBar: AppBar(title: Text("Animated Text Style"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
              style:
                  _isStyled
                      ? TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.green,
                      )
                      : TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 25,
                        color: Colors.red,
                      ),
              duration: Duration(seconds: 1),
              curve: Curves.easeInBack,
              child: Text("Flutter Text Animations"),
            ),
            SizedBox(height: sizedBoxValue * 3),
            CustomButton(text: "Toggle Text Style", onTap: _toggleTextStyle),
          ],
        ),
      ),
    );
  }
}
