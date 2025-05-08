import 'package:flutter/material.dart';
import 'package:flutter_animations/animations/explicit_animations/custom_rotation_animation.dart';
import 'package:flutter_animations/animations/explicit_animations/custom_slide_animation.dart';
import 'package:flutter_animations/animations/explicit_animations/details_page_animation.dart';
import 'package:flutter_animations/animations/implicit_animations/custom_animated_physical_model.dart';
import 'package:flutter_animations/animations/implicit_animations/custom_animated_positioned.dart';
import 'package:flutter_animations/animations/implicit_animations/custom_animated_switcher.dart';
import 'package:flutter_animations/animations/implicit_animations/custom_animated_text_style.dart';
import 'package:flutter_animations/animations/implicit_animations/custom_animated_theme.dart';
import 'package:flutter_animations/animations/implicit_animations/custom_animated_tween.dart';
import 'package:flutter_animations/reusable_widgets.dart/custom_button.dart';
import 'package:flutter_animations/animations/implicit_animations/custom_animated_box.dart';
import 'package:flutter_animations/animations/implicit_animations/custom_animated_button.dart';
import 'package:flutter_animations/animations/implicit_animations/custom_animated_container.dart';
import 'package:flutter_animations/animations/implicit_animations/custom_animated_list.dart';
import 'package:flutter_animations/animations/implicit_animations/custom_animated_opacity.dart';
import 'package:flutter_animations/animations/implicit_animations/custom_animated_padding.dart';

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
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Center(
                  child: Text(
                    "Implicit Animations",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              SizedBox(height: sizedBoxValue),
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
              SizedBox(height: sizedBoxValue),
              CustomButton(
                text: "Animated List",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomAnimatedList(),
                    ),
                  );
                },
              ),
              SizedBox(height: sizedBoxValue),
              CustomButton(
                text: "Animated Physical Model",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomAnimatedPhysicalModel(),
                    ),
                  );
                },
              ),
              SizedBox(height: sizedBoxValue),
              CustomButton(
                text: "Animated Positioned",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomAnimatedPositioned(),
                    ),
                  );
                },
              ),
              SizedBox(height: sizedBoxValue),
              CustomButton(
                text: "Animated Switcher",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomAnimatedSwitcher(),
                    ),
                  );
                },
              ),
              SizedBox(height: sizedBoxValue),
              CustomButton(
                text: "Animated Text Style",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomAnimatedTextStyle(),
                    ),
                  );
                },
              ),
              SizedBox(height: sizedBoxValue),
              CustomButton(
                text: "Animated Theme",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomAnimatedTheme(),
                    ),
                  );
                },
              ),
              SizedBox(height: sizedBoxValue),
              CustomButton(
                text: "Animated Tween",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomAnimatedTween(),
                    ),
                  );
                },
              ),
              SizedBox(height: sizedBoxValue),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Center(
                  child: Text(
                    "Explicit Animations",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              SizedBox(height: sizedBoxValue),
              CustomButton(
                text: "Explicit Animation",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPageAnimation(),
                    ),
                  );
                },
              ),
              SizedBox(height: sizedBoxValue),
              CustomButton(
                text: "Slide Animation",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomSlideAnimation(),
                    ),
                  );
                },
              ),
              SizedBox(height: sizedBoxValue),
              CustomButton(
                text: "Rotation Animation",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomRotationAnimation(),
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
