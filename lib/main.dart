import 'package:flutter/material.dart';
import 'package:flutter_arduino_bluetooth_example/bluetooth_provider.dart';
import 'package:flutter_arduino_bluetooth_example/navigation_screen.dart';
import 'package:provider/provider.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'navbar_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light(useMaterial3: true),
      dark: ThemeData.dark(useMaterial3: true),
      initial: AdaptiveThemeMode.dark,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Bluetooth',
        theme: theme,
        darkTheme: darkTheme,
        home: MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (context) => BottomNavigationBarProvider()),
      ChangeNotifierProvider(create: (context) => BluetoothProvider())],
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.deepPurple.withOpacity(0.5),
                title: Consumer<BottomNavigationBarProvider>(
                  builder: (context,provider,child) {
                    return Text(provider.selectedLabel);
                  },
                ),
              ),
              body: const NavigationScreen()),
        ),
      ),
    );
  }
}
