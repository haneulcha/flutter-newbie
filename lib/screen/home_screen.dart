import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 3), (timer) {
      print('Timer is running');

      int? nextPage = _pageController.page?.toInt();
      if (nextPage == 2) {
        nextPage = 0;
      } else {
        nextPage = nextPage! + 1;
      }
      _pageController.animateToPage(nextPage, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
        body: PageView(
      controller: _pageController,
      children: [1, 2, 3].map((number) => Image.asset('asset/img/dj_$number.jpeg', fit: BoxFit.cover)).toList(),
    ));
  }
}
