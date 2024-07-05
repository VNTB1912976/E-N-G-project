import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'strength_indicator_model.dart';
export 'strength_indicator_model.dart';

class StrengthIndicatorWidget extends StatefulWidget {
  const StrengthIndicatorWidget({
    super.key,
    required this.rssi,
    Color? color,
  }) : color = color ?? const Color(0x7F39D2C0);

  final int? rssi;
  final Color color;

  @override
  State<StrengthIndicatorWidget> createState() =>
      _StrengthIndicatorWidgetState();
}

class _StrengthIndicatorWidgetState extends State<StrengthIndicatorWidget> {
  late StrengthIndicatorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StrengthIndicatorModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                  child: Container(
                    width: 4.0,
                    height: 7.0,
                    decoration: BoxDecoration(
                      color: const Color(0x7F39D2C0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                  child: Container(
                    width: 4.0,
                    height: 11.0,
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        widget.rssi! >= -90
                            ? const Color(0x7F39D2C0)
                            : FlutterFlowTheme.of(context).secondaryText,
                        FlutterFlowTheme.of(context).secondaryText,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                  child: Container(
                    width: 4.0,
                    height: 14.0,
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        widget.rssi! >= -67
                            ? const Color(0x7F39D2C0)
                            : FlutterFlowTheme.of(context).secondaryText,
                        FlutterFlowTheme.of(context).secondaryText,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                  child: Container(
                    width: 4.0,
                    height: 17.0,
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        widget.rssi! >= -55
                            ? const Color(0x7F39D2C0)
                            : FlutterFlowTheme.of(context).secondaryText,
                        FlutterFlowTheme.of(context).secondaryText,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
