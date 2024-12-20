import 'package:flutter/material.dart';

class MoneyTextWidget extends StatelessWidget {
  final double value;
  final TextStyle? style;
  const MoneyTextWidget({
    super.key,
    required this.value,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$value EGP',
      style: style,
    );
  }
}
