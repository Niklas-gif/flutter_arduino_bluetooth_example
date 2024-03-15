import 'package:flutter/widgets.dart';
import 'package:flutter_arduino_bluetooth_example/config.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:permission_handler/permission_handler.dart';



class BluetoothProvider extends ChangeNotifier {
  late BluetoothConnection _bluetoothConnection;
  FlutterBluetoothSerial _bluetoothSerial = FlutterBluetoothSerial.instance;
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
  bool _isConnected = false;

  PermissionStatus ?_bluetoothPermission;
  PermissionStatus ?_bluetoothConnectionPermission;
  PermissionStatus ?_bluetoothScanPermission;

  BluetoothState get currentBluetoothState {
      return _bluetoothState;
  }

  void checkState() async {
    _bluetoothState = await _bluetoothSerial.state;
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
      } else {
        connect();
      }
      print(_bluetoothPermission.toString());
      print(_bluetoothScanPermission.toString());
      print(_bluetoothConnectionPermission.toString());
    }
  }

  void listDevices() {

  }

  void connect() async {
    try {
      _bluetoothConnection = await BluetoothConnection.toAddress(AppConfig.deviceAddress);
      _isConnected = _bluetoothConnection.isConnected;
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
      _bluetoothConnection.close();
    }
  }
}