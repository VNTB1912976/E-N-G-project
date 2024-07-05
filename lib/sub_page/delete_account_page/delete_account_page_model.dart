import '/flutter_flow/flutter_flow_util.dart';
import 'delete_account_page_widget.dart' show DeleteAccountPageWidget;
import 'package:flutter/material.dart';

class DeleteAccountPageModel extends FlutterFlowModel<DeleteAccountPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFocusNode?.dispose();
    nameTextController?.dispose();
  }
}
