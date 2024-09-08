import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDate = DateTime.now();

  void onHeartPressed() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 200,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              dateOrder: DatePickerDateOrder.ymd,
              initialDateTime: firstDate,
              onDateTimeChanged: (DateTime newDate) {
                setState(() {
                  firstDate = newDate;
                });
              },
            ),
          ),
        );
      },
      barrierDismissible: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDay(
              onPressed: onHeartPressed,
              firstDate: firstDate,
            ),
            _CoupleImage(),
          ],
        ),
      ),
    );
  }
}

class _DDay extends StatelessWidget {
  final GestureTapCallback onPressed;
  final DateTime firstDate;

  _DDay({required this.onPressed, required this.firstDate});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final now = DateTime.now(); // 왜 어떤 건 build 밖에 있고 어떤 건 안에 있을까요?

    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          '${firstDate.year}년 ${firstDate.month}월 ${firstDate.day}일',
          style: textTheme.headlineLarge,
        ),
        const SizedBox(height: 20),
        Text(
          '100일 기념일까지 남은 시간',
          style: textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        IconButton(
          icon: Icon(Icons.favorite, color: Colors.pink[300], size: 50),
          onPressed: onPressed,
        ),
        const SizedBox(height: 20),
        Text(
          'D+${now.difference(firstDate).inDays + 1}',
          style: textTheme.headlineMedium,
        ),
      ],
    );
  }
}

class _CoupleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Image.asset(
          'asset/img/animal_hamster.png',
          height: MediaQuery.of(context).size.height * 0.5,
        ),
      ),
    );
  }
}
