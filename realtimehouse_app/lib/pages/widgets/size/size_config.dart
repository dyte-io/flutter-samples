import 'package:flutter/material.dart';

class SizeConfig {
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _blockWidth;
  static late double _blockHeight;

  static late double height;
  static late double width;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;
    if (orientation == Orientation.portrait) {
      _screenWidth = size.width;
      _screenHeight = size.height;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = size.width;
      _screenHeight = size.height;
      isPortrait = false;
      isMobilePortrait = false;
    }
    // horizontal
    _blockWidth = _screenWidth / 100;
    // vertical
    _blockHeight = _screenHeight / 100;

    height = _blockHeight;
    width = _blockWidth;
  }
}
