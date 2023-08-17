import 'package:flutter/material.dart';

class CoffeeStatsWidget extends StatelessWidget {
  const CoffeeStatsWidget({
    super.key,
    required this.statTitle,
    required this.statValue,
  });

  final String statTitle;
  final String statValue;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        Text(
          statTitle,
          style: themeData.textTheme.bodyMedium!
              .copyWith(color: Colors.grey.shade400, fontSize: 16),
        ),
        Text(
          statValue,
          style: themeData.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
              fontSize: 14),
        ),
        const SizedBox(height: 4)
      ],
    );
  }
}
