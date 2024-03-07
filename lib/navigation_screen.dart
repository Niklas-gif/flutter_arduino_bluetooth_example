import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'navbar_provider.dart';



class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: navProvider.items[navProvider.currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurpleAccent.shade100,
        unselectedItemColor: Colors.deepPurple,
        currentIndex: navProvider.currentIndex,
        onTap: (index) {
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
