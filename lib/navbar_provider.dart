import 'package:flutter/material.dart';
import 'package:flutter_arduino_bluetooth_example/send_screen.dart';
import 'connect_screen.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  List<NavBarItem> items = [
    NavBarItem(widget: ConnectScreen(),label: "Connect",icon: Icons.bluetooth,),
    NavBarItem(widget: SendScreen(), label: "Send",icon: Icons.send)
  ];
  int _currentIndex = 0;
  int get currentIndex {
    return _currentIndex;
  }

  String get selectedLabel {
    return items[_currentIndex].label ?? "none";
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