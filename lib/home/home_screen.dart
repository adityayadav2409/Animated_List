import 'package:flutter/material.dart';

class AnimatedListExample extends StatefulWidget {
  const AnimatedListExample({super.key});

  @override
  State<AnimatedListExample> createState() => _AnimatedListExampleState();
}

class _AnimatedListExampleState extends State<AnimatedListExample> {
  List<String> items = [];
  final listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(218, 114, 112, 112),
      appBar: AppBar(
        title: const Text(
          "Animated List",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 41, 40, 40),
        centerTitle: true,
      ),
      body: AnimatedList(
        key: listKey,
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) {
          return buildItem(items[index], animation, index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addItem,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 255, 251, 251),
        ),
      ),
    );
  }

  Widget buildItem(String item, Animation<double> animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: const Color.fromARGB(255, 255, 255, 255),
        child: ListTile(
          title: Text(item),
          trailing: IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () => removeItem(index),
          ),
        ),
      ),
    );
  }

  void addItem() {
    final index = items.length;
    items.add('Item ${index + 1}');
    listKey.currentState?.insertItem(index);
  }

  void removeItem(int index) {
    listKey.currentState?.removeItem(
      index,
      (context, animation) {
        animation.addStatusListener((status) {
          if (status == AnimationStatus.dismissed) {
            items.removeAt(index);
          }
        });
        return buildItem(items[index], animation, index);
      },
    );
  }
}
