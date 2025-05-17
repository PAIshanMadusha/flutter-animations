import 'package:flutter/material.dart';
import 'package:flutter_animations/reusable_widgets/custom_button.dart';

class CustomAnimatedTheme extends StatefulWidget {
  const CustomAnimatedTheme({super.key});

  @override
  State<CustomAnimatedTheme> createState() => _CustomAnimatedThemeState();
}

class _CustomAnimatedThemeState extends State<CustomAnimatedTheme> {
  bool _isDarkTheme = false;

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Theme"), centerTitle: true),
      body: AnimatedTheme(
        data: _isDarkTheme ? ThemeData.dark() : ThemeData.light(),
        curve: Curves.easeInOut,
        child: Builder(
          builder:
              (context) => Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Center(
                    child: CustomButton(
                      text: "Toggle Theme",
                      onTap: _toggleTheme,
                    ),
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
