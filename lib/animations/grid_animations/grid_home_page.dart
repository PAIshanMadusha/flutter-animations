import 'package:flutter/material.dart';
import 'package:flutter_animations/animations/grid_animations/grid_single_item_page.dart';

class GridHomePage extends StatelessWidget {
  GridHomePage({super.key});

  final List<String> items = List<String>.generate(20, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Grid Animation",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return GridSingleItemPage(
                        item: items[index],
                        index: index,
                      );
                    },
                    transitionsBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                      child,
                    ) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    transitionDuration: Duration(seconds: 1),
                  ),
                );
              },
              child: Hero(
                flightShuttleBuilder: _flightShutterBuilder,
                tag: "item_$index",
                child: Card(
                  child: GridTile(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightGreen,
                      ),
                      child: Center(
                        child: Text(
                          items[index],
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
          },
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
