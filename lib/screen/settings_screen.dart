import 'package:flutter/material.dart';
import 'package:flutter_webview/const/colors.dart';

class SettingsScreen extends StatelessWidget {
  final double threshold;
  final ValueChanged<double> onThresholdChanged;

  const SettingsScreen({
    super.key,
    required this.threshold,
    required this.onThresholdChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Text(
                  'Threshold',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            )),
        Slider(
          value: threshold,
          onChanged: onThresholdChanged,
          min: 0,
          max: 100,
          divisions: 100,
          label: threshold.round().toString(),
        ),
      ],
    );
  }
}
