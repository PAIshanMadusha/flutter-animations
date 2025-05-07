import 'package:flutter/material.dart';
import 'package:flutter_animations/reusable_widgets.dart/custom_button.dart';

class CustomAnimatedSwitcher extends StatefulWidget {
  const CustomAnimatedSwitcher({super.key});

  @override
  State<CustomAnimatedSwitcher> createState() => _CustomAnimatedSwitcherState();
}

class _CustomAnimatedSwitcherState extends State<CustomAnimatedSwitcher> {
  bool _showChild = true;

  void _toggleChild() {
    setState(() {
      _showChild = !_showChild;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double sizedBoxValue = 15;
    return Scaffold(
      appBar: AppBar(title: Text("Animated Switcher"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child:
                  _showChild
                      ? Container(
                        key: ValueKey(1),
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      )
                      : Container(
                        key: ValueKey(2),
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
            ),
            SizedBox(height: sizedBoxValue * 3),
            CustomButton(text: "Toggle Child", onTap: _toggleChild),
          ],
        ),
      ),
    );
  }
}
