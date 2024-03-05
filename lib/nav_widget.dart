import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex {
    return _currentIndex;
  }

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

class NavWidget extends StatelessWidget {
  const NavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [
        NavigationDestination(
            icon: Icon(Icons.bluetooth),
            label: 'Connect'),
        NavigationDestination(
            icon: Icon(Icons.send),
            label: 'Send')
      ],
      selectedIndex: BottomNavigationBarProvider()._currentIndex,
    );
  }
}
