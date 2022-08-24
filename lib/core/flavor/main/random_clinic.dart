import 'package:clinic_app/core/flavor/app_config.dart';
import 'package:clinic_app/main.dart';
import 'package:flutter/cupertino.dart';

void main() async {
  var configuredApp = const AppConfig(
    appDisplayName: 'Random Clinic',
    child: MyApp(),
  );

  runApp(configuredApp);
}
