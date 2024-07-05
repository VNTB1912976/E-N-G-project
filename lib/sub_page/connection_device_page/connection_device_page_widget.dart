import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/strength_indicator/strength_indicator_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'connection_device_page_model.dart';
export 'connection_device_page_model.dart';

class ConnectionDevicePageWidget extends StatefulWidget {
  const ConnectionDevicePageWidget({
    super.key,
    bool? isBTEnabled,
    String? data,
  })  : isBTEnabled = isBTEnabled ?? false,
        data = data ?? '_';

  final bool isBTEnabled;
  final String data;

  @override
  State<ConnectionDevicePageWidget> createState() =>
      _ConnectionDevicePageWidgetState();
}

class _ConnectionDevicePageWidgetState extends State<ConnectionDevicePageWidget>
    with TickerProviderStateMixin {
  late ConnectionDevicePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConnectionDevicePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await requestPermission(bluetoothPermission);
      await requestPermission(locationPermission);
      _model.animation = true;
      setState(() {});
      _model.isEnabeled = await actions.isBluetoothEnabled();
      _model.isBluetoothEnable = _model.isEnabeled!;
      setState(() {});
      _model.devconnect = await actions.getConnectedDevices();
      _model.connecteddev = _model.devconnect!.toList().cast<BTDeviceStruct>();
      setState(() {});
      _model.findDev = await actions.findDevices();
      _model.foundDevices = _model.findDev!.toList().cast<BTDeviceStruct>();
      setState(() {});
      _model.animation = false;
      setState(() {});
    });

    _model.switchValue = true;
    animationsMap.addAll({
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pop();
            },
            child: const Icon(
              Icons.chevron_left_rounded,
              color: Color(0xFF0F1113),
              size: 32.0,
            ),
          ),
          title: Text(
            '블루투스 연결하기',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: const Color(0xFF0F1113),
                  fontSize: 24.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      )
                    ],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    shape: BoxShape.rectangle,
                  ),
                  alignment: const AlignmentDirectional(1.0, 0.0),
                  child: Align(
                    alignment: const AlignmentDirectional(1.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 30.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFAppState().currentconnect,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  FFAppState().curentid,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                50.0, 0.0, 20.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/ble.png',
                                width: 30.0,
                                height: 30.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 20.0, 0.0),
                            child: Switch.adaptive(
                              value: _model.switchValue!,
                              onChanged: (newValue) async {
                                setState(() => _model.switchValue = newValue);
                                if (newValue) {
                                  await actions.turnOnBluetooth();

                                  setState(() {});
                                } else {
                                  await actions.turnOffBluetooth();
                                  _model.foundDevices = [];
                                  setState(() {});
                                }
                              },
                              activeColor:
                                  FlutterFlowTheme.of(context).secondary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).alternate,
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 500.0,
                child: Divider(
                  height: 9.0,
                  thickness: 5.0,
                  color: FlutterFlowTheme.of(context).success,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 0.0),
                  child: Text(
                    '장치',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              if (valueOrDefault<bool>(
                _model.animation == true,
                true,
              ))
                Container(
                  width: double.infinity,
                  height: 500.0,
                  decoration: const BoxDecoration(
                    color: Color(0x4BFFFFFF),
                  ),
                  child: Lottie.asset(
                    'assets/lottie_animations/Animation_-_1709392265383.json',
                    width: 400.0,
                    height: 500.0,
                    fit: BoxFit.none,
                    animate: true,
                  ),
                ),
              Builder(
                builder: (context) {
                  final displayDevices = _model.foundDevices.toList();
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: displayDevices.length,
                    itemBuilder: (context, displayDevicesIndex) {
                      final displayDevicesItem =
                          displayDevices[displayDevicesIndex];
                      return Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(16.0),
                              bottomRight: Radius.circular(16.0),
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 4.0, 0.0),
                                    child: GradientText(
                                      displayDevicesItem.name,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      colors: [
                                        FlutterFlowTheme.of(context).primary,
                                        FlutterFlowTheme.of(context).secondary
                                      ],
                                      gradientDirection: GradientDirection.ltr,
                                      gradientType: GradientType.linear,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.strengthIndicatorModels1
                                        .getModel(
                                      displayDevicesItem.rssi.toString(),
                                      displayDevicesIndex,
                                    ),
                                    updateCallback: () => setState(() {}),
                                    child: StrengthIndicatorWidget(
                                      key: Key(
                                        'Key4hm_${displayDevicesItem.rssi.toString()}',
                                      ),
                                      rssi: displayDevicesItem.rssi,
                                      color: () {
                                        if (displayDevicesItem.rssi >= -67) {
                                          return const Color(0x7F39D2C0);
                                        } else if (displayDevicesItem.rssi >=
                                            -90) {
                                          return FlutterFlowTheme.of(context)
                                              .warning;
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .error;
                                        }
                                      }(),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      displayDevicesItem.id,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 20.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        FFAppState().currentconnect =
                                            displayDevicesItem.name;
                                        FFAppState().curentid =
                                            displayDevicesItem.id;
                                        FFAppState().kiemtraketnoimoi = 1;
                                        FFAppState().update(() {});
                                        await actions.connectDevice(
                                          FFAppState().currentconnect,
                                          FFAppState().curentid,
                                        );
                                        await Future.delayed(
                                            const Duration(milliseconds: 500));
                                        await actions.sendData(
                                          FFAppState().currentconnect,
                                          FFAppState().curentid,
                                          'ZJKJ',
                                        );
                                        await Future.delayed(
                                            const Duration(milliseconds: 100));
                                        await actions.sendDatadaytime(
                                          FFAppState().currentconnect,
                                          FFAppState().curentid,
                                        );

                                        context.pushNamed('BreathPage');
                                      },
                                      text: '연결하기',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'buttonOnPageLoadAnimation1']!),
                                  ),
                                ],
                              ),
                            ],
                          ).animateOnPageLoad(
                              animationsMap['columnOnPageLoadAnimation1']!),
                        ),
                      );
                    },
                  );
                },
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 0.0),
                  child: Text(
                    '연결된 장치',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              Builder(
                builder: (context) {
                  final displayDevicesconnect = _model.connecteddev.toList();
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: displayDevicesconnect.length,
                    itemBuilder: (context, displayDevicesconnectIndex) {
                      final displayDevicesconnectItem =
                          displayDevicesconnect[displayDevicesconnectIndex];
                      return Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(16.0),
                              bottomRight: Radius.circular(16.0),
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 4.0, 0.0),
                                    child: GradientText(
                                      displayDevicesconnectItem.name,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      colors: [
                                        FlutterFlowTheme.of(context).primary,
                                        FlutterFlowTheme.of(context).secondary
                                      ],
                                      gradientDirection: GradientDirection.ltr,
                                      gradientType: GradientType.linear,
                                    ),
                                  ),
                                  if (_model.isEnabeled ?? true)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.strengthIndicatorModels2
                                            .getModel(
                                          displayDevicesconnectItem.rssi
                                              .toString(),
                                          displayDevicesconnectIndex,
                                        ),
                                        updateCallback: () => setState(() {}),
                                        child: StrengthIndicatorWidget(
                                          key: Key(
                                            'Key6cg_${displayDevicesconnectItem.rssi.toString()}',
                                          ),
                                          rssi: displayDevicesconnectItem.rssi,
                                          color: () {
                                            if (displayDevicesconnectItem
                                                    .rssi >=
                                                -67) {
                                              return const Color(0x7F39D2C0);
                                            } else if (displayDevicesconnectItem
                                                    .rssi >=
                                                -90) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .warning;
                                            } else {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .error;
                                            }
                                          }(),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      displayDevicesconnectItem.id,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 20.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await actions.disconnectDevice(
                                          displayDevicesconnectItem,
                                        );
                                        _model.connecteddev = [];
                                        setState(() {});
                                      },
                                      text: '연결 끊기',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'buttonOnPageLoadAnimation2']!),
                                  ),
                                ],
                              ),
                            ],
                          ).animateOnPageLoad(
                              animationsMap['columnOnPageLoadAnimation2']!),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
