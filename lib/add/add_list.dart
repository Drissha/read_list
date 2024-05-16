import 'dart:math';
import 'package:flutter/material.dart';

class AddListView extends StatefulWidget {
  const AddListView({super.key});

  @override
  State<AddListView> createState() => _AddListViewState();
}

class _AddListViewState extends State<AddListView> {
  late double borderRadius;
  late double margin;
  late Color color;
  // late Offset _position;
  double postY = 0.0;
  double postX = 0.0;

  @override
  void initState() {
    super.initState();
    borderRadius = Random().nextDouble();
    margin = Random().nextDouble();
    color = _generateRandomColor();
    // _position = Offset(100, 100);
  }

  Color _generateRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255, // Opacity
      random.nextInt(256), // Red
      random.nextInt(256), // Green
      random.nextInt(256), // Blue
    );
  }

  // void _updatePosition(DragUpdateDetails details) {
  //   setState(() {
  //     _position += details.delta;
  //   });
  // }

  handleChange() {
    setState(() {
      borderRadius = Random().nextDouble() * 50;
      margin = Random().nextDouble() * 20;
      color = _generateRandomColor();
    });
  }

  _generatedConstraints() {
    return Positioned(
      left: postX,
      top: postY,
      // left: _position.dx,
      // top: _position.dy,
      child: GestureDetector(
        onPanUpdate:
            // _updatePosition
            (details) {
          setState(() {
            postY += details.delta.dy;

            postX += details.delta.dx;
          });
        },
        onTap: () {
          handleChange();
        },
        child: AnimatedContainer(
          width: 200,
          height: 200,
          margin: EdgeInsets.all(margin),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          duration: Duration(milliseconds: 2000),
          curve: Curves.bounceOut,
          child: Column(
            children: [
              // Center(child: Text('waduh', style: TextStyle(color: Colors.white))),
              // ElevatedButton(onPressed: () => handleChange(), child: Text('ubah'))
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
        children: [
          _generatedConstraints(),
        ],
      )),
    );
  }
}
