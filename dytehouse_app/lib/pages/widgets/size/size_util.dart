import 'package:flutter/material.dart';

// class SizeUtil {
//   final BuildContext context;
//   SizeUtil(this.context);

// }

const double _designHeight = 812;
const double _designWidth = 375;

const appbarHeight = 56.0;
const bottomNavbarHeight = 64.0;

const meetingRoomHeight = _designHeight - appbarHeight - bottomNavbarHeight;

extension SizeUtil on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double adjust(double value) {
    return (value * width * height) / (_designHeight * _designWidth);
  }
}
