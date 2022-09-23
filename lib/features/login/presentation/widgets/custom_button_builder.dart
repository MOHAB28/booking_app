import 'package:flutter/material.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/values_manager.dart';

class CustomButtonBuilder extends StatelessWidget {
  const CustomButtonBuilder({
    Key? key,
    required this.title,
    required this.onTap,
    this.width = double.infinity,
    this.height = AppSize.s50,
    this.radius = AppSize.s50,
    this.color = ColorManager.bGreen,
    this.shadowColor = Colors.black54,
    this.textColor = Colors.white,
    this.shadowBlurRadius = AppSize.s10,
    this.shadowSpreadRadius = AppSize.s0,
    this.shadowOffset = const Offset(AppSize.s3, AppSize.s8),
  }) : super(key: key);
  final double width;
  final double height;
  final double radius;
  final Color color;
  final Color textColor;
  final Color shadowColor;
  final double shadowSpreadRadius;
  final double shadowBlurRadius;
  final Offset shadowOffset;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                spreadRadius: shadowSpreadRadius,
                blurRadius: shadowBlurRadius,
                offset: shadowOffset,
              )
            ]),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
