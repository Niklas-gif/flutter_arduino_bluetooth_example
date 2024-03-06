import 'package:flutter/material.dart';

class ConnectScreen extends StatelessWidget {
  const ConnectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(size: 69*6,color: Colors.lightBlueAccent, Icons.bluetooth_disabled),
      ),
    );
  }
}
