import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:flutter_arduino_bluetooth_example/config.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:permission_handler/permission_handler.dart';



class BluetoothProvider extends ChangeNotifier {
  late BluetoothConnection _bluetoothConnection;
  final FlutterBluetoothSerial _bluetoothSerial = FlutterBluetoothSerial.instance;
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
  bool isConnected = false;

  PermissionStatus ?_bluetoothPermission;
  PermissionStatus ?_bluetoothConnectionPermission;
  PermissionStatus ?_bluetoothScanPermission;

  BluetoothProvider() {
    checkPermissions();
  }

  BluetoothState get currentBluetoothState {
      return _bluetoothState;
  }

  void checkState() async {
    _bluetoothState = await _bluetoothSerial.state;
    notifyListeners();
  }

  void checkConnect() {
    isConnected =  _bluetoothConnection.isConnected;
    notifyListeners();
  }
  //TODO CLEAN UP THIS MESS!!!
  void checkPermissions() async {
    if(_bluetoothState == BluetoothState.STATE_ON ||
        _bluetoothState == BluetoothState.STATE_BLE_TURNING_ON) {
      if (_bluetoothPermission != PermissionStatus.granted ||
          _bluetoothConnectionPermission != PermissionStatus.granted ||
          _bluetoothScanPermission != PermissionStatus.granted) {
        _bluetoothPermission = await Permission.bluetooth.request();
        _bluetoothScanPermission = await Permission.bluetoothScan.request();
        _bluetoothConnectionPermission = await Permission.bluetoothConnect.request();
      }
      notifyListeners();
      print(_bluetoothPermission.toString());
      print(_bluetoothScanPermission.toString());
      print(_bluetoothConnectionPermission.toString());
    }
  }

  void listDevices() {

  }
  
  void send(String message) async {
    try {
      _bluetoothConnection =
      await BluetoothConnection.toAddress(AppConfig.deviceAddress);
      print(Uint8List.fromList(message.codeUnits));
      _bluetoothConnection.output.add(Uint8List.fromList(message.codeUnits));
    } catch(error) {
        print(error);
    }
    notifyListeners();
  }
  
  void receive() async {
    if (isConnected) {

    }
  }

  void closeConnection() {
    if (isConnected) {
      _bluetoothConnection.close();
    }
  }
}