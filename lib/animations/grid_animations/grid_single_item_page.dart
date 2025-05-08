import 'package:flutter/material.dart';

class GridSingleItemPage extends StatelessWidget {
  final String item;
  final int index;
  const GridSingleItemPage({
    super.key,
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Grid Single Item",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Hero(
          tag: "item_$index",
          flightShuttleBuilder: _flightShutterBuilder,
          child: Card(
            elevation: 2,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  item,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _flightShutterBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        double rotation =
            flightDirection == HeroFlightDirection.push
                ? animation.value * 3.14
                : (1 - animation.value) * 3.14;

        return Transform(
          transform: Matrix4.identity()..rotateX(rotation),
          alignment: Alignment.center,
          child: toHeroContext.widget,
        );
      },
    );
  }
}
