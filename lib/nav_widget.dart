import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  List<NavBarItem> items = [
    NavBarItem(label: "Connect",icon: Icons.bluetooth),
    NavBarItem(label: "Send",icon: Icons.send)
  ];
  int _currentIndex = 0;
  int get currentIndex {
    return _currentIndex;
  }

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

class NavBarItem {
  Widget? widget;
  String? label;
  IconData? icon;

  NavBarItem({this.widget,this.label,this.icon});
}

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navProvider = BottomNavigationBarProvider();
    return Scaffold(
      body: navProvider.items[navProvider._currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navProvider._currentIndex,
        onTap: (index) {
          navProvider._currentIndex = index;
        },items: navProvider.items.map((item)=>BottomNavigationBarItem(icon: Icon(item.icon),label: item.label)).toList(),
      ),
    );
  }
}
