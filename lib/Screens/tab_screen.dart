import 'package:bynry_assignment/Screens/homepage.dart';
import 'package:bynry_assignment/Screens/my_intro_page.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectedPage(int index) {
    _selectedPageIndex = index;
    if (_selectedPageIndex == 0) {
      _openDashBoardOverlay();
    }
  }

  void _openDashBoardOverlay() {
    showModalBottomSheet(
        enableDrag: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) => const MyIntro());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomePage(),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectedPage,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.speed),
              label: "dashboard",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.data_usage), label: "usage"),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: "History"),
            BottomNavigationBarItem(
                icon: Icon(Icons.support_agent_rounded), label: "Support"),
          ]),
    );
  }
}
