import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/strength_indicator/strength_indicator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'connection_device_page_widget.dart' show ConnectionDevicePageWidget;
import 'package:flutter/material.dart';

class ConnectionDevicePageModel
    extends FlutterFlowModel<ConnectionDevicePageWidget> {
  ///  Local state fields for this page.

  bool isFetchingDevices = false;

  bool isBluetoothEnable = false;

  List<BTDeviceStruct> foundDevices = [];
  void addToFoundDevices(BTDeviceStruct item) => foundDevices.add(item);
  void removeFromFoundDevices(BTDeviceStruct item) => foundDevices.remove(item);
  void removeAtIndexFromFoundDevices(int index) => foundDevices.removeAt(index);
  void insertAtIndexInFoundDevices(int index, BTDeviceStruct item) =>
      foundDevices.insert(index, item);
  void updateFoundDevicesAtIndex(
          int index, Function(BTDeviceStruct) updateFn) =>
      foundDevices[index] = updateFn(foundDevices[index]);

  DataRxStruct? dataRx;
  void updateDataRxStruct(Function(DataRxStruct) updateFn) {
    updateFn(dataRx ??= DataRxStruct());
  }

  String daytimetest = 'hello';

  List<BTDeviceStruct> connecteddev = [];
  void addToConnecteddev(BTDeviceStruct item) => connecteddev.add(item);
  void removeFromConnecteddev(BTDeviceStruct item) => connecteddev.remove(item);
  void removeAtIndexFromConnecteddev(int index) => connecteddev.removeAt(index);
  void insertAtIndexInConnecteddev(int index, BTDeviceStruct item) =>
      connecteddev.insert(index, item);
  void updateConnecteddevAtIndex(
          int index, Function(BTDeviceStruct) updateFn) =>
      connecteddev[index] = updateFn(connecteddev[index]);

  bool animation = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - isBluetoothEnabled] action in ConnectionDevicePage widget.
  bool? isEnabeled;
  // Stores action output result for [Custom Action - getConnectedDevices] action in ConnectionDevicePage widget.
  List<BTDeviceStruct>? devconnect;
  // Stores action output result for [Custom Action - findDevices] action in ConnectionDevicePage widget.
  List<BTDeviceStruct>? findDev;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Models for StrengthIndicator dynamic component.
  late FlutterFlowDynamicModels<StrengthIndicatorModel>
      strengthIndicatorModels1;
  // Models for StrengthIndicator dynamic component.
  late FlutterFlowDynamicModels<StrengthIndicatorModel>
      strengthIndicatorModels2;

  @override
  void initState(BuildContext context) {
    strengthIndicatorModels1 =
        FlutterFlowDynamicModels(() => StrengthIndicatorModel());
    strengthIndicatorModels2 =
        FlutterFlowDynamicModels(() => StrengthIndicatorModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    strengthIndicatorModels1.dispose();
    strengthIndicatorModels2.dispose();
  }
}
