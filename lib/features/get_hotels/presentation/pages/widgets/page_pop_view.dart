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
        Positioned(
            bottom: 80,
            left: 24,
            right: 24,
            child: Opacity(
              opacity: opValue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    child: Text(
                      'New Hotels',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    child: Text(
                      'Enjoy Your Life',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
