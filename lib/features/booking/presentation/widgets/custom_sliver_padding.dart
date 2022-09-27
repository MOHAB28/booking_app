import 'package:flutter/material.dart';

import '../../../../core/resources/values_manager.dart';

class CustomSliverPadding extends StatelessWidget {
  const CustomSliverPadding({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p10,
        horizontal: AppPadding.p20,
      ),
      sliver: SliverToBoxAdapter(
        child: child,
      ),
    );
  }
}
