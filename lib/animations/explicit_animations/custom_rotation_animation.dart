import 'package:flutter/material.dart';

class CustomRotationAnimation extends StatefulWidget {
  const CustomRotationAnimation({super.key});

  @override
  State<CustomRotationAnimation> createState() =>
      _CustomRotationAnimationState();
}

class _CustomRotationAnimationState extends State<CustomRotationAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late Animation<Color?> colorAnimation;
  late Animation<double> rotationAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    scaleAnimation = Tween<double>(
      begin: 100,
      end: 300,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInBack));

    colorAnimation = ColorTween(
      begin: Colors.amber,
      end: Colors.green,
    ).animate(controller);

    rotationAnimation = Tween<double>(
      begin: 0,
      end: 4 * 3.14159,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInBack));

    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Rotation Animation",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: rotationAnimation.value,
              child: Container(
                width: scaleAnimation.value,
                height: scaleAnimation.value,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: colorAnimation.value,
                ),
                child: Center(child: FlutterLogo(size: 40)),
              ),
            );
          },
        ),
      ),
    );
  }
}
