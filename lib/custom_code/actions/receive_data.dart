// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:async';

Future<String?> receiveData(String devicename, String deviceid) async {
  final Completer<String?> completer = Completer<String?>();
  final device = BluetoothDevice.fromId(deviceid, name: devicename);
  final services = await device.discoverServices();
  for (BluetoothService service in services) {
    for (BluetoothCharacteristic characteristic in service.characteristics) {
      if (characteristic.properties.notify) {
        await characteristic.setNotifyValue(true);
        characteristic.value.listen((data) {
          // Assuming data is a List<int> and you want to convert it to a String
          String dataString = data.map((number) => number.toString()).join(',');
          if (!completer.isCompleted) {
            completer.complete(dataString);
          }
        });

        // To avoid indefinite waiting if no data is received, set a timeout
        return completer.future.timeout(Duration(seconds: 10), onTimeout: () {
          if (!completer.isCompleted) {
            completer.complete(null); // Return null if timeout occurs
          }
          return null;
        });
      }
    }
  }
  // If no characteristic with notify property is found, return null
  if (!completer.isCompleted) {
    completer.complete(null);
  }
  return completer.future; // Correct placement for return statement
}
