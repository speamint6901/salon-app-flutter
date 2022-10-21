// flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themesProvider = ChangeNotifierProvider(((ref) => ThemesModel()));

class ThemesModel extends ChangeNotifier {
  late SharedPreferences preferences;
  bool isDarkTheme = false;

  ThemesModel() {
    init();
  }
  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
    final x = preferences.getBool('isDarkTheme');
    if (x != null) isDarkTheme = x;
    notifyListeners();
  }

  Future<void> setIsDarkTheme({required bool value}) async {
    isDarkTheme = value;
    await preferences.setBool("isDarkTheme", value);
    notifyListeners();
  }
}
