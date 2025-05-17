import 'package:flutter/material.dart';
import 'package:flutter_animations/reusable_widgets/custom_button.dart';

class CustomAnimatedList extends StatefulWidget {
  const CustomAnimatedList({super.key});

  @override
  State<CustomAnimatedList> createState() => _CustomAnimatedListState();
}

class _CustomAnimatedListState extends State<CustomAnimatedList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<String> _items = [];
  int _counter = 0;

  //Add Item
  void _addItems() {
    _items.insert(0, "Item: ${_counter++}");
    _listKey.currentState!.insertItem(0, duration: Duration(seconds: 1));
  }

  //Remove Item
  void _removeItem(int index) {
    final removedItem = _items[index];
    _items.removeAt(index);
    _counter--;
    _listKey.currentState!.removeItem(
      index,
      (context, animation) => _buildItem(removedItem, animation, index),
    );
  }

  //Transition
  Widget _buildItem(String item, Animation<double> animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          title: Text(
            item,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              final currentIndex = _items.indexOf(item);
              if (currentIndex != -1) {
                _removeItem(currentIndex);
              }
            },
            icon: Icon(Icons.delete, size: 30, color: Colors.redAccent),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double sizedBoxValue = 15;
    return Scaffold(
      appBar: AppBar(title: Text("Animated List"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(text: "Add a Item", onTap: _addItems),
            SizedBox(height: sizedBoxValue * 2),
            Expanded(
              child: AnimatedList(
                key: _listKey,
                itemBuilder: (context, index, animation) {
                  return _buildItem(_items[index], animation, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
