import 'package:card_animation/widgets/coffee_state.dart';
import 'package:flutter/material.dart';

class CoffeeInfo extends StatelessWidget {
  const CoffeeInfo({
    super.key,
    required this.name,
    required this.des,
    required this.price,
  });
  final String name;
  final String des;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 0.5,
            blurRadius: 0.5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: Colors.grey.shade400),
              ),
            ),
            child: Center(
              child: Text(
                name,
                maxLines: 1,
                style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(height: 1, thickness: 1, color: Colors.grey.shade400),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CoffeeStatsWidget(
                  statTitle: 'Description',
                  statValue: des,
                ),
                CoffeeStatsWidget(
                  statTitle: 'Price',
                  statValue: price,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
