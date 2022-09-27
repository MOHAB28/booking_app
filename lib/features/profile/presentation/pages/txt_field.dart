import 'package:flutter/material.dart';

import '../../../../core/resources/strings_manager.dart';

class EditTxtField extends StatelessWidget {
  const EditTxtField({
    Key? key,
    required this.initialValue,
    required this.hintTxt,
    required this.saveFunction,
  }) : super(key: key);

  final String initialValue, hintTxt;
  final Function() saveFunction;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      textAlign: TextAlign.right,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppStrings.validatorMessage;
        }
        return null;
      },
      initialValue: initialValue,
      decoration: InputDecoration(
        prefixText: hintTxt,
      ),
      onSaved: saveFunction(),
    );
  }
}
