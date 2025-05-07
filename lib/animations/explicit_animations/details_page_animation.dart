import 'package:flutter/material.dart';

class DetailsPageAnimation extends StatefulWidget {
  const DetailsPageAnimation({super.key});

  @override
  State<DetailsPageAnimation> createState() => _DetailsPageAnimationState();
}

class _DetailsPageAnimationState extends State<DetailsPageAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> logoFadeAnimation;
  late Animation<double> scaleAnimation;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    logoFadeAnimation = Tween<double>(begin: 0, end: 1).animate(controller);
    scaleAnimation = Tween<double>(begin: 0, end: 1).animate(controller);
    slideAnimation = Tween<Offset>(
      begin: Offset(0, 2),
      end: Offset.zero,
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
    final double sizedBoxValue = 15;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Animated Container",
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
              FadeTransition(
                opacity: logoFadeAnimation,
                child: FlutterLogo(size: 150),
              ),
              SizedBox(height: sizedBoxValue * 3),
              SlideTransition(
                position: slideAnimation,
                child: ScaleTransition(
                  scale: scaleAnimation,
                  child: Text(
                    "Flutter Animations With PAIshanMadusha",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
