import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommonTextBox extends StatelessWidget {
  CommonTextBox({super.key, required this.controller, required this.hintText});

  // ignore: prefer_typing_uninitialized_variables
  final controller;
  String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
