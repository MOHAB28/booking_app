import 'package:flutter/material.dart';

class PagePopup extends StatelessWidget {
  final double opValue;
  final String assetImage;

  const PagePopup({
    Key? key,
    required this.opValue,
    required this.assetImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * 1.3,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            assetImage,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
