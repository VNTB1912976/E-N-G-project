import '/backend/backend.dart';
import '/component/navigation_bar/navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'breath_page_widget.dart' show BreathPageWidget;
import 'package:flutter/material.dart';

class BreathPageModel extends FlutterFlowModel<BreathPageWidget> {
  ///  Local state fields for this page.

  DateTime? currentdate;

  DataRxStruct? dataRx;
  void updateDataRxStruct(Function(DataRxStruct) updateFn) {
    updateFn(dataRx ??= DataRxStruct());
  }

  int? checknullsl;

  String testdaytime = 'hello';

  int count = 0;

  bool upfirebase1lan = false;

  bool upfirebase1lan4 = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getday] action in BreathPage widget.
  int? dayout;
  // Stores action output result for [Custom Action - connectDevice] action in BreathPage widget.
  bool? checkconnect;
  InstantTimer? instantTimer;
  // Stores action output result for [Custom Action - receiveData] action in BreathPage widget.
  String? datarx;
  // Stores action output result for [Custom Action - convert0] action in BreathPage widget.
  int? loaigiatri;
  // Stores action output result for [Custom Action - convertchecknull] action in BreathPage widget.
  int? checknull;
  // Stores action output result for [Custom Action - convertdataVC] action in BreathPage widget.
  int? vCtho;
  // Stores action output result for [Custom Action - cong1function] action in BreathPage widget.
  int? solanthohomnay;
  // Stores action output result for [Custom Action - convertdatatime] action in BreathPage widget.
  int? thoigiantho;
  // Stores action output result for [Firestore Query - Query a collection] action in BreathPage widget.
  BreathOutRecord? tho;
  // Stores action output result for [Custom Action - convertchecknull] action in BreathPage widget.
  int? checknull4;
  // Stores action output result for [Custom Action - convertdataVC] action in BreathPage widget.
  int? vChit;
  // Stores action output result for [Custom Action - cong1function] action in BreathPage widget.
  int? solanhithomnay;
  // Stores action output result for [Custom Action - convertdatatime] action in BreathPage widget.
  int? timehit;
  // Stores action output result for [Firestore Query - Query a collection] action in BreathPage widget.
  BreathInRecord? hit;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for NavigationBar component.
  late NavigationBarModel navigationBarModel;

  @override
  void initState(BuildContext context) {
    navigationBarModel = createModel(context, () => NavigationBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    instantTimer?.cancel();
    tabBarController?.dispose();
    navigationBarModel.dispose();
  }
}
