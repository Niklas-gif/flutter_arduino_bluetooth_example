import 'package:flutter/widgets.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:permission_handler/permission_handler.dart';



class BluetoothProvider extends ChangeNotifier {
  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;

  BluetoothState get currentBluetoothState {
      return _bluetoothState;
  }

  void checkState() async {
    _bluetoothState = await bluetooth.state;
    notifyListeners();
  }

  void checkPermissions() async {
    //Todo
    //var status = await Permission.bluetooth.request();
  }
  
  void send() async {
    //Todo
  }
  
  void receive() async {
    //Todo
  }
}