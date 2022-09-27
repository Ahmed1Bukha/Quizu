// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:betaquizu/CustomWidget/textCutom.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({
    Key? key,
    required this.text,
    required this.function,
    this.height = 50,
    this.width = 150,
    required this.buttonColor,
    this.backGroundColor = Colors.teal,
    this.fontSize = 20,
    this.Textcolor = Colors.white,
  }) : super(key: key);
  final String text;
  final Function() function;
  final double height;
  final double width;
  final Color buttonColor;
  final Color backGroundColor;
  final double fontSize;
  final Color Textcolor;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: widget.backGroundColor,
          foregroundColor: widget.buttonColor,
          minimumSize: Size(widget.width, widget.height),
          maximumSize: Size(widget.width, widget.height)),
      onPressed: widget.function,
      child: AutoSizeText(
        widget.text,
        style: textStyle(widget.fontSize, widget.Textcolor),
        minFontSize: 10,
        maxLines: 1,
      ),
    );
  }
}
