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

Future<List<BTDeviceStruct>> findDevices() async {
  final flutterBlue = FlutterBluePlus.instance;
  List<BTDeviceStruct> devices = [];
  flutterBlue.scanResults.listen((results) {
    List<ScanResult> scannedDevices = [];
    for (ScanResult r in results) {
      if (r.device.name.isNotEmpty) {
        scannedDevices.add(r);
      }
    }
    scannedDevices.sort((a, b) => b.rssi.compareTo(a.rssi));
    devices.clear();
    scannedDevices.forEach((deviceResult) {
      if (deviceResult.device.name == 'BreaThru Max') {
        devices.add(BTDeviceStruct(
          name: "이지앤안고라 골드",
          id: deviceResult.device.id.toString(),
          rssi: deviceResult.rssi,
        ));
      } else if (deviceResult.device.name == 'BreaThru PRO') {
        devices.add(BTDeviceStruct(
          name: '이지앤안고라 기본',
          id: deviceResult.device.id.toString(),
          rssi: deviceResult.rssi,
        ));
      } else {
        devices.add(BTDeviceStruct(
          name: deviceResult.device.name,
          id: deviceResult.device.id.toString(),
          rssi: deviceResult.rssi,
        ));
      }
    });
  });
  final isScanning = flutterBlue.isScanningNow;
  if (!isScanning) {
    await flutterBlue.startScan(
      timeout: const Duration(seconds: 5),
      androidUsesFineLocation: true,
    );
  }

  return devices;
}
