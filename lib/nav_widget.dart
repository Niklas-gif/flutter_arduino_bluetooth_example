import 'package:flutter/material.dart';
import 'package:flutter_arduino_bluetooth_example/connect_screen.dart';
import 'package:flutter_arduino_bluetooth_example/send_screen.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  List<NavBarItem> items = [
    NavBarItem(widget: ConnectScreen(),label: "Connect",icon: Icons.bluetooth,),
    NavBarItem(widget: SendScreen(), label: "Send",icon: Icons.send)
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
    final navProvider = Provider.of<BottomNavigationBarProvider>(context,);
    return Scaffold(
      body: navProvider.items[navProvider._currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navProvider._currentIndex,
        onTap: (index) {
          print(index);
          navProvider.currentIndex = index;
        },items: navProvider.items.map((item)=>
          BottomNavigationBarItem(
          icon: Icon(item.icon),
          label: item.label))
          .toList(),
      ),
    );
  }
}
