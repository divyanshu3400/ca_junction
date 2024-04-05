import 'package:flutter/material.dart';

enum CustomThememode { light, dark }

class ThemeProvider with ChangeNotifier {
  CustomThememode _themeMode = CustomThememode.light;

  // int _index = 0;
  int getColorIndex() {
    if (_themeMode == CustomThememode.light) {
      return 0;
    } else {
      return 1;
    }
  }

  void init() {}

  List<Color> _primaryColor = [Colors.blue, Colors.green];
  List<Color> _secondaryColor = [Colors.black, Colors.white];
  List<Color> _titletextcolor = [Color.fromRGBO(38, 38, 38, 1), Color.fromRGBO(255, 255, 255, 1)];//1
  List<Color> _purpletextcolor = [Color.fromRGBO(16, 13, 64, 1), Color.fromRGBO(255, 255, 255, 1)];//1
  List<Color> _typecolor = [Colors.green.shade400, Colors.green];
  List<Color> _childcolor = [Colors.blue, Colors.white];
  List<Color> _titlecolor = [Colors.blue, Colors.white];
  List<Color> _iconcolor = [Colors.black, Colors.black];
  List<Color> _backgroundcolor = [Color(0xFFF5F5F5), Colors.black];

  Color get getPrimaryColor => _primaryColor[getColorIndex()];
  Color get getSecondaryColor => _secondaryColor[getColorIndex()];
  Color get getTitleTextColor => _titletextcolor[getColorIndex()];
  Color get getPurpleTextColor => _purpletextcolor[getColorIndex()];
  Color get getTypeColor => _typecolor[getColorIndex()];
  Color get getchildcolor => _childcolor[getColorIndex()];
  Color get gettitlecolor => _titlecolor[getColorIndex()];
  Color get geticoncolor => _iconcolor[getColorIndex()];
  Color get getbackgroundcolor => _backgroundcolor[getColorIndex()];
}
