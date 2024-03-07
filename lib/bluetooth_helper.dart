import 'package:flutter/widgets.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';


class BluetoothHelper extends ChangeNotifier {
  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;

  BluetoothState get currentBluetoothState {
      return _bluetoothState;
  }

  void checkState() async {
    _bluetoothState = await bluetooth.state;
    notifyListeners();
  }
}