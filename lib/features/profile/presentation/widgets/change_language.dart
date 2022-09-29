import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/resources/language_manager.dart';
import '../../../../injection_container.dart';
import '../../../../main.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key, required this.context});
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _changeLang(),
      icon: const Icon(Icons.language),
    );
  }

  Future<String> getAppLanguage() async {
    String? language = sl<SharedPreferences>().getString(prefsKeyLang);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default lang
      return LanguageType.english.value;
    }
  }

  Future<void> changeAppLanguage() async {
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.arabic.value) {
      // set english
      sl<SharedPreferences>()
          .setString(prefsKeyLang, LanguageType.english.value);
    } else {
      // set arabic
      sl<SharedPreferences>()
          .setString(prefsKeyLang, LanguageType.arabic.value);
    }
  }

  _changeLang() {
    changeAppLanguage();
    Phoenix.rebirth(context);
  }
}
