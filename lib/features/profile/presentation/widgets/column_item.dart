import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';

class ColumnItem extends StatelessWidget {
  const ColumnItem({
    Key? key,
    required this.itemText,
    required this.itemWidget,
  }) : super(key: key);
  final String itemText;
  final Widget itemWidget;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              itemText,
              style: getRegularStyle(
                color: ColorManager.bBlack,
                fontSize: FontSize.s16,
              ),
            ),
            itemWidget,
          ],
        ),
        const Divider(
          thickness: AppSize.s1,
        ),
      ],
    );
  }
}
