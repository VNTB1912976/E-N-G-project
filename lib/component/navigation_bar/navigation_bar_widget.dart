import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'navigation_bar_model.dart';
export 'navigation_bar_model.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({
    super.key,
    int? selectedPageIndex,
    bool? hidden,
  })  : selectedPageIndex = selectedPageIndex ?? 2,
        hidden = hidden ?? false;

  final int selectedPageIndex;
  final bool hidden;

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget>
    with TickerProviderStateMixin {
  late NavigationBarModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavigationBarModel());

    animationsMap.addAll({
      'dividerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: const Offset(0.6, 1.0),
            end: const Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'dividerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: const Offset(0.6, 1.0),
            end: const Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'dividerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: const Offset(0.6, 1.0),
            end: const Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 600.0.ms,
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).success,
        shape: BoxShape.rectangle,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Opacity(
                opacity: widget.selectedPageIndex == 1 ? 1.0 : 0.5,
                child: FlutterFlowIconButton(
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: FaIcon(
                    FontAwesomeIcons.calendarCheck,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 35.0,
                  ),
                  onPressed: () async {
                    context.goNamed(
                      'SchedulePage',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                ),
              ),
              if (widget.selectedPageIndex == 1)
                SizedBox(
                  width: 30.0,
                  child: Divider(
                    height: 3.0,
                    thickness: 3.0,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ).animateOnPageLoad(
                    animationsMap['dividerOnPageLoadAnimation1']!),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Opacity(
                opacity: widget.selectedPageIndex == 2 ? 1.0 : 0.5,
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.home_outlined,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 45.0,
                  ),
                  onPressed: () async {
                    context.goNamed(
                      'BreathPage',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                ),
              ),
              if (widget.selectedPageIndex == 2)
                SizedBox(
                  width: 30.0,
                  child: Divider(
                    height: 3.0,
                    thickness: 3.0,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ).animateOnPageLoad(
                    animationsMap['dividerOnPageLoadAnimation2']!),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Opacity(
                opacity: widget.selectedPageIndex == 3 ? 1.0 : 0.5,
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 55.0,
                  icon: FaIcon(
                    FontAwesomeIcons.userCog,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 32.0,
                  ),
                  onPressed: () async {
                    context.goNamed(
                      'SettingPage',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                ),
              ),
              if (widget.selectedPageIndex == 3)
                SizedBox(
                  width: 30.0,
                  child: Divider(
                    height: 3.0,
                    thickness: 3.0,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ).animateOnPageLoad(
                    animationsMap['dividerOnPageLoadAnimation3']!),
            ],
          ),
        ],
      ),
    );
  }
}
