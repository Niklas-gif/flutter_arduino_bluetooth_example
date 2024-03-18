import 'package:flutter/material.dart';
import 'package:flutter_arduino_bluetooth_example/bluetooth_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class ConnectScreen extends StatelessWidget {
  const ConnectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BluetoothProvider bluetoothProvider =
        Provider.of<BluetoothProvider>(context);
    bluetoothProvider.checkState();
    if (bluetoothProvider.currentBluetoothState == BluetoothState.STATE_ON) {
      return const ConnectWidget();
    } else {
      return const BluetoothDisabled();
    }
  }
}

class ConnectWidget extends StatelessWidget {
  const ConnectWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BluetoothProvider>(
      builder: (context, bluetoothProvider, child) {
        return Scaffold(
          body: Column(
            children: [
              const Icon(
                size: 69 * 6,
                color: Colors.lightBlueAccent,
                Icons.bluetooth,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: bluetoothProvider.currentBluetoothState.isEnabled ? () {
                            print("Click");
                            BluetoothProvider().send("1");
                          } : null,
                          child: const Text("Mode 1"),
                        )
                        ,
                        ElevatedButton(
                          onPressed: bluetoothProvider.currentBluetoothState.isEnabled ? () {
                            print("Click");
                            BluetoothProvider().send("2");
                          } : null,
                          child: const Text("Mode 2"),
                        )
                        ,
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: bluetoothProvider.currentBluetoothState.isEnabled ? () {
                            print("Click");
                            BluetoothProvider().send("3");
                          } : null,
                          child: const Text("Mode 3"),
                        )
                        ,
                        ElevatedButton(
                          onPressed: bluetoothProvider.currentBluetoothState.isEnabled ? () {
                            print("Click");
                            BluetoothProvider().send("4");
                          } : null,
                          child: const Text("Mode 4"),
                        )
                        ,
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class BluetoothDisabled extends StatelessWidget {
  const BluetoothDisabled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
            size: 69 * 6,
            color: Colors.lightBlueAccent,
            Icons.bluetooth_disabled),
      ),
    );
  }
}
