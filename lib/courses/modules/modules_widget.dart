import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_bar_widget.dart';
import '/components/button_widget.dart';
import '/courses/info_course_comp_mobile/info_course_comp_mobile_widget.dart';
import '/courses/info_course_completed/info_course_completed_widget.dart';
import '/courses/les_mobile/les_mobile_widget.dart';
import '/courses/lesson_container/lesson_container_widget.dart';
import '/courses/module_item/module_item_widget.dart';
import '/courses/mood_mobile/mood_mobile_widget.dart';
import '/courses/tariff_change/tariff_change_widget.dart';
import '/courses/tariff_change_mobile/tariff_change_mobile_widget.dart';
import '/courses/tariff_close/tariff_close_widget.dart';
import '/courses/tariff_close_mobile/tariff_close_mobile_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'modules_model.dart';
export 'modules_model.dart';

class ModulesWidget extends StatefulWidget {
  const ModulesWidget({
    Key? key,
    this.currentCourse,
    this.tariffRef,
  }) : super(key: key);

  final CoursesRecord? currentCourse;
  final DocumentReference? tariffRef;

  @override
  _ModulesWidgetState createState() => _ModulesWidgetState();
}

class _ModulesWidgetState extends State<ModulesWidget>
    with TickerProviderStateMixin {
  late ModulesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'infoCourseCompMobileOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'infoCourseCompMobileOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
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
  void initState() {
    super.initState();
    _model = createModel(context, () => ModulesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((currentUserDocument?.rlBuyTariffs?.toList() ?? [])
          .contains(widget.tariffRef)) {
        await currentUserReference!.update(createUsersRecordData(
          rlRecentlyCourse: widget.currentCourse?.reference,
          rlRecentlyTariff: widget.tariffRef,
        ));
        FFAppState().update(() {
          FFAppState().showContinueCourse = 1;
        });
        _model.countLessonsWithHomework = await queryLessonsRecordCount(
          parent: widget.currentCourse?.reference,
          queryBuilder: (lessonsRecord) => lessonsRecord
              .where(
                'with_homework',
                isEqualTo: true,
              )
              .where(
                'rl_tariff',
                arrayContains: widget.tariffRef,
              ),
        );
        if (_model.countLessonsWithHomework! > 0) {
          _model.allLessonsWithHomework = await queryLessonsRecordOnce(
            parent: widget.currentCourse?.reference,
            queryBuilder: (lessonsRecord) => lessonsRecord
                .where(
                  'with_homework',
                  isEqualTo: true,
                )
                .where(
                  'rl_usersPassHomework',
                  arrayContains: currentUserReference,
                ),
          );
          if (_model.countLessonsWithHomework ==
              _model.allLessonsWithHomework?.length) {
            setState(() {
              _model.showSert = true;
            });
          } else {
            _model.countLessonWithPhoto = await queryLessonsRecordCount(
              parent: widget.currentCourse?.reference,
              queryBuilder: (lessonsRecord) => lessonsRecord
                  .where(
                    'with_photo_homework',
                    isEqualTo: true,
                  )
                  .where(
                    'rl_tariff',
                    arrayContains: widget.tariffRef,
                  ),
            );
            if (_model.countLessonWithPhoto! > 0) {
              _model.allLessonsWithPhoto = await queryLessonsRecordOnce(
                parent: widget.currentCourse?.reference,
                queryBuilder: (lessonsRecord) => lessonsRecord
                    .where(
                      'with_photo_homework',
                      isEqualTo: true,
                    )
                    .where(
                      'rl_usersPassHomework',
                      arrayContains: currentUserReference,
                    ),
              );
              if (_model.countLessonWithPhoto ==
                  _model.allLessonsWithPhoto?.length) {
                setState(() {
                  _model.showSert = true;
                });
              } else {
                return;
              }
            } else {
              return;
            }
          }
        } else {
          _model.countLessonWithPhoto2 = await queryLessonsRecordCount(
            parent: widget.currentCourse?.reference,
            queryBuilder: (lessonsRecord) => lessonsRecord
                .where(
                  'with_photo_homework',
                  isEqualTo: true,
                )
                .where(
                  'rl_tariff',
                  arrayContains: widget.tariffRef,
                ),
          );
          if (_model.countLessonWithPhoto2! > 0) {
            _model.allLessonsWithPhoto2 = await queryLessonsRecordOnce(
              parent: widget.currentCourse?.reference,
              queryBuilder: (lessonsRecord) => lessonsRecord
                  .where(
                    'with_photo_homework',
                    isEqualTo: true,
                  )
                  .where(
                    'rl_usersPassHomework',
                    arrayContains: currentUserReference,
                  ),
            );
            if (_model.countLessonWithPhoto2 ==
                _model.allLessonsWithPhoto2?.length) {
              setState(() {
                _model.showSert = true;
              });
            } else {
              return;
            }
          } else {
            return;
          }
        }
      } else {
        context.pushNamed('Courses_Old');

        return;
      }
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
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.00, -1.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Container(
                  width: 1250.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: StreamBuilder<UsersRecord>(
                          stream:
                              UsersRecord.getDocument(currentUserReference!),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitRipple(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            final stackUsersRecord = snapshot.data!;
                            return Stack(
                              children: [
                                if (widget.currentCourse?.isWithModules ?? true)
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 100.0,
                                          height: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return 50.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return 92.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return 92.0;
                                            } else {
                                              return 92.0;
                                            }
                                          }(),
                                          decoration: BoxDecoration(),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.00, 0.00),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.safePop();
                                                },
                                                child: Container(
                                                  width: 24.0,
                                                  height: 24.0,
                                                  decoration: BoxDecoration(),
                                                  child: Icon(
                                                    FFIcons.kleftTo,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 16.0,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    widget.currentCourse!.name,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium,
                                                  ),
                                                ),
                                              ),
                                              if (_model.showSert &&
                                                  responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                  ))
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.pdfTablet =
                                                        await actions.createPdf(
                                                      context,
                                                      '${currentUserDisplayName} ${valueOrDefault(currentUserDocument?.surname, '')}',
                                                      getCurrentTimestamp
                                                          .toString(),
                                                      widget
                                                          .currentCourse!.name,
                                                    );

                                                    setState(() {});
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model.buttonModel1,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: ButtonWidget(
                                                      text:
                                                          'Скачать сертификат 🔖',
                                                      btnColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      txtColor: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      btnWidth: 265,
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                        ))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 24.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.00, 0.00),
                                                    child: Container(
                                                      width: 1900.0,
                                                      height: 20.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.00, 0.00),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              phone: false,
                                                              tablet: false,
                                                              tabletLandscape:
                                                                  false,
                                                            ))
                                                              Expanded(
                                                                flex: 6,
                                                                child: Text(
                                                                  'Выберите модуль',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium,
                                                                ),
                                                              ),
                                                            if (_model
                                                                    .currentModule !=
                                                                null)
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.00,
                                                                        0.00),
                                                                child: FutureBuilder<
                                                                    List<
                                                                        LessonsRecord>>(
                                                                  future:
                                                                      queryLessonsRecordOnce(
                                                                    parent: widget
                                                                        .currentCourse
                                                                        ?.reference,
                                                                    queryBuilder: (lessonsRecord) =>
                                                                        lessonsRecord
                                                                            .where(
                                                                              'rl_modules',
                                                                              isEqualTo: _model.currentModule?.reference,
                                                                            )
                                                                            .orderBy('index'),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitRipple(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<LessonsRecord>
                                                                        lessonsCompleteLessonsRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    return Text(
                                                                      'Пройдено ${lessonsCompleteLessonsRecordList.where((e) => stackUsersRecord.rlFinishedLessons.contains(e.reference)).toList().length.toString()} из ${lessonsCompleteLessonsRecordList.length.toString()} уроков',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent1,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          desktop: false,
                                        ))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 30.0, 0.0, 0.0),
                                            child: FutureBuilder<
                                                List<ModulesRecord>>(
                                              future: queryModulesRecordOnce(
                                                parent: widget
                                                    .currentCourse?.reference,
                                                queryBuilder: (modulesRecord) =>
                                                    modulesRecord
                                                        .orderBy('index'),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child: SpinKitRipple(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<ModulesRecord>
                                                    modulesListPadModulesRecordList =
                                                    snapshot.data!;
                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: List.generate(
                                                        modulesListPadModulesRecordList
                                                            .length,
                                                        (modulesListPadIndex) {
                                                      final modulesListPadModulesRecord =
                                                          modulesListPadModulesRecordList[
                                                              modulesListPadIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          setState(() {
                                                            _model.currentModule =
                                                                modulesListPadModulesRecord;
                                                          });
                                                        },
                                                        child: ModuleItemWidget(
                                                          key: Key(
                                                              'Keyfso_${modulesListPadIndex}_of_${modulesListPadModulesRecordList.length}'),
                                                          activeModule: (_model
                                                                          .currentModule !=
                                                                      null) &&
                                                                  (_model.currentModule
                                                                          ?.reference ==
                                                                      modulesListPadModulesRecord
                                                                          .reference)
                                                              ? 1
                                                              : 0,
                                                          currentModule:
                                                              modulesListPadModulesRecord,
                                                          userDoc:
                                                              stackUsersRecord,
                                                        ),
                                                      );
                                                    }).divide(
                                                        SizedBox(width: 16.0)),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                        ))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 24.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                  tabletLandscape: false,
                                                ))
                                                  Expanded(
                                                    flex: 1,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  48.0,
                                                                  0.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.00,
                                                                      -1.00),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        100.0),
                                                                child: FutureBuilder<
                                                                    List<
                                                                        ModulesRecord>>(
                                                                  future:
                                                                      queryModulesRecordOnce(
                                                                    parent: widget
                                                                        .currentCourse
                                                                        ?.reference,
                                                                    queryBuilder:
                                                                        (modulesRecord) =>
                                                                            modulesRecord.orderBy('index'),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitRipple(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<ModulesRecord>
                                                                        columnModulesRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: List.generate(
                                                                          columnModulesRecordList
                                                                              .length,
                                                                          (columnIndex) {
                                                                        final columnModulesRecord =
                                                                            columnModulesRecordList[columnIndex];
                                                                        return InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            setState(() {
                                                                              _model.currentModule = columnModulesRecord;
                                                                            });
                                                                          },
                                                                          child:
                                                                              ModuleItemWidget(
                                                                            key:
                                                                                Key('Keyrgi_${columnIndex}_of_${columnModulesRecordList.length}'),
                                                                            activeModule: (_model.currentModule != null) && (_model.currentModule?.reference == columnModulesRecord.reference)
                                                                                ? 1
                                                                                : 0,
                                                                            currentModule:
                                                                                columnModulesRecord,
                                                                            userDoc:
                                                                                stackUsersRecord,
                                                                          ),
                                                                        );
                                                                      }).divide(SizedBox(height: 16.0)).addToEnd(SizedBox(
                                                                          height:
                                                                              112.0)),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.00, 0.00),
                                                        child: Container(
                                                          width: 1000.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Visibility(
                                                            visible: _model
                                                                    .currentModule !=
                                                                null,
                                                            child: FutureBuilder<
                                                                List<
                                                                    LessonsRecord>>(
                                                              future:
                                                                  queryLessonsRecordOnce(
                                                                parent: widget
                                                                    .currentCourse
                                                                    ?.reference,
                                                                queryBuilder: (lessonsRecord) =>
                                                                    lessonsRecord
                                                                        .where(
                                                                          'rl_modules',
                                                                          isEqualTo: _model
                                                                              .currentModule
                                                                              ?.reference,
                                                                        )
                                                                        .orderBy(
                                                                            'index'),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          SpinKitRipple(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            50.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<LessonsRecord>
                                                                    containerLessonsRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                return Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            100.0),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final allLesWithModule =
                                                                                containerLessonsRecordList.toList();
                                                                            return GridView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                                crossAxisCount: 2,
                                                                                crossAxisSpacing: 24.0,
                                                                                mainAxisSpacing: 24.0,
                                                                                childAspectRatio: () {
                                                                                  if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                    return 1.0;
                                                                                  } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                    return 1.16;
                                                                                  } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                    return 1.59;
                                                                                  } else {
                                                                                    return 1.59;
                                                                                  }
                                                                                }(),
                                                                              ),
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: allLesWithModule.length,
                                                                              itemBuilder: (context, allLesWithModuleIndex) {
                                                                                final allLesWithModuleItem = allLesWithModule[allLesWithModuleIndex];
                                                                                return Stack(
                                                                                  children: [
                                                                                    if (allLesWithModuleItem.rlTariff.contains(widget.tariffRef) || (currentUserDocument?.rlBonusLessons?.toList() ?? []).contains(allLesWithModuleItem.reference))
                                                                                      AuthUserStreamWidget(
                                                                                        builder: (context) => Stack(
                                                                                          children: [
                                                                                            if (valueOrDefault<bool>(
                                                                                              (allLesWithModuleItem.openDate == null) || (allLesWithModuleItem.openDate! < getCurrentTimestamp),
                                                                                              true,
                                                                                            ))
                                                                                              InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  await action_blocks.navigationForOpenLesson(
                                                                                                    context,
                                                                                                    lessonIndexInList: allLesWithModuleIndex,
                                                                                                    currentLesson: allLesWithModuleItem,
                                                                                                    userDoc: stackUsersRecord,
                                                                                                    countLessons: containerLessonsRecordList.length,
                                                                                                    tariff: widget.tariffRef,
                                                                                                  );
                                                                                                },
                                                                                                child: LessonContainerWidget(
                                                                                                  key: Key('Keyy0t_${allLesWithModuleIndex}_of_${allLesWithModule.length}'),
                                                                                                  currentState: 0,
                                                                                                  currentLesson: allLesWithModuleItem,
                                                                                                  userDoc: stackUsersRecord,
                                                                                                  isFree: widget.currentCourse!.isFree,
                                                                                                ),
                                                                                              ),
                                                                                            if (valueOrDefault<bool>(
                                                                                              (allLesWithModuleItem.openDate != null) && (allLesWithModuleItem.openDate! > getCurrentTimestamp),
                                                                                              false,
                                                                                            ))
                                                                                              Builder(
                                                                                                builder: (context) => InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    await showAlignedDialog(
                                                                                                      barrierDismissible: false,
                                                                                                      context: context,
                                                                                                      isGlobal: true,
                                                                                                      avoidOverflow: false,
                                                                                                      targetAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                      followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                      builder: (dialogContext) {
                                                                                                        return Material(
                                                                                                          color: Colors.transparent,
                                                                                                          child: WebViewAware(
                                                                                                              child: GestureDetector(
                                                                                                            onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                            child: TariffCloseWidget(),
                                                                                                          )),
                                                                                                        );
                                                                                                      },
                                                                                                    ).then((value) => setState(() {}));
                                                                                                  },
                                                                                                  child: LessonContainerWidget(
                                                                                                    key: Key('Keyfby_${allLesWithModuleIndex}_of_${allLesWithModule.length}'),
                                                                                                    currentState: 1,
                                                                                                    currentLesson: allLesWithModuleItem,
                                                                                                    userDoc: stackUsersRecord,
                                                                                                    isFree: widget.currentCourse!.isFree,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    if (!(allLesWithModuleItem.rlTariff.contains(widget.tariffRef) || (currentUserDocument?.rlBonusLessons?.toList() ?? []).contains(allLesWithModuleItem.reference)))
                                                                                      Builder(
                                                                                        builder: (context) => AuthUserStreamWidget(
                                                                                          builder: (context) => InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              await showAlignedDialog(
                                                                                                barrierDismissible: false,
                                                                                                context: context,
                                                                                                isGlobal: true,
                                                                                                avoidOverflow: false,
                                                                                                targetAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                builder: (dialogContext) {
                                                                                                  return Material(
                                                                                                    color: Colors.transparent,
                                                                                                    child: WebViewAware(
                                                                                                        child: GestureDetector(
                                                                                                      onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                      child: TariffChangeWidget(),
                                                                                                    )),
                                                                                                  );
                                                                                                },
                                                                                              ).then((value) => setState(() {}));
                                                                                            },
                                                                                            child: LessonContainerWidget(
                                                                                              key: Key('Keym9u_${allLesWithModuleIndex}_of_${allLesWithModule.length}'),
                                                                                              currentState: 2,
                                                                                              currentLesson: allLesWithModuleItem,
                                                                                              userDoc: stackUsersRecord,
                                                                                              isFree: widget.currentCourse!.isFree,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].addToStart(
                                                        SizedBox(height: 1.0)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          tablet: false,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (_model.showSert)
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await action_blocks.cert(
                                                        context,
                                                        course: widget
                                                            .currentCourse,
                                                      );
                                                    },
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .infoCourseCompMobileModel1,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          InfoCourseCompMobileWidget(
                                                        currentCourse: widget
                                                            .currentCourse,
                                                      ),
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'infoCourseCompMobileOnPageLoadAnimation1']!),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: FutureBuilder<
                                                      List<ModulesRecord>>(
                                                    future:
                                                        queryModulesRecordOnce(
                                                      parent: widget
                                                          .currentCourse
                                                          ?.reference,
                                                      queryBuilder:
                                                          (modulesRecord) =>
                                                              modulesRecord
                                                                  .orderBy(
                                                                      'index'),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                SpinKitRipple(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<ModulesRecord>
                                                          modulesMobileModulesRecordList =
                                                          snapshot.data!;
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: List.generate(
                                                            modulesMobileModulesRecordList
                                                                .length,
                                                            (modulesMobileIndex) {
                                                          final modulesMobileModulesRecord =
                                                              modulesMobileModulesRecordList[
                                                                  modulesMobileIndex];
                                                          return MoodMobileWidget(
                                                            key: Key(
                                                                'Key6cs_${modulesMobileIndex}_of_${modulesMobileModulesRecordList.length}'),
                                                            currentModule:
                                                                modulesMobileModulesRecord,
                                                            userDoc:
                                                                stackUsersRecord,
                                                            currentCourse: widget
                                                                .currentCourse,
                                                            courseTariff: widget
                                                                .tariffRef,
                                                          );
                                                        }).divide(SizedBox(
                                                            height: 16.0)),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ]
                                                  .addToStart(
                                                      SizedBox(height: 16.0))
                                                  .addToEnd(
                                                      SizedBox(height: 80.0)),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                if (!widget.currentCourse!.isWithModules)
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 100.0,
                                          height: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return 50.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return 92.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return 92.0;
                                            } else {
                                              return 92.0;
                                            }
                                          }(),
                                          decoration: BoxDecoration(),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.00, 0.00),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.safePop();
                                                },
                                                child: Container(
                                                  width: 24.0,
                                                  height: 24.0,
                                                  decoration: BoxDecoration(),
                                                  child: Icon(
                                                    FFIcons.kleftTo,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 16.0,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    widget.currentCourse!.name,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium,
                                                  ),
                                                ),
                                              ),
                                              if (_model.showSert &&
                                                  responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                  ))
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.pdfTabletNew =
                                                        await actions.createPdf(
                                                      context,
                                                      '${currentUserDisplayName} ${valueOrDefault(currentUserDocument?.surname, '')}',
                                                      getCurrentTimestamp
                                                          .toString(),
                                                      widget
                                                          .currentCourse!.name,
                                                    );

                                                    setState(() {});
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model.buttonModel2,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: ButtonWidget(
                                                      text:
                                                          'Скачать сертификат 🔖',
                                                      btnColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      txtColor: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      btnWidth: 256,
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              if (responsiveVisibility(
                                                context: context,
                                                phone: false,
                                              ))
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.00, 0.00),
                                                    child: Container(
                                                      width: 1900.0,
                                                      height: 20.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.00, 0.00),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              phone: false,
                                                              tablet: false,
                                                              tabletLandscape:
                                                                  false,
                                                            ))
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  width: 40.0,
                                                                  height: 5.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                ),
                                                              ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.00,
                                                                      0.00),
                                                              child: FutureBuilder<
                                                                  List<
                                                                      LessonsRecord>>(
                                                                future:
                                                                    queryLessonsRecordOnce(
                                                                  parent: widget
                                                                      .currentCourse
                                                                      ?.reference,
                                                                  queryBuilder:
                                                                      (lessonsRecord) =>
                                                                          lessonsRecord
                                                                              .orderBy('index'),
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            SpinKitRipple(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<LessonsRecord>
                                                                      lessonsCompleteLessonsRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  return Text(
                                                                    'Пройдено ${lessonsCompleteLessonsRecordList.where((e) => stackUsersRecord.rlFinishedLessons.contains(e.reference)).toList().length.toString()} из ${lessonsCompleteLessonsRecordList.length.toString()} уроков',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent1,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                        ))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.00, 0.00),
                                                          child: FutureBuilder<
                                                              List<
                                                                  LessonsRecord>>(
                                                            future:
                                                                queryLessonsRecordOnce(
                                                              parent: widget
                                                                  .currentCourse
                                                                  ?.reference,
                                                              queryBuilder: (lessonsRecord) =>
                                                                  lessonsRecord
                                                                      .orderBy(
                                                                          'index'),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        SpinKitRipple(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          50.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<LessonsRecord>
                                                                  containerLessonsRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              return Container(
                                                                width: 1000.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          100.0),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final allLessonsWithoutModule =
                                                                              containerLessonsRecordList.toList();
                                                                          return GridView
                                                                              .builder(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            gridDelegate:
                                                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                                              crossAxisCount: 2,
                                                                              crossAxisSpacing: 24.0,
                                                                              mainAxisSpacing: 24.0,
                                                                              childAspectRatio: () {
                                                                                if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                  return 1.0;
                                                                                } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                  return 1.16;
                                                                                } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                  return 1.59;
                                                                                } else {
                                                                                  return 1.59;
                                                                                }
                                                                              }(),
                                                                            ),
                                                                            primary:
                                                                                false,
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                allLessonsWithoutModule.length,
                                                                            itemBuilder:
                                                                                (context, allLessonsWithoutModuleIndex) {
                                                                              final allLessonsWithoutModuleItem = allLessonsWithoutModule[allLessonsWithoutModuleIndex];
                                                                              return Stack(
                                                                                children: [
                                                                                  if (allLessonsWithoutModuleItem.rlTariff.contains(widget.tariffRef) || (currentUserDocument?.rlBonusLessons?.toList() ?? []).contains(allLessonsWithoutModuleItem.reference))
                                                                                    AuthUserStreamWidget(
                                                                                      builder: (context) => Stack(
                                                                                        children: [
                                                                                          if (valueOrDefault<bool>(
                                                                                            (allLessonsWithoutModuleItem.openDate == null) || (allLessonsWithoutModuleItem.openDate! < getCurrentTimestamp),
                                                                                            true,
                                                                                          ))
                                                                                            InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                await action_blocks.navigationForOpenLesson(
                                                                                                  context,
                                                                                                  lessonIndexInList: allLessonsWithoutModuleIndex,
                                                                                                  currentLesson: allLessonsWithoutModuleItem,
                                                                                                  userDoc: stackUsersRecord,
                                                                                                  countLessons: 0,
                                                                                                  tariff: widget.tariffRef,
                                                                                                );
                                                                                              },
                                                                                              child: LessonContainerWidget(
                                                                                                key: Key('Keyqpg_${allLessonsWithoutModuleIndex}_of_${allLessonsWithoutModule.length}'),
                                                                                                currentState: 0,
                                                                                                currentLesson: allLessonsWithoutModuleItem,
                                                                                                userDoc: stackUsersRecord,
                                                                                                isFree: widget.currentCourse!.isFree,
                                                                                              ),
                                                                                            ),
                                                                                          if (valueOrDefault<bool>(
                                                                                            (allLessonsWithoutModuleItem.openDate != null) && (allLessonsWithoutModuleItem.openDate! > getCurrentTimestamp),
                                                                                            false,
                                                                                          ))
                                                                                            Builder(
                                                                                              builder: (context) => InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  await showAlignedDialog(
                                                                                                    barrierDismissible: false,
                                                                                                    context: context,
                                                                                                    isGlobal: true,
                                                                                                    avoidOverflow: false,
                                                                                                    targetAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                    followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                    builder: (dialogContext) {
                                                                                                      return Material(
                                                                                                        color: Colors.transparent,
                                                                                                        child: WebViewAware(
                                                                                                            child: GestureDetector(
                                                                                                          onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                          child: TariffCloseWidget(),
                                                                                                        )),
                                                                                                      );
                                                                                                    },
                                                                                                  ).then((value) => setState(() {}));
                                                                                                },
                                                                                                child: LessonContainerWidget(
                                                                                                  key: Key('Key06k_${allLessonsWithoutModuleIndex}_of_${allLessonsWithoutModule.length}'),
                                                                                                  currentState: 1,
                                                                                                  currentLesson: allLessonsWithoutModuleItem,
                                                                                                  userDoc: stackUsersRecord,
                                                                                                  isFree: widget.currentCourse!.isFree,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  if (!(allLessonsWithoutModuleItem.rlTariff.contains(widget.tariffRef) || (currentUserDocument?.rlBonusLessons?.toList() ?? []).contains(allLessonsWithoutModuleItem.reference)))
                                                                                    Builder(
                                                                                      builder: (context) => AuthUserStreamWidget(
                                                                                        builder: (context) => InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            await showAlignedDialog(
                                                                                              barrierDismissible: false,
                                                                                              context: context,
                                                                                              isGlobal: true,
                                                                                              avoidOverflow: false,
                                                                                              targetAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                              followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                              builder: (dialogContext) {
                                                                                                return Material(
                                                                                                  color: Colors.transparent,
                                                                                                  child: WebViewAware(
                                                                                                      child: GestureDetector(
                                                                                                    onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                    child: TariffChangeWidget(),
                                                                                                  )),
                                                                                                );
                                                                                              },
                                                                                            ).then((value) => setState(() {}));
                                                                                          },
                                                                                          child: LessonContainerWidget(
                                                                                            key: Key('Keyvc0_${allLessonsWithoutModuleIndex}_of_${allLessonsWithoutModule.length}'),
                                                                                            currentState: 2,
                                                                                            currentLesson: allLessonsWithoutModuleItem,
                                                                                            userDoc: stackUsersRecord,
                                                                                            isFree: widget.currentCourse!.isFree,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ].addToStart(SizedBox(
                                                          height: 1.0)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          tablet: false,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          FutureBuilder<List<LessonsRecord>>(
                                            future: queryLessonsRecordOnce(
                                              parent: widget
                                                  .currentCourse?.reference,
                                              queryBuilder: (lessonsRecord) =>
                                                  lessonsRecord
                                                      .orderBy('index'),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child: SpinKitRipple(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<LessonsRecord>
                                                  modulesLessonsMobileLessonsRecordList =
                                                  snapshot.data!;
                                              return Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    if (_model.showSert)
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          _model.pdfMobile =
                                                              await actions
                                                                  .createPdf(
                                                            context,
                                                            '${currentUserDisplayName} ${valueOrDefault(currentUserDocument?.surname, '')}',
                                                            getCurrentTimestamp
                                                                .toString(),
                                                            widget
                                                                .currentCourse!
                                                                .name,
                                                          );

                                                          setState(() {});
                                                        },
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .infoCourseCompMobileModel2,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              InfoCourseCompMobileWidget(
                                                            currentCourse: widget
                                                                .currentCourse,
                                                          ),
                                                        ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'infoCourseCompMobileOnPageLoadAnimation2']!),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final allLessonWithoutModuleMobile =
                                                              modulesLessonsMobileLessonsRecordList
                                                                  .toList();
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: List.generate(
                                                                allLessonWithoutModuleMobile
                                                                    .length,
                                                                (allLessonWithoutModuleMobileIndex) {
                                                              final allLessonWithoutModuleMobileItem =
                                                                  allLessonWithoutModuleMobile[
                                                                      allLessonWithoutModuleMobileIndex];
                                                              return Stack(
                                                                children: [
                                                                  if (allLessonWithoutModuleMobileItem
                                                                          .rlTariff
                                                                          .contains(widget
                                                                              .tariffRef) ||
                                                                      (currentUserDocument?.rlBonusLessons?.toList() ??
                                                                              [])
                                                                          .contains(
                                                                              allLessonWithoutModuleMobileItem.reference))
                                                                    AuthUserStreamWidget(
                                                                      builder:
                                                                          (context) =>
                                                                              Stack(
                                                                        children: [
                                                                          if (valueOrDefault<
                                                                              bool>(
                                                                            (allLessonWithoutModuleMobileItem.openDate == null) ||
                                                                                (allLessonWithoutModuleMobileItem.openDate! < getCurrentTimestamp),
                                                                            true,
                                                                          ))
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await action_blocks.navigationForOpenLesson(
                                                                                  context,
                                                                                  lessonIndexInList: allLessonWithoutModuleMobileIndex,
                                                                                  currentLesson: allLessonWithoutModuleMobileItem,
                                                                                  userDoc: stackUsersRecord,
                                                                                  countLessons: 0,
                                                                                  tariff: widget.tariffRef,
                                                                                );
                                                                              },
                                                                              child: LesMobileWidget(
                                                                                key: Key('Keyndq_${allLessonWithoutModuleMobileIndex}_of_${allLessonWithoutModuleMobile.length}'),
                                                                                currentState: 0,
                                                                                userDoc: stackUsersRecord,
                                                                                currentLesson: allLessonWithoutModuleMobileItem,
                                                                                index: allLessonWithoutModuleMobileIndex,
                                                                                countLessons: modulesLessonsMobileLessonsRecordList.length,
                                                                                isFree: widget.currentCourse!.isFree,
                                                                              ),
                                                                            ),
                                                                          if (valueOrDefault<
                                                                              bool>(
                                                                            (allLessonWithoutModuleMobileItem.openDate != null) &&
                                                                                (allLessonWithoutModuleMobileItem.openDate! > getCurrentTimestamp),
                                                                            false,
                                                                          ))
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  isDismissible: false,
                                                                                  enableDrag: false,
                                                                                  useSafeArea: true,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return WebViewAware(
                                                                                        child: GestureDetector(
                                                                                      onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                      child: Padding(
                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                        child: TariffCloseMobileWidget(),
                                                                                      ),
                                                                                    ));
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));
                                                                              },
                                                                              child: LesMobileWidget(
                                                                                key: Key('Keyqfy_${allLessonWithoutModuleMobileIndex}_of_${allLessonWithoutModuleMobile.length}'),
                                                                                currentState: 1,
                                                                                userDoc: stackUsersRecord,
                                                                                currentLesson: allLessonWithoutModuleMobileItem,
                                                                                index: allLessonWithoutModuleMobileIndex,
                                                                                countLessons: modulesLessonsMobileLessonsRecordList.length,
                                                                                isFree: widget.currentCourse!.isFree,
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  if (!(allLessonWithoutModuleMobileItem
                                                                          .rlTariff
                                                                          .contains(widget
                                                                              .tariffRef) ||
                                                                      (currentUserDocument?.rlBonusLessons?.toList() ??
                                                                              [])
                                                                          .contains(
                                                                              allLessonWithoutModuleMobileItem.reference)))
                                                                    AuthUserStreamWidget(
                                                                      builder:
                                                                          (context) =>
                                                                              InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            isDismissible:
                                                                                false,
                                                                            enableDrag:
                                                                                false,
                                                                            useSafeArea:
                                                                                true,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return WebViewAware(
                                                                                  child: GestureDetector(
                                                                                onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: TariffChangeMobileWidget(),
                                                                                ),
                                                                              ));
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        },
                                                                        child:
                                                                            LesMobileWidget(
                                                                          key: Key(
                                                                              'Keyjke_${allLessonWithoutModuleMobileIndex}_of_${allLessonWithoutModuleMobile.length}'),
                                                                          currentState:
                                                                              2,
                                                                          userDoc:
                                                                              stackUsersRecord,
                                                                          currentLesson:
                                                                              allLessonWithoutModuleMobileItem,
                                                                          index:
                                                                              allLessonWithoutModuleMobileIndex,
                                                                          countLessons:
                                                                              modulesLessonsMobileLessonsRecordList.length,
                                                                          isFree: widget
                                                                              .currentCourse!
                                                                              .isFree,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              );
                                                            }).divide(SizedBox(
                                                                height: 16.0)),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ]
                                                      .addToStart(SizedBox(
                                                          height: 20.0))
                                                      .addToEnd(SizedBox(
                                                          height: 80.0)),
                                                ),
                                              );
                                            },
                                          ),
                                      ],
                                    ),
                                  ),
                                Align(
                                  alignment: AlignmentDirectional(0.00, -1.00),
                                  child: wrapWithModel(
                                    model: _model.appBarModel,
                                    updateCallback: () => setState(() {}),
                                    child: AppBarWidget(
                                      selected: 2,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (_model.showSert &&
                responsiveVisibility(
                  context: context,
                  phone: false,
                ))
              Align(
                alignment: AlignmentDirectional(1.00, 1.00),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 40.0, 40.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          wrapWithModel(
                            model: _model.infoCourseCompletedModel,
                            updateCallback: () => setState(() {}),
                            child: InfoCourseCompletedWidget(),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: FutureBuilder<List<CourseTeacherRecord>>(
                              future: queryCourseTeacherRecordOnce(
                                queryBuilder: (courseTeacherRecord) =>
                                    courseTeacherRecord.where(
                                  'name',
                                  isEqualTo:
                                      widget.currentCourse?.teacherString,
                                ),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitRipple(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<CourseTeacherRecord>
                                    circleImageCourseTeacherRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final circleImageCourseTeacherRecord =
                                    circleImageCourseTeacherRecordList
                                            .isNotEmpty
                                        ? circleImageCourseTeacherRecordList
                                            .first
                                        : null;
                                return Container(
                                  width: 40.0,
                                  height: 40.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    circleImageCourseTeacherRecord!.image,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ).animateOnPageLoad(
                    animationsMap['columnOnPageLoadAnimation']!),
              ),
          ],
        ),
      ),
    );
  }
}
