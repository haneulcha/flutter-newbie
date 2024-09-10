import "package:flutter/material.dart";

class HomeScreen extends StatelessWidget {
  final int number;
  const HomeScreen({required this.number, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 24),
        Text(
          'Home Screen',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 24),
        Text(
          'Number: $number',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
