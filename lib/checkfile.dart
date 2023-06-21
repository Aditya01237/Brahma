import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hover Container Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hover Container Example'),
        ),
        body: Center(
          child: HoverContainer(),
        ),
      ),
    );
  }
}

class HoverContainer extends StatefulWidget {
  @override
  _HoverContainerState createState() => _HoverContainerState();
}

class _HoverContainerState extends State<HoverContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click, // Optional: Change cursor style
      child: GestureDetector(
        onTap: () {
          // Handle onTap event
        },
        child: Container(
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              color: _isHovered
                  ? Colors.red
                  : Colors.black, // Border color when hovered or not hovered
              width: 1.0, // Border width
            ),
            color: _isHovered
                ? Colors.yellow
                : Colors.white, // Background color when hovered or not hovered
          ),
          child: const Center(
            child: Text(
              'Hover me',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
