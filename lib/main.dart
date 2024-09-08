import 'package:flutter_webview/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'Pretendard',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
          headlineLarge: TextStyle(color: Colors.pinkAccent, fontSize: 30, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(color: Colors.pink, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      home: const HomeScreen(),
    ),
  );
}
