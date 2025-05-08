import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animations/animations/page_animations/second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    scaleAnimation = Tween<double>(begin: 1, end: 10).animate(controller);

    controller.addListener(() {
      if (controller.isCompleted) {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return SecondPage();
            },
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              final tween = Tween(
                begin: Offset(0, -1),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInExpo),
              );
              return SlideTransition(position: tween, child: child);
            },
          ),
        );
        Timer(Duration(seconds: 1), () {
          controller.reset();
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GestureDetector(
          onTap: () {
            controller.forward();
          },
          child: ScaleTransition(
            scale: scaleAnimation,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey,
                    spreadRadius: 2,
                    blurRadius: 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
