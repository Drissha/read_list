import 'package:flutter/material.dart';

class AddListView extends StatelessWidget {
  const AddListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (BuildContext context, constraints) {
        if (constraints.maxWidth < 600) {
          return ListView(
            children: _generatedConstraints(),
          );
        } else if (constraints.maxWidth < 900) {
          return GridView.count(
            crossAxisCount: 2,
            children: _generatedConstraints(),
          );
        } else {
          return GridView.count(
            crossAxisCount: 6,
            children: _generatedConstraints(),
          );
        }
      }),
    );
  }
}

List<Widget> _generatedConstraints() {
  return List<Widget>.generate(10, (index) {
    return Container(
      margin: EdgeInsets.all(20),
      color: Colors.blueAccent,
      child: Text('waduh'),
    );
  });
}
