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
  bool _isHovered = false;

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
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedContainer(
            width: _isHovered ? 220 : 200,
            height: _isHovered ? 220 : 200,
            margin: EdgeInsets.all(margin),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInCubic,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _isHovered
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "https://images.unsplash.com/photo-1716383425862-cdf9b2d5949a?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "https://images.unsplash.com/photo-1716383425870-af3dc8f49ea2?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                _isHovered
                    ? Text(
                        "Mantap Cuy",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    : Text(
                        "Lieur",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
              ],
            ),
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
