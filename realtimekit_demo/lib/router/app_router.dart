import 'package:flutter/material.dart';

class AppRouter {
  static AppRouter of(BuildContext context) => AppRouter(context);
  final BuildContext context;
  AppRouter(this.context);
  void push(Widget page) => Navigator.push(context, MaterialPageRoute(builder: (context) => page));

  void pop() => Navigator.pop(context);
}

