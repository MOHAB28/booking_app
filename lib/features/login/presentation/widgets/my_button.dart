import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final double width;
  final Color background;
  final double radius;
  final VoidCallback onPressed;
  final String text;

  const MyButton({
    this.width = double.infinity,
    this.background = const Color(0xfff48fb1),
    this.radius = 10.0,
    required this.onPressed,
    required this.text,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: TextButton(
        onPressed: ()
        {
          onPressed();
        },
        child: Text(
          text,
          style:  TextStyle(
            color: Colors.white70.withOpacity(.8),
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}