import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_bar_widget.dart';
import '/courses/info_continue_course/info_continue_course_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'courses_model.dart';
export 'courses_model.dart';

class CoursesWidget extends StatefulWidget {
  const CoursesWidget({Key? key}) : super(key: key);

  @override
  _CoursesWidgetState createState() => _CoursesWidgetState();
}

class _CoursesWidgetState extends State<CoursesWidget>
    with TickerProviderStateMixin {
  late CoursesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
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
    _model = createModel(context, () => CoursesModel());

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
        body: StreamBuilder<UsersRecord>(
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
            final stackUsersRecord = snapshot.data!;
            return Container(
              width: double.infinity,
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.00, -1.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: FutureBuilder<List<TariffsRecord>>(
                        future: queryTariffsRecordOnce(),
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
                          List<TariffsRecord> containerTariffsRecordList =
                              snapshot.data!;
                          return Container(
                            constraints: BoxConstraints(
                              maxWidth: 1250.0,
                            ),
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: wrapWithModel(
                                    model: _model.appBarModel,
                                    updateCallback: () => setState(() {}),
                                    child: AppBarWidget(
                                      selected: 2,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 100.0,
                                          height: 16.0,
                                          decoration: BoxDecoration(),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.00, 0.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: Text(
                                              'Мои курсы',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium,
                                            ),
                                          ),
                                        ),
                                        if (((FFAppState().showContinueCourse ==
                                                    1) &&
                                                (currentUserDocument
                                                        ?.rlRecentlyCourse !=
                                                    null)) &&
                                            responsiveVisibility(
                                              context: context,
                                              tablet: false,
                                              tabletLandscape: false,
                                              desktop: false,
                                            ))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 32.0, 0.0, 16.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) =>
                                                  FutureBuilder<TariffsRecord>(
                                                future: TariffsRecord
                                                    .getDocumentOnce(
                                                        currentUserDocument!
                                                            .rlRecentlyTariff!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child: SpinKitRipple(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final containerTariffsRecord =
                                                      snapshot.data!;
                                                  return Container(
                                                    decoration: BoxDecoration(),
                                                    child: FutureBuilder<
                                                        CoursesRecord>(
                                                      future: CoursesRecord
                                                          .getDocumentOnce(
                                                              currentUserDocument!
                                                                  .rlRecentlyCourse!),
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 50.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final infoContinueCourseCoursesRecord =
                                                            snapshot.data!;
                                                        return wrapWithModel(
                                                          model: _model
                                                              .infoContinueCourseModel1,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              InfoContinueCourseWidget(
                                                            currentCourse:
                                                                infoContinueCourseCoursesRecord,
                                                            currentTariff:
                                                                containerTariffsRecord,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 32.0, 0.0, 100.0),
                                          child: FutureBuilder<
                                              List<CoursesRecord>>(
                                            future: queryCoursesRecordOnce(
                                              queryBuilder: (coursesRecord) =>
                                                  coursesRecord
                                                      .where(
                                                        'isFree',
                                                        isEqualTo: true,
                                                      )
                                                      .where(
                                                        'show',
                                                        isEqualTo: true,
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<CoursesRecord>
                                                  coursesCoursesRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final coursesCoursesRecord =
                                                  coursesCoursesRecordList
                                                          .isNotEmpty
                                                      ? coursesCoursesRecordList
                                                          .first
                                                      : null;
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.00, 0.00),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final allCourses = functions
                                                              .listFreeAndPaidCourses(
                                                                  coursesCoursesRecord!
                                                                      .reference,
                                                                  containerTariffsRecordList
                                                                      .where((e) => stackUsersRecord
                                                                          .rlBuyTariffs
                                                                          .contains(e
                                                                              .reference))
                                                                      .toList()
                                                                      .map((e) =>
                                                                          e.rlCourse)
                                                                      .withoutNulls
                                                                      .toList())
                                                              .toList();
                                                          return Wrap(
                                                            spacing: 32.0,
                                                            runSpacing: 32.0,
                                                            alignment:
                                                                WrapAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                WrapCrossAlignment
                                                                    .start,
                                                            direction:
                                                                Axis.horizontal,
                                                            runAlignment:
                                                                WrapAlignment
                                                                    .start,
                                                            verticalDirection:
                                                                VerticalDirection
                                                                    .down,
                                                            clipBehavior:
                                                                Clip.none,
                                                            children: List.generate(
                                                                allCourses
                                                                    .length,
                                                                (allCoursesIndex) {
                                                              final allCoursesItem =
                                                                  allCourses[
                                                                      allCoursesIndex];
                                                              return StreamBuilder<
                                                                  CoursesRecord>(
                                                                stream: CoursesRecord
                                                                    .getDocument(
                                                                        allCoursesItem),
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
                                                                  final courseCoursesRecord =
                                                                      snapshot
                                                                          .data!;
                                                                  return Container(
                                                                    width: () {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall) {
                                                                        return 390.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointMedium) {
                                                                        return 235.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointLarge) {
                                                                        return 280.0;
                                                                      } else {
                                                                        return 280.0;
                                                                      }
                                                                    }(),
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        if (courseCoursesRecord.isFree ==
                                                                            true) {
                                                                          context
                                                                              .pushNamed(
                                                                            'ModulesFree',
                                                                            queryParameters:
                                                                                {
                                                                              'currentCourse': serializeParam(
                                                                                courseCoursesRecord,
                                                                                ParamType.Document,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'currentCourse': courseCoursesRecord,
                                                                              kTransitionInfoKey: TransitionInfo(
                                                                                hasTransition: true,
                                                                                transitionType: PageTransitionType.fade,
                                                                                duration: Duration(milliseconds: 0),
                                                                              ),
                                                                            },
                                                                          );
                                                                        } else {
                                                                          context
                                                                              .pushNamed(
                                                                            'Modules',
                                                                            queryParameters:
                                                                                {
                                                                              'currentCourse': serializeParam(
                                                                                courseCoursesRecord,
                                                                                ParamType.Document,
                                                                              ),
                                                                              'tariffRef': serializeParam(
                                                                                containerTariffsRecordList.where((e) => (e.rlCourse == courseCoursesRecord.reference) && stackUsersRecord.rlBuyTariffs.contains(e.reference)).toList().first.reference,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'currentCourse': courseCoursesRecord,
                                                                              kTransitionInfoKey: TransitionInfo(
                                                                                hasTransition: true,
                                                                                transitionType: PageTransitionType.fade,
                                                                                duration: Duration(milliseconds: 0),
                                                                              ),
                                                                            },
                                                                          );
                                                                        }
                                                                      },
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(24.0),
                                                                            child:
                                                                                Image.network(
                                                                              courseCoursesRecord.image,
                                                                              width: double.infinity,
                                                                              height: 180.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                22.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              courseCoursesRecord.name,
                                                                              style: FlutterFlowTheme.of(context).bodyLarge,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              !courseCoursesRecord.isFree ? containerTariffsRecordList.where((e) => (e.rlCourse == courseCoursesRecord.reference) && stackUsersRecord.rlBuyTariffs.contains(e.reference)).toList().first.name : 'Бесплатный',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).accent1,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                6.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                FaIcon(
                                                                                  FontAwesomeIcons.clock,
                                                                                  color: FlutterFlowTheme.of(context).accent1,
                                                                                  size: 20.0,
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 2.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    courseCoursesRecord.countLessonsString,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).accent1,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }),
                                                          );
                                                        },
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
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                  ))
                    Align(
                      alignment: AlignmentDirectional(1.00, 1.00),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if ((FFAppState().showContinueCourse == 1) &&
                              (currentUserDocument?.rlRecentlyCourse != null))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 40.0, 40.0),
                              child: AuthUserStreamWidget(
                                builder: (context) =>
                                    FutureBuilder<CoursesRecord>(
                                  future: CoursesRecord.getDocumentOnce(
                                      currentUserDocument!.rlRecentlyCourse!),
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
                                    final rowCoursesRecord = snapshot.data!;
                                    return Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        FutureBuilder<TariffsRecord>(
                                          future: TariffsRecord.getDocumentOnce(
                                              currentUserDocument!
                                                  .rlRecentlyTariff!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: SpinKitRipple(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            final infoContinueCourseTariffsRecord =
                                                snapshot.data!;
                                            return wrapWithModel(
                                              model: _model
                                                  .infoContinueCourseModel2,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: InfoContinueCourseWidget(
                                                currentCourse: rowCoursesRecord,
                                                currentTariff:
                                                    infoContinueCourseTariffsRecord,
                                              ),
                                            );
                                          },
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: FutureBuilder<
                                              List<CourseTeacherRecord>>(
                                            future:
                                                queryCourseTeacherRecordOnce(
                                              queryBuilder:
                                                  (courseTeacherRecord) =>
                                                      courseTeacherRecord.where(
                                                'name',
                                                isEqualTo: rowCoursesRecord
                                                    .teacherString,
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                  circleImageCourseTeacherRecord!
                                                      .image,
                                                  fit: BoxFit.cover,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ).animateOnPageLoad(animationsMap[
                                        'rowOnPageLoadAnimation']!);
                                  },
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
