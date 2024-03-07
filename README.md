# flutter_arduino_bluetooth_example

A example project for connecting flutter via bluetooth with an arduino using an **HC-05/HC-06 Module**.
**Flutter_bluetooth_serial**.

## How to use
 Please create a **config.dart** file containing the address of the bluetooth device you would like
 to connect too. something like the following should work...

```
class AppConfigs {
  static const String deviceAddress = 'My address';
}
```

