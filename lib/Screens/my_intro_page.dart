import 'package:flutter/material.dart';

class MyIntro extends StatelessWidget {
  const MyIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/profile.png',
            width: 100,
            height: 100,
          ),
          const Text("This app is developed by"),
          const Text("Varun Bhosle"),
          const Text("Inspired to be full stack developer"),
          const Text("Porfolio: www.github.com/varun-a50"),
          const Text("Linkedin: www.linkedin.com/in/varun-bhosle"),
          const Center(
            child: Text(
                "Thank you for the assignment I really enjoyed doing this assignment helped me a lot to re-understand flutter"),
          ),
        ],
      ),
    );
  }
}
