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
import 'dart:typed_data';

Uint8List hexStringToBytes(String hex) {
  hex = hex.replaceAll("-", ""); // Loại bỏ ký tự '-' nếu có
  List<int> bytes = [];
  for (int i = 0; i < hex.length; i += 2) {
    final byteString = hex.substring(i, i + 2);
    final byte = int.parse(byteString, radix: 16);
    bytes.add(byte);
  }
  return Uint8List.fromList(bytes);
}

Future<String> sendData02(String devicename, String deviceid) async {
  try {
    final device = BluetoothDevice.fromId(deviceid, name: devicename);
    final services = await device.discoverServices();

    for (BluetoothService service in services) {
      for (BluetoothCharacteristic characteristic in service.characteristics) {
        final isWrite = characteristic.properties.writeWithoutResponse;
        if (isWrite) {
          String hexData = "BB-02-55";
          // "BB - 01 - {A} - {B} - {C} - {D} - {E} - 55 - 55 "
          Uint8List byteData = hexStringToBytes(hexData);
          await characteristic.write(byteData, withoutResponse: true);
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
