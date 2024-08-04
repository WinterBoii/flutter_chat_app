import 'package:flutter/material.dart';
import 'package:flutter_chat_app/themes/light_mode.dart';

import 'dark_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  /// The `bool get isDarkMode => _themeData == darkMode;` is a getter method in the `ThemeProvider`
  /// class that returns a boolean value indicating whether the current theme is the dark mode theme
  /// (`darkMode`). It compares the `_themeData` property with the `darkMode` theme and returns `true`
  /// if they are equal, indicating that the current theme is the dark mode theme.
  bool get isDarkMode => _themeData == darkMode;

  /// The `set` keyword in Dart is used to define a setter method for a property. In the provided code
  /// snippet, `set updateTheme(ThemeData theme)` is defining a setter method named `updateTheme` for
  /// the `_themeData` property in the `ThemeProvider` class.
  set updateTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  void toggleTheme() {
    _themeData = _themeData == lightMode ? darkMode : lightMode;
    notifyListeners();
  }
}
