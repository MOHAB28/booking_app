import 'package:flutter/material.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/values_manager.dart';

class CustomTextFormField extends StatelessWidget {
  final String? titleText;
  final String? hintText;
  final String? errorText;
  final bool isObsecureText, isAllowTopTitleView;
  final EdgeInsetsGeometry padding;
  final Function(String)? onChanged;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final bool showIcon;

  const CustomTextFormField({
    super.key,
    this.titleText,
    this.hintText,
    this.errorText,
    this.isObsecureText = false,
    this.isAllowTopTitleView = true,
    required this.padding,
    this.onChanged,
    required this.keyboardType,
    this.controller,
    this.showIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isAllowTopTitleView && titleText != null)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16,
                vertical: AppPadding.p4,
              ),
              child: Text(
                titleText ?? '',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            shadowColor: Colors.black12.withOpacity(
              Theme.of(context).brightness == Brightness.dark ? 0.6 : 0.4,
            ),
            child: SizedBox(
              height: AppSize.s50,
              child: Center(
                child: TextField(
                  controller: controller,
                  maxLines: 1,
                  onChanged: onChanged,
                  style: Theme.of(context).textTheme.bodySmall,
                  obscureText: isObsecureText,
                  cursorColor: Theme.of(context).primaryColor,
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                      errorText: null,
                      hintText: hintText,
                      prefixIcon: showIcon
                          ? const Icon(
                              Icons.search,
                              color: ColorManager.bGreen,
                            )
                          : null,
                      hintStyle: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: Colors.grey)),
                ),
              ),
            ),
          ),
          if (errorText!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16,
                vertical: AppPadding.p4,
              ),
              child: Text(
                errorText ?? '',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Colors.red),
              ),
            ),
        ],
      ),
    );
  }
}
