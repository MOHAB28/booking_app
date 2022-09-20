import 'package:flutter/material.dart';

enum LanguageType {
  english('en'),
  arabic('ar');

  const LanguageType(this.value);
  final String value;
}


const String assetPathLocalisations = 'assets/translations';

const Locale arabicLocal = Locale('ar', 'SA');
const Locale englishLocal = Locale('en', 'US');

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.english:
        return value;
      case LanguageType.arabic:
        return value;
    }
  }
}