import 'package:flutter/widgets.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:permission_handler/permission_handler.dart';



class BluetoothProvider extends ChangeNotifier {
  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;

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

  void checkPermissions() async {
    if(_bluetooth == null && _bluetoothConnection == null && _bluetoothScan == null) {
      _bluetooth = await Permission.bluetooth.request();
      _bluetoothScan = await Permission.bluetoothScan.request();
      _bluetoothConnection = await Permission.bluetoothConnect.request();
    }
    if(_bluetooth != PermissionStatus.granted &&
        _bluetoothConnection != PermissionStatus.granted &&
        _bluetoothScan != PermissionStatus.granted) {
      print("Missing permission");
    }
    print(_bluetooth.toString());
    print(_bluetoothScan.toString());
    print(_bluetoothConnection.toString());
  }
  
  void send() async {
    //Todo
  }
  
  void receive() async {
    //Todo
  }
}