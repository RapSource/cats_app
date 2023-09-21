import 'package:flutter/material.dart';
import 'list_cats_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    MainPage(),
    MainPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Daftar Ras Kucing'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Daftar Petshop'
          ),
        ]
      ),
    );
  }
}