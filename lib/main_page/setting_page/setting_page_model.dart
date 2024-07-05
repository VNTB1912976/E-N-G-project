import '/component/navigation_bar/navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'setting_page_widget.dart' show SettingPageWidget;
import 'package:flutter/material.dart';

class SettingPageModel extends FlutterFlowModel<SettingPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NavigationBar component.
  late NavigationBarModel navigationBarModel;

  @override
  void initState(BuildContext context) {
    navigationBarModel = createModel(context, () => NavigationBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navigationBarModel.dispose();
  }
}
