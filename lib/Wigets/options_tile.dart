import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OptionsTile extends StatelessWidget {
  OptionsTile(
      {super.key,
      required this.imageAddress,
      required this.label,
      required this.onTap});

  final String imageAddress;
  final String label;
  void Function(String label)? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: GestureDetector(
          onTap: () {
            if (onTap != null) {
              onTap!(label); // Pass the label to the onTap function
            }
          },
          child: Column(children: [
            Image.asset(
              imageAddress,
              height: 40,
              width: 40,
            ),
            Text(label),
          ]),
        ),
      ),
    );
  }
}
