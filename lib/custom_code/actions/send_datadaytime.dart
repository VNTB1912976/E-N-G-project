// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Custom action imports
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:typed_data';

// Helper function to convert a hex string to byte data
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

// Main function to send date and time data to a Bluetooth device
Future<String> sendDatadaytime(String devicename, String deviceid) async {
  try {
    // Create a Bluetooth device instance using the provided device ID and name
    final device = BluetoothDevice.fromId(deviceid, name: devicename);
    final services = await device.discoverServices();
    DateTime now = DateTime.now();
    String yearHex = now.year.toString().substring(2, 4);
    String monthHex = now.month.toRadixString(16).padLeft(2, '0');
    String dayHex = now.day.toRadixString(16).padLeft(2, '0');
    String hourHex = now.hour.toRadixString(16).padLeft(2, '0');
    String minuteHex = now.minute.toRadixString(16).padLeft(2, '0');

    // Initialize the hex data string
    String hexData = "";
    for (BluetoothService service in services) {
      for (BluetoothCharacteristic characteristic in service.characteristics) {
        final isWrite = characteristic.properties.writeWithoutResponse;
        if (isWrite) {
          // Prepare the hex data string to be sent
          hexData = "BB-01-" +
              yearHex.toUpperCase() +
              "-" +
              monthHex.toUpperCase() +
              "-" +
              dayHex.toUpperCase() +
              "-" +
              hourHex.toUpperCase() +
              "-" +
              minuteHex.toUpperCase() +
              "-55-55";

          // Convert the hex string to byte data
          Uint8List byteData = hexStringToBytes(hexData);

          // Write the byte data to the characteristic
          await characteristic.write(byteData, withoutResponse: true);

          // Return the hex data string as confirmation of what was sent
          return hexData;
        }
      }
    }

    // Return the hex data string, which will be empty if no writeable characteristic was found
    return hexData;
  } catch (e) {
    // Return error message if an exception occurs
    return "Error: $e";
  }
}
