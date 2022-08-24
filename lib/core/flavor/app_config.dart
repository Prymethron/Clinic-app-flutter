import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  const AppConfig(
      {Key? key, required this.appDisplayName, required Widget child})
      : super(key: key, child: child);

  final String appDisplayName;

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>()!;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
