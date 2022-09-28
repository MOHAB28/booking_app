import 'package:flutter/material.dart';

class CommonCard extends StatefulWidget {
  final double radius;
  final Widget? child;

  const CommonCard({Key? key, this.radius = 16, this.child})
      : super(key: key);
  @override
  _CommonCardState createState() => _CommonCardState();
}

class _CommonCardState extends State<CommonCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      //   shadowColor: Theme.of(context).dividerColor,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.radius),
      ),
      child: widget.child,
    );
  }
}