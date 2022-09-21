import 'package:flutter/material.dart';
import 'package:phase3/core/resources/strings_manager.dart';

class MyTextButton extends StatelessWidget {
  final Color background;
  final double width;
  final double radius;
  final VoidCallback onPressed;
  final String text;
  final IconData iconData;

  const MyTextButton({
    Key? key,
    this.background = Colors.blue,
    this.width = double.infinity,
    this.radius = 10.0,
    required this.onPressed,
    required this.text,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: TextButton(
          onPressed: (){},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
               Icon(
                iconData,
                color: Colors.white,
              ),
              const SizedBox(width: 10.0,),
              Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0
                ),
              ),
            ],
          )
      ),
    );
  }
}
