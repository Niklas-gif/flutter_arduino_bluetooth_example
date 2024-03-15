import 'dart:js_util';

import 'package:flutter/widgets.dart';
import 'package:flutter_arduino_bluetooth_example/config.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:permission_handler/permission_handler.dart';



class BluetoothProvider extends ChangeNotifier {
  late BluetoothConnection bluetoothConnection;
  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
  bool _isConnected = false;

  PermissionStatus ?_bluetooth;
  PermissionStatus ?_bluetoothConnection;
  PermissionStatus ?_bluetoothScan;

  BluetoothState get currentBluetoothState {
      return _bluetoothState;
  }

  void checkState() async {
    _bluetoothState = await bluetooth.state;
    notifyListeners();
  }
  //TODO CLEAN UP THIS MESS!!!
  void checkPermissions() async {
    if(_bluetoothState == BluetoothState.STATE_ON ||
        _bluetoothState == BluetoothState.STATE_BLE_TURNING_ON) {
      if (_bluetooth != PermissionStatus.granted ||
          _bluetoothConnection != PermissionStatus.granted ||
          _bluetoothScan != PermissionStatus.granted) {
        _bluetooth = await Permission.bluetooth.request();
        _bluetoothScan = await Permission.bluetoothScan.request();
        _bluetoothConnection = await Permission.bluetoothConnect.request();
      } /*else {
        connect();
      }*/
      print(_bluetooth.toString());
      print(_bluetoothScan.toString());
      print(_bluetoothConnection.toString());
    }
  }

  void listDevices() {

  }

  void connect() async {
    try {
      bluetoothConnection = await BluetoothConnection.toAddress(AppConfig.deviceAddress);
      _isConnected = bluetoothConnection.isConnected;
      print("Connected to the device");
    } catch(error) {
        print(error);
    }
  }
  
  void send(String message) async {
    if (_isConnected) {
    }
  }
  
  void receive() async {
    if (_isConnected) {

    }
  }

  void closeConnection() {
    if (_isConnected) {
      bluetoothConnection.close();
    }
  }
}