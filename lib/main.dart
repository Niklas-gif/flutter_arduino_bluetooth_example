import 'package:flutter/material.dart';
import 'package:flutter_arduino_bluetooth_example/nav_widget.dart';
import 'package:provider/provider.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create:(context)=>AppState(),
        child: AdaptiveTheme(
          light: ThemeData.light(useMaterial3: true),
          dark: ThemeData.dark(useMaterial3: true),
          initial: AdaptiveThemeMode.light,
          builder: (theme,darkTheme) =>MaterialApp(
            title: 'Bluetooth',
            theme: theme,
            darkTheme: darkTheme,
            home: MyHomePage(),
          ),)
    );
  }
}

class AppState extends ChangeNotifier {

}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: const Text("Bluetooth"),
      ),
      body: NavigationScreen());
  }
}
