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

Future<List<BTDeviceStruct>> getConnectedDevices() async {
  final flutterBlue = FlutterBluePlus.instance;
  final connectedDevices = await flutterBlue.connectedDevices;
  List<BTDeviceStruct> devices = [];
  for (int i = 0; i < connectedDevices.length; i++) {
    final deviceResult = connectedDevices[i];
    final deviceState = await deviceResult.state.first;
    if (deviceState == BluetoothDeviceState.connected) {
      final deviceRssi = await deviceResult.readRssi();

      if (deviceResult.name == 'BreaThru Max') {
        devices.add(BTDeviceStruct(
          name: "이지앤안고라 골드",
          id: deviceResult.id.toString(),
          rssi: deviceRssi,
        ));
      } else if (deviceResult.name == 'BreaThru Pro') {
        devices.add(BTDeviceStruct(
          name: '이지앤안고라 기본',
          id: deviceResult.id.toString(),
          rssi: deviceRssi,
        ));
      } else {
        devices.add(BTDeviceStruct(
          name: deviceResult.name,
          id: deviceResult.id.toString(),
          rssi: deviceRssi,
        ));
      }
    }
  }
  return devices;
}
