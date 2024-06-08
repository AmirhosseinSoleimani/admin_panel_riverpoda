

import 'package:flutter/cupertino.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? locale = const Locale('en');
  bool canNotify = true;

  void changeLocale(Locale? newLocale) {
    locale = newLocale ?? const Locale('en');
    notifyListeners();

  }


}