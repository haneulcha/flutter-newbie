import 'package:flutter/material.dart';
import 'package:flutter_webview/screen/home_screen.dart';
import 'package:flutter_webview/screen/settings_screen.dart';

import 'dart:math';
import 'package:shake/shake.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  TabController? _tabController;
  double _threshold = 27;
  int number = 1;
  ShakeDetector? shakeDetector;

  tabListener() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
    _tabController!.addListener(tabListener);

    shakeDetector = ShakeDetector.autoStart(
      shakeSlopTimeMS: 100,
      shakeThresholdGravity: _threshold,
      onPhoneShake: () {
        final rand = new Random();
        print('Shake event detected');
        setState(() {
          number = rand.nextInt(5) + 1;
        });
      },
    );
  }

  @override
  dispose() {
    _tabController!.removeListener(tabListener);
    _tabController!.dispose();
    shakeDetector!.stopListening();
    super.dispose();
  }

  void onThresholdChanged(double value) {
    setState(() {
      _threshold = value;
    });
  }

  BottomNavigationBar renderBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _tabController!.index,
      onTap: (int index) {
        setState(() {
          print(index);
          _tabController!.animateTo(index);
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.edgesensor_high_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
      ],
    );
  }

  List<Widget> renderChildren() {
    return [const HomeScreen(number: 1), SettingsScreen(threshold: _threshold, onThresholdChanged: onThresholdChanged)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: renderChildren(),
      ),
      bottomNavigationBar: renderBottomNavigationBar(),
    );
  }
}
