import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.text,
    required this.function,
    this.height = 50,
    this.width = 150,
    required this.color,
    this.backGroundColor = Colors.teal,
  });
  final String text;
  final Function() function;
  final double height;
  final double width;
  final Color color;
  final Color backGroundColor;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: widget.backGroundColor,
          foregroundColor: widget.color,
          minimumSize: Size(widget.width, widget.height)),
      onPressed: widget.function,
      child: Text(
        widget.text,
        style: TextStyle(),
      ),
    );
  }
}
