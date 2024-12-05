import 'package:flutter/material.dart';

class CoinDataRow extends StatelessWidget {
  const CoinDataRow({super.key, required this.title, required this.value});

  final String title;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        const Spacer(),
        Text("$value"),
      ],
    );
  }
}
