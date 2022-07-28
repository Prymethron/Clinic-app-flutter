import 'package:clinic_app/home/home_view.dart';
import 'package:clinic_app/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clinic App',
      theme: ThemeData(
        textTheme: const TextTheme(
            headline5: TextStyle(color: ProjectColors.textColor1),
            headline6: TextStyle(color: ProjectColors.textColor2)),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            unselectedItemColor: ProjectColors.color2,
            selectedItemColor: ProjectColors.color1),
        appBarTheme: const AppBarTheme(
            color: Colors.transparent, centerTitle: true, elevation: 0),
        primarySwatch: Colors.grey,
      ),
      home: const HomeView(),
    );
  }
}
