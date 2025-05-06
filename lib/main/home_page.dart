import 'package:flutter/material.dart';
import 'package:flutter_animations/animations/implict_animations/custom_animated_box.dart';
import 'package:flutter_animations/animations/implict_animations/custom_animated_button.dart';
import 'package:flutter_animations/animations/implict_animations/custom_animated_container.dart';
import 'package:flutter_animations/animations/implict_animations/custom_animated_opacity.dart';
import 'package:flutter_animations/animations/implict_animations/custom_animated_padding.dart';
import 'package:flutter_animations/reusable_widgets.dart/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double sizedBoxValue = 15;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.animation, size: 38),
        title: Text(
          "Flutter Animations",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              CustomButton(
                text: "Animated Container",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomAnimatedContainer(),
                    ),
                  );
                },
              ),
              SizedBox(height: sizedBoxValue),
              CustomButton(
                text: "Animated Box",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomAnimatedBox(),
                    ),
                  );
                },
              ),
              SizedBox(height: sizedBoxValue),
              CustomButton(
                text: "Animated Button",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomAnimatedButton(),
                    ),
                  );
                },
              ),
              SizedBox(height: sizedBoxValue),
              CustomButton(
                text: "Animated Opacity",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomAnimatedOpacity(),
                    ),
                  );
                },
              ),
              SizedBox(height: sizedBoxValue),
              CustomButton(
                text: "Animated Padding",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomAnimatedPadding(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
