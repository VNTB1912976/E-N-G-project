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

Future<String> sendData(String devicename, String deviceid, String data) async {
  try {
    final device = BluetoothDevice.fromId(deviceid, name: devicename);
    final services = await device.discoverServices();
    for (BluetoothService service in services) {
      for (BluetoothCharacteristic characteristic in service.characteristics) {
        final isWrite = characteristic.properties.writeWithoutResponse;
        if (isWrite) {
          await characteristic.write(data.codeUnits, withoutResponse: true);
          return characteristic.uuid
              .toString(); // Ensure method call for toString
        }
      }
    }
    return "No writable characteristic found"; // Return a message if no writable characteristic is found
  } catch (e) {
    // Handle any exceptions that occur during the operation
    return "Error sending data: $e";
  }
}
