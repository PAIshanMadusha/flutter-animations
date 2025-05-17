import 'package:flutter/material.dart';
import 'package:flutter_animations/reusable_widgets/custom_button.dart';

class CustomLoadingAnimation extends StatefulWidget {
  final double percentage;

  const CustomLoadingAnimation({super.key, required this.percentage});

  @override
  State<CustomLoadingAnimation> createState() => _CustomLoadingAnimationState();
}

class _CustomLoadingAnimationState extends State<CustomLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> percentageAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    percentageAnimation = Tween<double>(
      begin: 0.0,
      end: widget.percentage,
    ).animate(controller);
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
          "Loading Animation",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: CircularProgressIndicator(
                          value: percentageAnimation.value / 100,
                          strokeWidth: 14,
                          backgroundColor: Colors.blueGrey[100],
                          color: Colors.blueAccent,
                        ),
                      ),
                      Text(
                        "${(percentageAnimation.value).toInt()}%",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: sizedBoxValue * 3),
              CustomButton(
                text: "Start Animation",
                onTap: () {
                  controller.forward();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
