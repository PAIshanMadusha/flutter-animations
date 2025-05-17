import 'package:flutter/material.dart';
import 'package:flutter_animations/reusable_widgets/custom_button.dart';

class CustomSlideAnimation extends StatefulWidget {
  const CustomSlideAnimation({super.key});

  @override
  State<CustomSlideAnimation> createState() => _CustomSlideAnimationState();
}

class _CustomSlideAnimationState extends State<CustomSlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    slideAnimation = Tween<Offset>(
      begin: Offset(1, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
  }

  void togglePanel() {
    if (controller.isDismissed) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double sizedBoxValue = 15;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Slide Animation",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: slideAnimation,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueAccent,
                ),
              ),
            ),
            SizedBox(height: sizedBoxValue * 3),
            CustomButton(text: "Toggle Slide", onTap: togglePanel),
          ],
        ),
      ),
    );
  }
}
