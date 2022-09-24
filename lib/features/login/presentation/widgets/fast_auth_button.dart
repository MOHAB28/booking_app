import 'package:flutter/material.dart';

import '../../../../core/resources/values_manager.dart';


class FastAuthButton extends StatelessWidget {
  const FastAuthButton({
    Key? key,
    required this.title,
    required this.image,
    required this.color,
  }) : super(key: key);
  final String title;
  final String image;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s50,
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p10,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppSize.s50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              height: AppSize.s25,
              width: AppSize.s25,
              image: AssetImage(image),
            ),
            const SizedBox(width: AppSize.s5),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
