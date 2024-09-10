import 'package:flutter/material.dart';
import 'package:flutter_webview/const/colors.dart';
import 'package:flutter_webview/screen/root_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        sliderTheme: SliderThemeData(
          thumbColor: primaryColor,
          activeTrackColor: primaryColor,
          inactiveTrackColor: primaryColor.withOpacity(0.5),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey,
          backgroundColor: backgroundColor,
        ),
        fontFamily: 'Pretendard',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
          headlineLarge: TextStyle(color: Colors.pinkAccent, fontSize: 30, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(color: Colors.pink, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      home: const RootScreen(),
    ),
  );
}
