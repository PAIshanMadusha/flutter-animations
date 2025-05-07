import 'package:flutter/material.dart';

class CustomAnimatedTween extends StatefulWidget {
  const CustomAnimatedTween({super.key});

  @override
  State<CustomAnimatedTween> createState() => _CustomAnimatedTweenState();
}

class _CustomAnimatedTweenState extends State<CustomAnimatedTween> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Tween"), centerTitle: true),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 300),
          duration: Duration(seconds: 2),
          builder: (BuildContext context, double value, Widget? child) {
            return Container(
              width: value,
              height: value,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.greenAccent,
              ),
            );
          },
        ),
      ),
    );
  }
}
