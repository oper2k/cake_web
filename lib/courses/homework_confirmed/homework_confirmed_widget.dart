import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'homework_confirmed_model.dart';
export 'homework_confirmed_model.dart';

class HomeworkConfirmedWidget extends StatefulWidget {
  const HomeworkConfirmedWidget({
    Key? key,
    required this.lesson,
    required this.countLes,
    required this.index,
    required this.courseFree,
  }) : super(key: key);

  final LessonsRecord? lesson;
  final int? countLes;
  final int? index;
  final bool? courseFree;

  @override
  _HomeworkConfirmedWidgetState createState() =>
      _HomeworkConfirmedWidgetState();
}

class _HomeworkConfirmedWidgetState extends State<HomeworkConfirmedWidget>
    with TickerProviderStateMixin {
  late HomeworkConfirmedModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeworkConfirmedModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
      ),
      child: Align(
        alignment: AlignmentDirectional(0.00, 0.00),
        child: Container(
          width: 592.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(32.0, 32.0, 32.0, 32.0),
            child: StreamBuilder<UsersRecord>(
              stream: UsersRecord.getDocument(currentUserReference!),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: SpinKitRipple(
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 50.0,
                      ),
                    ),
                  );
                }
                final columnUsersRecord = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Подтвердите выполнение урока',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyLargeFamily,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyLargeFamily),
                                lineHeight: 1.3,
                              ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            FFAppState().update(() {
                              FFAppState().agreeRules = 0;
                            });
                            _model.updatePage(() {
                              FFAppState().rulesOpen = false;
                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 24.0,
                            height: 24.0,
                            decoration: BoxDecoration(),
                            child: Icon(
                              FFIcons.kclose,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 12.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    RichText(
                      textScaleFactor: MediaQuery.of(context).textScaleFactor,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Все права защищены законом.\n',
                            style: FlutterFlowTheme.of(context)
                                .displayMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .displayMediumFamily,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .displayMediumFamily),
                                  lineHeight: 1.7,
                                ),
                          ),
                          TextSpan(
                            text:
                                '・Запрещено пересылать материалы в чатах или любых других ресурсах; \n',
                            style: FlutterFlowTheme.of(context)
                                .displayMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .displayMediumFamily,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .displayMediumFamily),
                                  lineHeight: 1.7,
                                ),
                          ),
                          TextSpan(
                            text:
                                '・Передавать доступ к личному кабинету 3-им лицам; \n',
                            style: FlutterFlowTheme.of(context)
                                .displayMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .displayMediumFamily,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .displayMediumFamily),
                                  lineHeight: 1.7,
                                ),
                          ),
                          TextSpan(
                            text:
                                '・Делать запись экрана; воспроизводить и распространять материалы; \n',
                            style: FlutterFlowTheme.of(context)
                                .displayMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .displayMediumFamily,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .displayMediumFamily),
                                  lineHeight: 1.7,
                                ),
                          ),
                          TextSpan(
                            text: '・Переводить на английский; \n',
                            style: FlutterFlowTheme.of(context)
                                .displayMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .displayMediumFamily,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .displayMediumFamily),
                                  lineHeight: 1.7,
                                ),
                          ),
                          TextSpan(
                            text:
                                '・Использовать в качестве контента для своих курсов и соц.сетей без явного                         \n    письменного разрешения владельца авторских прав.\n',
                            style: FlutterFlowTheme.of(context)
                                .displayMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .displayMediumFamily,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .displayMediumFamily),
                                  lineHeight: 1.7,
                                ),
                          ),
                          TextSpan(
                            text:
                                'Запрещается создавать сторонние чаты в любых мессенджерах и приглашать туда участников курса.\nЗа нарушение вышеперечисленных правил вы будете заблокированы и потеряете доступ к материалам курса без осуществления возврата денежных средств.',
                            style: FlutterFlowTheme.of(context)
                                .displayMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .displayMediumFamily,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .displayMediumFamily),
                                  lineHeight: 1.7,
                                ),
                          )
                        ],
                        style:
                            FlutterFlowTheme.of(context).displayMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .displayMediumFamily,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .displayMediumFamily),
                                  lineHeight: 1.7,
                                ),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          children: [
                            if (FFAppState().agreeRules == 0)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().update(() {
                                    FFAppState().agreeRules = 1;
                                  });
                                },
                                child: Container(
                                  width: 20.0,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(6.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            if (FFAppState().agreeRules == 1)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().update(() {
                                    FFAppState().agreeRules = 0;
                                  });
                                },
                                child: Container(
                                  width: 20.0,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Icon(
                                    Icons.check_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 17.0,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Подтверждаю, что ознакомлен(а) и согласен(а) с информацией, которая здесь написана.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 17.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                    lineHeight: 1.6,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          children: [
                            if (!(currentUserDocument?.rlFinishedLessons
                                            ?.toList() ??
                                        [])
                                    .contains(widget.lesson?.reference) &&
                                (FFAppState().agreeRules == 1))
                              AuthUserStreamWidget(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await action_blocks.lessonCompleted(
                                      context,
                                      currentLesson: widget.lesson,
                                      userDoc: columnUsersRecord,
                                      allLessonCount: widget.countLes,
                                      lessonIndex: widget.index,
                                    );
                                    _model.updatePage(() {
                                      FFAppState().rulesOpen = false;
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: wrapWithModel(
                                    model: _model.buttonModel1,
                                    updateCallback: () => setState(() {}),
                                    child: ButtonWidget(
                                      text: 'Урок пройден 👍',
                                      btnColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      txtColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      btnWidth: 228,
                                    ),
                                  ),
                                ),
                              ),
                            if ((currentUserDocument?.rlFinishedLessons
                                            ?.toList() ??
                                        [])
                                    .contains(widget.lesson?.reference) &&
                                (FFAppState().agreeRules == 1))
                              AuthUserStreamWidget(
                                builder: (context) => wrapWithModel(
                                  model: _model.buttonModel2,
                                  updateCallback: () => setState(() {}),
                                  child: ButtonWidget(
                                    text: 'Вы прошли урок 🎉',
                                    btnColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    txtColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    btnWidth: 228,
                                  ),
                                ),
                              ),
                            if (FFAppState().agreeRules == 0)
                              wrapWithModel(
                                model: _model.buttonModel3,
                                updateCallback: () => setState(() {}),
                                child: ButtonWidget(
                                  text: 'Урок пройден 👍',
                                  btnColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  txtColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  btnWidth: 228,
                                ),
                              ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().update(() {
                                FFAppState().agreeRules = 0;
                              });
                              _model.updatePage(() {
                                FFAppState().rulesOpen = false;
                              });
                              Navigator.pop(context);
                            },
                            child: wrapWithModel(
                              model: _model.buttonModel4,
                              updateCallback: () => setState(() {}),
                              child: ButtonWidget(
                                text: 'Отмена',
                                btnColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                txtColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                btnWidth: 130,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ].divide(SizedBox(height: 24.0)),
                );
              },
            ),
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
      ),
    );
  }
}
