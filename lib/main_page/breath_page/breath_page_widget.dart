import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/navigation_bar/navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';
import 'breath_page_model.dart';
export 'breath_page_model.dart';

class BreathPageWidget extends StatefulWidget {
  const BreathPageWidget({
    super.key,
    int? count,
  }) : count = count ?? 0;

  final int count;

  @override
  State<BreathPageWidget> createState() => _BreathPageWidgetState();
}

class _BreathPageWidgetState extends State<BreathPageWidget>
    with TickerProviderStateMixin {
  late BreathPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late ShakeDetector shakeDetector;
  var shakeActionInProgress = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BreathPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.currentdate = getCurrentTimestamp;
      if (FFAppState().currentconnect != '') {
        _model.dayout = await actions.getday();
        FFAppState().ngayhomnay = _model.dayout!;
        if (FFAppState().ngayhomnay != FFAppState().ngayhomtruoc) {
          FFAppState().ngayhomtruoc = _model.dayout!;
          FFAppState().solantaphomnay = 0;
          FFAppState().solantapluyenhomnay2 = 0;
        }
        _model.checkconnect = await actions.connectDevice(
          FFAppState().currentconnect,
          FFAppState().curentid,
        );
        await Future.delayed(const Duration(milliseconds: 500));
        await actions.sendData(
          FFAppState().currentconnect,
          FFAppState().curentid,
          'ZJKJ',
        );
        await Future.delayed(const Duration(milliseconds: 100));
        await actions.sendDatadaytime(
          FFAppState().currentconnect,
          FFAppState().curentid,
        );
        _model.instantTimer = InstantTimer.periodic(
          duration: const Duration(milliseconds: 4000),
          callback: (timer) async {
            _model.upfirebase1lan = false;
            _model.upfirebase1lan4 = false;
            _model.datarx = await actions.receiveData(
              FFAppState().currentconnect,
              FFAppState().curentid,
            );
            await actions.sendData08(
              FFAppState().currentconnect,
              FFAppState().curentid,
            );
            await actions.sendData09(
              FFAppState().currentconnect,
              FFAppState().curentid,
            );
            _model.loaigiatri = await actions.convert0(
              _model.datarx,
            );
            FFAppState().loaigiatri = _model.loaigiatri!;
            if (FFAppState().loaigiatri == 4) {
              _model.checknull = await actions.convertchecknull(
                _model.datarx,
              );
              FFAppState().checknull = _model.checknull!;
              if (FFAppState().checknull != 0) {
                _model.vCtho = await actions.convertdataVC(
                  _model.datarx,
                );
                _model.solanthohomnay = await actions.cong1function(
                  FFAppState().solantaphomnay,
                );
                await Future.delayed(const Duration(milliseconds: 10));
                FFAppState().solantaphomnay = _model.solanthohomnay!;
                FFAppState().VCtho = _model.vCtho!;
                FFAppState().addToListVCtho(FFAppState().VCtho);
                FFAppState().solantho = FFAppState().solantaphomnay;
                FFAppState().addToListSolantho(FFAppState().solantho);
                _model.thoigiantho = await actions.convertdatatime(
                  _model.datarx,
                );
                FFAppState().timetho = _model.thoigiantho!;
                FFAppState().addToListTimetho(FFAppState().timetho);
                if (!_model.upfirebase1lan) {
                  _model.upfirebase1lan = true;
                  _model.upfirebase1lan4 = true;
                  _model.tho = await queryBreathOutRecordOnce(
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);

                  await BreathOutRecord.collection.doc().set({
                    ...createBreathOutRecordData(
                      uid: currentUserReference,
                      num: FFAppState().solantho,
                      trainTime: FFAppState().timetho,
                      vc: FFAppState().VCtho,
                    ),
                    ...mapToFirestore(
                      {
                        'create_time': FieldValue.serverTimestamp(),
                      },
                    ),
                  });
                }
              }
            } else {
              if (FFAppState().loaigiatri == 5) {
                _model.checknull4 = await actions.convertchecknull(
                  _model.datarx,
                );
                FFAppState().checknull4 = _model.checknull4!;
                if (FFAppState().checknull4 != 0) {
                  _model.vChit = await actions.convertdataVC(
                    _model.datarx,
                  );
                  _model.solanhithomnay = await actions.cong1function(
                    FFAppState().solantapluyenhomnay2,
                  );
                  await Future.delayed(const Duration(milliseconds: 10));
                  FFAppState().solantapluyenhomnay2 = _model.solanhithomnay!;
                  FFAppState().VChit = _model.vChit!;
                  FFAppState().addToListVChit(FFAppState().VChit);
                  FFAppState().solanhit = FFAppState().solantapluyenhomnay2;
                  FFAppState().addToListSolanhit(FFAppState().solanhit);
                  _model.timehit = await actions.convertdatatime(
                    _model.datarx,
                  );
                  FFAppState().timehit = _model.timehit!;
                  FFAppState().addToListTimehit(FFAppState().timehit);
                  if (!_model.upfirebase1lan4) {
                    _model.upfirebase1lan4 = true;
                    _model.upfirebase1lan = true;
                    _model.hit = await queryBreathInRecordOnce(
                      singleRecord: true,
                    ).then((s) => s.firstOrNull);

                    await BreathInRecord.collection.doc().set({
                      ...createBreathInRecordData(
                        uid: currentUserReference,
                        num: FFAppState().solanhit,
                        trainTime: FFAppState().timehit,
                        vc: FFAppState().VChit,
                      ),
                      ...mapToFirestore(
                        {
                          'create_time': FieldValue.serverTimestamp(),
                        },
                      ),
                    });
                  }
                }
              }
            }

            await Future.delayed(const Duration(milliseconds: 1000));
          },
          startImmediately: true,
        );
      }
    });

    // On shake action.
    shakeDetector = ShakeDetector.autoStart(
      onPhoneShake: () async {
        if (shakeActionInProgress) {
          return;
        }
        shakeActionInProgress = true;
        try {
          _model.currentdate = getCurrentTimestamp;
          setState(() {});
        } finally {
          shakeActionInProgress = false;
        }
      },
      shakeThresholdGravity: 1.5,
    );

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    shakeDetector.stopListening();
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
        backgroundColor: const Color(0xFFF1F4F8),
        body: SafeArea(
          top: true,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: const Alignment(0.0, 0),
                        child: FlutterFlowButtonTabBar(
                          useToggleButtonStyle: true,
                          isScrollable: true,
                          labelStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                letterSpacing: 0.0,
                              ),
                          unselectedLabelStyle: const TextStyle(),
                          labelColor: const Color(0xFF14181B),
                          unselectedLabelColor: const Color(0xFF57636C),
                          backgroundColor: Colors.white,
                          unselectedBackgroundColor: const Color(0xFFE0E3E7),
                          borderColor: const Color(0xFFE0E3E7),
                          borderWidth: 2.0,
                          borderRadius: 12.0,
                          elevation: 0.0,
                          labelPadding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          tabs: const [
                            Tab(
                              text: '호기운동',
                            ),
                            Tab(
                              text: '흡기운동',
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [() async {}, () async {}][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 0.0),
                              child: StreamBuilder<List<BreathOutRecord>>(
                                stream: queryBreathOutRecord(
                                  queryBuilder: (breathOutRecord) =>
                                      breathOutRecord
                                          .where(
                                            'uid',
                                            isEqualTo: currentUserReference,
                                          )
                                          .orderBy('create_time',
                                              descending: true)
                                          .orderBy('num', descending: true),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<BreathOutRecord>
                                      containerBreathOutRecordList =
                                      snapshot.data!;
                                  final containerBreathOutRecord =
                                      containerBreathOutRecordList.isNotEmpty
                                          ? containerBreathOutRecordList.first
                                          : null;
                                  return Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                        topLeft: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0),
                                      ),
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              '주의 사항 : 호흡량이 1000ml일 때만 데이터가 기록됩니다.\n 1000ml 이상이 될 때까지 화이팅!',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.asset(
                                                  'assets/images/z5207278803567_cab3c2c562d6aae292872426e86fb003.jpg',
                                                ).image,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  offset: const Offset(
                                                    0.0,
                                                    2.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(90.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '호흡량',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                if (valueOrDefault<bool>(
                                                  dateTimeFormat(
                                                        'yMMMd',
                                                        containerBreathOutRecord
                                                            ?.createTime,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ) ==
                                                      dateTimeFormat(
                                                        'yMMMd',
                                                        _model.currentdate,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                  false,
                                                ))
                                                  Text(
                                                    FFAppState()
                                                        .VCtho
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                Text(
                                                  'ml',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'containerOnPageLoadAnimation1']!),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.asset(
                                                        'assets/images/z5207278792239_5a79380f43e7d7c4211c2f0845bcefb3.jpg',
                                                      ).image,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        offset: const Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            90.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    2.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          '호흡 시간',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      if (valueOrDefault<bool>(
                                                        dateTimeFormat(
                                                              'yMMMd',
                                                              containerBreathOutRecord
                                                                  ?.createTime,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ) ==
                                                            dateTimeFormat(
                                                              'yMMMd',
                                                              _model
                                                                  .currentdate,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                        false,
                                                      ))
                                                        Text(
                                                          FFAppState()
                                                              .timetho
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 24.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      Text(
                                                        's',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'containerOnPageLoadAnimation2']!),
                                                Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.asset(
                                                        'assets/images/z5207278765564_4660ecf94b89acce391ee638402895d0.jpg',
                                                      ).image,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        offset: const Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            90.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    30.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          '훈련 횟수',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      if (valueOrDefault<bool>(
                                                        dateTimeFormat(
                                                              'yMMMd',
                                                              containerBreathOutRecord
                                                                  ?.createTime,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ) ==
                                                            dateTimeFormat(
                                                              'yMMMd',
                                                              _model
                                                                  .currentdate,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                        false,
                                                      ))
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFAppState()
                                                                .solantho
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      24.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'containerOnPageLoadAnimation3']!),
                                              ],
                                            ),
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (valueOrDefault<bool>(
                                                      dateTimeFormat(
                                                            'yMMMd',
                                                            _model.currentdate,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ) ==
                                                          dateTimeFormat(
                                                            'yMMMd',
                                                            containerBreathOutRecord
                                                                ?.createTime,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                      false,
                                                    ))
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: SizedBox(
                                                            width: 2000.0,
                                                            height: 200.0,
                                                            child:
                                                                FlutterFlowLineChart(
                                                              data: [
                                                                FFLineChartData(
                                                                  xData: FFAppState()
                                                                      .listSolantho,
                                                                  yData: FFAppState()
                                                                      .listVCtho,
                                                                  settings:
                                                                      LineChartBarData(
                                                                    color: const Color(
                                                                        0xFF003EFF),
                                                                    barWidth:
                                                                        1.0,
                                                                    belowBarData:
                                                                        BarAreaData(
                                                                      show:
                                                                          true,
                                                                      color: const Color(
                                                                          0x48008BFF),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                              chartStylingInfo:
                                                                  ChartStylingInfo(
                                                                enableTooltip:
                                                                    true,
                                                                tooltipBackgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                showGrid: true,
                                                                showBorder:
                                                                    false,
                                                              ),
                                                              axisBounds:
                                                                  const AxisBounds(
                                                                minX: 1.0,
                                                                minY: 0.0,
                                                                maxX: 100.0,
                                                                maxY: 5000.0,
                                                              ),
                                                              xAxisLabelInfo:
                                                                  AxisLabelInfo(
                                                                title: '운동시간',
                                                                titleTextStyle:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      10.0,
                                                                ),
                                                                showLabels:
                                                                    true,
                                                                labelTextStyle:
                                                                    GoogleFonts
                                                                        .getFont(
                                                                  'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      10.0,
                                                                ),
                                                                labelInterval:
                                                                    1.0,
                                                                labelFormatter:
                                                                    LabelFormatter(
                                                                  numberFormat:
                                                                      (val) =>
                                                                          formatNumber(
                                                                    val,
                                                                    formatType:
                                                                        FormatType
                                                                            .custom,
                                                                    format: '0',
                                                                    locale: '',
                                                                  ),
                                                                ),
                                                              ),
                                                              yAxisLabelInfo:
                                                                  AxisLabelInfo(
                                                                title:
                                                                    '호흡량 (ml)',
                                                                titleTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                showLabels:
                                                                    true,
                                                                labelTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          fontSize:
                                                                              8.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                labelInterval:
                                                                    400.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (valueOrDefault<bool>(
                                                      dateTimeFormat(
                                                            'yMMMd',
                                                            _model.currentdate,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ) ==
                                                          dateTimeFormat(
                                                            'yMMMd',
                                                            containerBreathOutRecord
                                                                ?.createTime,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                      false,
                                                    ))
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: SizedBox(
                                                            width: 2000.0,
                                                            height: 200.0,
                                                            child:
                                                                FlutterFlowLineChart(
                                                              data: [
                                                                FFLineChartData(
                                                                  xData: FFAppState()
                                                                      .listSolantho,
                                                                  yData: FFAppState()
                                                                      .listTimetho,
                                                                  settings:
                                                                      LineChartBarData(
                                                                    color: const Color(
                                                                        0xFF009912),
                                                                    barWidth:
                                                                        2.0,
                                                                    belowBarData:
                                                                        BarAreaData(
                                                                      show:
                                                                          true,
                                                                      color: const Color(
                                                                          0x4C53FB67),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                              chartStylingInfo:
                                                                  ChartStylingInfo(
                                                                enableTooltip:
                                                                    true,
                                                                tooltipBackgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                showGrid: true,
                                                                showBorder:
                                                                    false,
                                                              ),
                                                              axisBounds:
                                                                  const AxisBounds(
                                                                minX: 1.0,
                                                                minY: 0.0,
                                                                maxX: 100.0,
                                                                maxY: 30.0,
                                                              ),
                                                              xAxisLabelInfo:
                                                                  AxisLabelInfo(
                                                                title: '운동시간',
                                                                titleTextStyle:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      10.0,
                                                                ),
                                                                showLabels:
                                                                    true,
                                                                labelTextStyle:
                                                                    GoogleFonts
                                                                        .getFont(
                                                                  'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      10.0,
                                                                ),
                                                                labelInterval:
                                                                    1.0,
                                                                labelFormatter:
                                                                    LabelFormatter(
                                                                  numberFormat:
                                                                      (val) =>
                                                                          formatNumber(
                                                                    val,
                                                                    formatType:
                                                                        FormatType
                                                                            .custom,
                                                                    format: '0',
                                                                    locale: '',
                                                                  ),
                                                                ),
                                                              ),
                                                              yAxisLabelInfo:
                                                                  AxisLabelInfo(
                                                                title: '시간 (s)',
                                                                titleTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                showLabels:
                                                                    true,
                                                                labelTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          fontSize:
                                                                              9.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                labelInterval:
                                                                    5.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (dateTimeFormat(
                                                'yMMMd',
                                                containerBreathOutRecord
                                                    ?.createTime,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ) !=
                                              dateTimeFormat(
                                                'yMMMd',
                                                _model.currentdate,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ))
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 40.0, 0.0, 0.0),
                                              child: Text(
                                                '오늘 운동을 시작해 주세요.',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: StreamBuilder<List<BreathInRecord>>(
                                stream: queryBreathInRecord(
                                  queryBuilder: (breathInRecord) =>
                                      breathInRecord
                                          .where(
                                            'uid',
                                            isEqualTo: currentUserReference,
                                          )
                                          .orderBy('create_time',
                                              descending: true)
                                          .orderBy('num', descending: true),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<BreathInRecord>
                                      containerBreathInRecordList =
                                      snapshot.data!;
                                  final containerBreathInRecord =
                                      containerBreathInRecordList.isNotEmpty
                                          ? containerBreathInRecordList.first
                                          : null;
                                  return Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                        topLeft: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0),
                                      ),
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 0.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: Text(
                                                '주의 사항 : 호흡량이 1000ml일 때만 데이터가 기록됩니다.\n 1000ml 이상이 될 때까지 화이팅!',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                            Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.asset(
                                                    'assets/images/z5207278803567_cab3c2c562d6aae292872426e86fb003.jpg',
                                                  ).image,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    offset: const Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(90.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '호흡량',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  if (valueOrDefault<bool>(
                                                    dateTimeFormat(
                                                          'yMMMd',
                                                          containerBreathInRecord
                                                              ?.createTime,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ) ==
                                                        dateTimeFormat(
                                                          'yMMMd',
                                                          _model.currentdate,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                    false,
                                                  ))
                                                    Text(
                                                      FFAppState()
                                                          .VChit
                                                          .toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                fontSize: 24.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  Text(
                                                    'ml',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'containerOnPageLoadAnimation4']!),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: Image.asset(
                                                          'assets/images/z5207278792239_5a79380f43e7d7c4211c2f0845bcefb3.jpg',
                                                        ).image,
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          offset: const Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              90.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      2.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            '호흡 시간',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        if (valueOrDefault<
                                                            bool>(
                                                          dateTimeFormat(
                                                                'yMMMd',
                                                                containerBreathInRecord
                                                                    ?.createTime,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ) ==
                                                              dateTimeFormat(
                                                                'yMMMd',
                                                                _model
                                                                    .currentdate,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                          false,
                                                        ))
                                                          Text(
                                                            FFAppState()
                                                                .timehit
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      24.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        Text(
                                                          's',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation5']!),
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: Image.asset(
                                                          'assets/images/z5207278765564_4660ecf94b89acce391ee638402895d0.jpg',
                                                        ).image,
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          offset: const Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              90.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      30.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            '훈련 횟수',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        if (valueOrDefault<
                                                            bool>(
                                                          dateTimeFormat(
                                                                'yMMMd',
                                                                containerBreathInRecord
                                                                    ?.createTime,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ) ==
                                                              dateTimeFormat(
                                                                'yMMMd',
                                                                _model
                                                                    .currentdate,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                          false,
                                                        ))
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFAppState()
                                                                  .solanhit
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        24.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation6']!),
                                                ],
                                              ),
                                            ),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (valueOrDefault<bool>(
                                                        dateTimeFormat(
                                                              'yMMMd',
                                                              _model
                                                                  .currentdate,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ) ==
                                                            dateTimeFormat(
                                                              'yMMMd',
                                                              containerBreathInRecord
                                                                  ?.createTime,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                        false,
                                                      ))
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: SizedBox(
                                                              width: 2000.0,
                                                              height: 200.0,
                                                              child:
                                                                  FlutterFlowLineChart(
                                                                data: [
                                                                  FFLineChartData(
                                                                    xData: FFAppState()
                                                                        .listSolanhit,
                                                                    yData: FFAppState()
                                                                        .listVChit,
                                                                    settings:
                                                                        LineChartBarData(
                                                                      color: const Color(
                                                                          0xFF003EFF),
                                                                      barWidth:
                                                                          1.0,
                                                                      belowBarData:
                                                                          BarAreaData(
                                                                        show:
                                                                            true,
                                                                        color: const Color(
                                                                            0x48008BFF),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                                chartStylingInfo:
                                                                    ChartStylingInfo(
                                                                  enableTooltip:
                                                                      true,
                                                                  tooltipBackgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  showGrid:
                                                                      true,
                                                                  showBorder:
                                                                      false,
                                                                ),
                                                                axisBounds:
                                                                    const AxisBounds(
                                                                  minX: 1.0,
                                                                  minY: 0.0,
                                                                  maxX: 100.0,
                                                                  maxY: 5000.0,
                                                                ),
                                                                xAxisLabelInfo:
                                                                    AxisLabelInfo(
                                                                  title: '운동시간',
                                                                  titleTextStyle:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        8.0,
                                                                  ),
                                                                  showLabels:
                                                                      true,
                                                                  labelTextStyle:
                                                                      GoogleFonts
                                                                          .getFont(
                                                                    'Readex Pro',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        10.0,
                                                                  ),
                                                                  labelInterval:
                                                                      1.0,
                                                                  labelFormatter:
                                                                      LabelFormatter(
                                                                    numberFormat:
                                                                        (val) =>
                                                                            formatNumber(
                                                                      val,
                                                                      formatType:
                                                                          FormatType
                                                                              .custom,
                                                                      format:
                                                                          '0',
                                                                      locale:
                                                                          '',
                                                                    ),
                                                                  ),
                                                                ),
                                                                yAxisLabelInfo:
                                                                    AxisLabelInfo(
                                                                  title:
                                                                      '호흡량 (ml)',
                                                                  titleTextStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            10.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  showLabels:
                                                                      true,
                                                                  labelTextStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            8.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  labelInterval:
                                                                      400.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (valueOrDefault<bool>(
                                                        dateTimeFormat(
                                                              'yMMMd',
                                                              _model
                                                                  .currentdate,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ) ==
                                                            dateTimeFormat(
                                                              'yMMMd',
                                                              containerBreathInRecord
                                                                  ?.createTime,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                        false,
                                                      ))
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: SizedBox(
                                                              width: 2000.0,
                                                              height: 200.0,
                                                              child:
                                                                  FlutterFlowLineChart(
                                                                data: [
                                                                  FFLineChartData(
                                                                    xData: FFAppState()
                                                                        .listSolanhit,
                                                                    yData: FFAppState()
                                                                        .listTimehit,
                                                                    settings:
                                                                        LineChartBarData(
                                                                      color: const Color(
                                                                          0xFF009912),
                                                                      barWidth:
                                                                          2.0,
                                                                      belowBarData:
                                                                          BarAreaData(
                                                                        show:
                                                                            true,
                                                                        color: const Color(
                                                                            0x4C53FB67),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                                chartStylingInfo:
                                                                    ChartStylingInfo(
                                                                  enableTooltip:
                                                                      true,
                                                                  tooltipBackgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  showGrid:
                                                                      true,
                                                                  showBorder:
                                                                      false,
                                                                ),
                                                                axisBounds:
                                                                    const AxisBounds(
                                                                  minX: 1.0,
                                                                  minY: 0.0,
                                                                  maxX: 100.0,
                                                                  maxY: 40.0,
                                                                ),
                                                                xAxisLabelInfo:
                                                                    AxisLabelInfo(
                                                                  title: '운동시간',
                                                                  titleTextStyle:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        10.0,
                                                                  ),
                                                                  showLabels:
                                                                      true,
                                                                  labelTextStyle:
                                                                      GoogleFonts
                                                                          .getFont(
                                                                    'Readex Pro',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        10.0,
                                                                  ),
                                                                  labelInterval:
                                                                      1.0,
                                                                  labelFormatter:
                                                                      LabelFormatter(
                                                                    numberFormat:
                                                                        (val) =>
                                                                            formatNumber(
                                                                      val,
                                                                      formatType:
                                                                          FormatType
                                                                              .custom,
                                                                      format:
                                                                          '0',
                                                                      locale:
                                                                          '',
                                                                    ),
                                                                  ),
                                                                ),
                                                                yAxisLabelInfo:
                                                                    AxisLabelInfo(
                                                                  title:
                                                                      '시간 (s)',
                                                                  titleTextStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            10.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  showLabels:
                                                                      true,
                                                                  labelTextStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            9.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  labelInterval:
                                                                      5.0,
                                                                  labelFormatter:
                                                                      LabelFormatter(
                                                                    numberFormat:
                                                                        (val) =>
                                                                            val.toString(),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (dateTimeFormat(
                                                  'yMMMd',
                                                  containerBreathInRecord
                                                      ?.createTime,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ) !=
                                                dateTimeFormat(
                                                  'yMMMd',
                                                  _model.currentdate,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ))
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 40.0, 0.0, 0.0),
                                                child: Text(
                                                  '오늘 운동을 시작해 주세요.',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.navigationBarModel,
                    updateCallback: () => setState(() {}),
                    child: const NavigationBarWidget(
                      selectedPageIndex: 2,
                      hidden: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
