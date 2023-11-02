import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Watch"),
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Media Library"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "More"),
        ],
      ),
      body: const Column(),
    );
  }
}
