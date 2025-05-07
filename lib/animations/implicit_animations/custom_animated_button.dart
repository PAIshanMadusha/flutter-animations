import 'package:flutter/material.dart';

class CustomAnimatedButton extends StatefulWidget {
  const CustomAnimatedButton({super.key});

  @override
  State<CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton> {
  bool _isPurchased = false;
  void _togglePurchased() {
    setState(() {
      _isPurchased = !_isPurchased;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Animated Button",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Center(
          child: GestureDetector(
            onTap: _togglePurchased,
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: _isPurchased ? Colors.green : Colors.blue,
                borderRadius: BorderRadius.circular(_isPurchased ? 20 : 10),
              ),
              alignment: Alignment.center,
              child:
                  _isPurchased
                      ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Thanks",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          Icon(Icons.check, size: 35, color: Colors.white),
                        ],
                      )
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Purchase",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          Icon(
                            Icons.monetization_on,
                            size: 35,
                            color: Colors.white,
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
