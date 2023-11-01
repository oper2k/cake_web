import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_bar_widget.dart';
import '/courses/les_mobile/les_mobile_widget.dart';
import '/courses/lesson_container/lesson_container_widget.dart';
import '/courses/module_item/module_item_widget.dart';
import '/courses/mood_mobile/mood_mobile_widget.dart';
import '/courses/tariff_close/tariff_close_widget.dart';
import '/courses/tariff_close_mobile/tariff_close_mobile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modules_free_model.dart';
export 'modules_free_model.dart';

class ModulesFreeWidget extends StatefulWidget {
  const ModulesFreeWidget({
    Key? key,
    this.currentCourse,
  }) : super(key: key);

  final CoursesRecord? currentCourse;

  @override
  _ModulesFreeWidgetState createState() => _ModulesFreeWidgetState();
}

class _ModulesFreeWidgetState extends State<ModulesFreeWidget> {
  late ModulesFreeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModulesFreeModel());

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
        body: Align(
          alignment: AlignmentDirectional(0.00, -1.00),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 1250.0,
              ),
              decoration: BoxDecoration(),
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
                  final stackUsersRecord = snapshot.data!;
                  return Stack(
                    children: [
                      if (widget.currentCourse?.isWithModules ?? true)
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 100.0,
                                height: () {
                                  if (MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall) {
                                    return 50.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointMedium) {
                                    return 92.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointLarge) {
                                    return 92.0;
                                  } else {
                                    return 92.0;
                                  }
                                }(),
                                decoration: BoxDecoration(),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.safePop();
                                      },
                                      child: Container(
                                        width: 24.0,
                                        height: 24.0,
                                        decoration: BoxDecoration(),
                                        child: Icon(
                                          FFIcons.kleftTo,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 16.0,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          widget.currentCourse!.name,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.00, 0.00),
                                          child: Container(
                                            width: 1900.0,
                                            height: 20.0,
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.00, 0.00),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                    tabletLandscape: false,
                                                  ))
                                                    Expanded(
                                                      flex: 6,
                                                      child: Text(
                                                        'Выберите модуль',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                      ),
                                                    ),
                                                  if (_model.currentModule !=
                                                      null)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.00, 0.00),
                                                      child: FutureBuilder<
                                                          List<LessonsRecord>>(
                                                        future:
                                                            queryLessonsRecordOnce(
                                                          parent: widget
                                                              .currentCourse
                                                              ?.reference,
                                                          queryBuilder:
                                                              (lessonsRecord) =>
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
                                                          List<LessonsRecord>
                                                              lessonsCompleteLessonsRecordList =
                                                              snapshot.data!;
                                                          return Text(
                                                            'Пройдено ${lessonsCompleteLessonsRecordList.where((e) => stackUsersRecord.rlFinishedLessons.contains(e.reference)).toList().length.toString()} из ${lessonsCompleteLessonsRecordList.length.toString()} уроков',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent1,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: FutureBuilder<List<ModulesRecord>>(
                                    future: queryModulesRecordOnce(
                                      parent: widget.currentCourse?.reference,
                                      queryBuilder: (modulesRecord) =>
                                          modulesRecord.orderBy('index'),
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
                                                  FlutterFlowTheme.of(context)
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
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List.generate(
                                              modulesListPadModulesRecordList
                                                  .length,
                                              (modulesListPadIndex) {
                                            final modulesListPadModulesRecord =
                                                modulesListPadModulesRecordList[
                                                    modulesListPadIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
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
                                                    'Keyfyr_${modulesListPadIndex}_of_${modulesListPadModulesRecordList.length}'),
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
                                                userDoc: stackUsersRecord,
                                              ),
                                            );
                                          }).divide(SizedBox(width: 16.0)),
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                        tablet: false,
                                        tabletLandscape: false,
                                      ))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 48.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.00, -1.00),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 100.0),
                                                child: FutureBuilder<
                                                    List<ModulesRecord>>(
                                                  future:
                                                      queryModulesRecordOnce(
                                                    parent: widget.currentCourse
                                                        ?.reference,
                                                    queryBuilder:
                                                        (modulesRecord) =>
                                                            modulesRecord
                                                                .orderBy(
                                                                    'index'),
                                                  ),
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
                                                    List<ModulesRecord>
                                                        columnModulesRecordList =
                                                        snapshot.data!;
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: List.generate(
                                                              columnModulesRecordList
                                                                  .length,
                                                              (columnIndex) {
                                                        final columnModulesRecord =
                                                            columnModulesRecordList[
                                                                columnIndex];
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            setState(() {
                                                              _model.currentModule =
                                                                  columnModulesRecord;
                                                            });
                                                          },
                                                          child:
                                                              ModuleItemWidget(
                                                            key: Key(
                                                                'Keybdw_${columnIndex}_of_${columnModulesRecordList.length}'),
                                                            activeModule: (_model
                                                                            .currentModule !=
                                                                        null) &&
                                                                    (_model.currentModule
                                                                            ?.reference ==
                                                                        columnModulesRecord
                                                                            .reference)
                                                                ? 1
                                                                : 0,
                                                            currentModule:
                                                                columnModulesRecord,
                                                            userDoc:
                                                                stackUsersRecord,
                                                          ),
                                                        );
                                                      })
                                                          .divide(SizedBox(
                                                              height: 16.0))
                                                          .addToEnd(SizedBox(
                                                              height: 80.0)),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.00, 0.00),
                                              child: Container(
                                                width: 1000.0,
                                                decoration: BoxDecoration(),
                                                child: Visibility(
                                                  visible:
                                                      _model.currentModule !=
                                                          null,
                                                  child: FutureBuilder<
                                                      List<LessonsRecord>>(
                                                    future:
                                                        queryLessonsRecordOnce(
                                                      parent: widget
                                                          .currentCourse
                                                          ?.reference,
                                                      queryBuilder:
                                                          (lessonsRecord) =>
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
                                                      List<LessonsRecord>
                                                          containerLessonsRecordList =
                                                          snapshot.data!;
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        100.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final allLessonsWithModule =
                                                                        containerLessonsRecordList
                                                                            .toList();
                                                                    return GridView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      gridDelegate:
                                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                                        crossAxisCount:
                                                                            2,
                                                                        crossAxisSpacing:
                                                                            24.0,
                                                                        mainAxisSpacing:
                                                                            24.0,
                                                                        childAspectRatio:
                                                                            () {
                                                                          if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall) {
                                                                            return 1.0;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointMedium) {
                                                                            return 1.16;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointLarge) {
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
                                                                          allLessonsWithModule
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              allLessonsWithModuleIndex) {
                                                                        final allLessonsWithModuleItem =
                                                                            allLessonsWithModule[allLessonsWithModuleIndex];
                                                                        return Stack(
                                                                          children: [
                                                                            if (valueOrDefault<bool>(
                                                                              (functions.returnDiffInDaysUserCreate(stackUsersRecord) == null) || (functions.addSomeDaysToDate(functions.returnDiffInDaysUserCreate(stackUsersRecord)!, allLessonsWithModuleItem.openDay) < getCurrentTimestamp),
                                                                              true,
                                                                            ))
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  await action_blocks.navigationForOpenLessonFree(
                                                                                    context,
                                                                                    currentLesson: allLessonsWithModuleItem,
                                                                                    indexInList: allLessonsWithModuleIndex,
                                                                                    userDoc: stackUsersRecord,
                                                                                    countLessons: containerLessonsRecordList.length,
                                                                                  );
                                                                                },
                                                                                child: LessonContainerWidget(
                                                                                  key: Key('Key4xw_${allLessonsWithModuleIndex}_of_${allLessonsWithModule.length}'),
                                                                                  currentLesson: allLessonsWithModuleItem,
                                                                                  currentState: 0,
                                                                                  userDoc: stackUsersRecord,
                                                                                  isFree: widget.currentCourse!.isFree,
                                                                                ),
                                                                              ),
                                                                            if (valueOrDefault<bool>(
                                                                              (functions.returnDiffInDaysUserCreate(stackUsersRecord) != null) && (functions.addSomeDaysToDate(functions.returnDiffInDaysUserCreate(stackUsersRecord)!, allLessonsWithModuleItem.openDay) > getCurrentTimestamp),
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
                                                                                          child: GestureDetector(
                                                                                            onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                            child: TariffCloseWidget(),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => setState(() {}));
                                                                                  },
                                                                                  child: LessonContainerWidget(
                                                                                    key: Key('Key2ng_${allLessonsWithModuleIndex}_of_${allLessonsWithModule.length}'),
                                                                                    currentLesson: allLessonsWithModuleItem,
                                                                                    currentState: 1,
                                                                                    userDoc: stackUsersRecord,
                                                                                    isFree: widget.currentCourse!.isFree,
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
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].addToStart(SizedBox(height: 1.0)),
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
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 80.0),
                                    child: FutureBuilder<List<ModulesRecord>>(
                                      future: queryModulesRecordOnce(
                                        parent: widget.currentCourse?.reference,
                                        queryBuilder: (modulesRecord) =>
                                            modulesRecord.orderBy('index'),
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
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<ModulesRecord>
                                            columnModulesRecordList =
                                            snapshot.data!;
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: List.generate(
                                                  columnModulesRecordList
                                                      .length, (columnIndex) {
                                            final columnModulesRecord =
                                                columnModulesRecordList[
                                                    columnIndex];
                                            return MoodMobileWidget(
                                              key: Key(
                                                  'Keylne_${columnIndex}_of_${columnModulesRecordList.length}'),
                                              currentModule:
                                                  columnModulesRecord,
                                              userDoc: stackUsersRecord,
                                              currentCourse:
                                                  widget.currentCourse,
                                            );
                                          })
                                              .divide(SizedBox(height: 16.0))
                                              .addToStart(
                                                  SizedBox(height: 21.0))
                                              .addToEnd(SizedBox(height: 45.0)),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      if (!widget.currentCourse!.isWithModules)
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 100.0,
                                height: () {
                                  if (MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall) {
                                    return 50.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointMedium) {
                                    return 92.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointLarge) {
                                    return 92.0;
                                  } else {
                                    return 92.0;
                                  }
                                }(),
                                decoration: BoxDecoration(),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.safePop();
                                      },
                                      child: Container(
                                        width: 24.0,
                                        height: 24.0,
                                        decoration: BoxDecoration(),
                                        child: Icon(
                                          FFIcons.kleftTo,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 16.0,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          widget.currentCourse!.name,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.00, 0.00),
                                          child: Container(
                                            width: 1900.0,
                                            height: 20.0,
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.00, 0.00),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                    tabletLandscape: false,
                                                  ))
                                                    Expanded(
                                                      child: Container(
                                                        width: 40.0,
                                                        height: 5.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                      ),
                                                    ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.00, 0.00),
                                                    child: FutureBuilder<
                                                        List<LessonsRecord>>(
                                                      future:
                                                          queryLessonsRecordOnce(
                                                        parent: widget
                                                            .currentCourse
                                                            ?.reference,
                                                        queryBuilder:
                                                            (lessonsRecord) =>
                                                                lessonsRecord
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 50.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<LessonsRecord>
                                                            lessonsCompleteLessonsRecordList =
                                                            snapshot.data!;
                                                        return Text(
                                                          'Пройдено ${lessonsCompleteLessonsRecordList.where((e) => stackUsersRecord.rlFinishedLessons.contains(e.reference)).toList().length.toString()} из ${lessonsCompleteLessonsRecordList.length.toString()} уроков',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.00, 0.00),
                                              child: FutureBuilder<
                                                  List<LessonsRecord>>(
                                                future: queryLessonsRecordOnce(
                                                  parent: widget
                                                      .currentCourse?.reference,
                                                  queryBuilder:
                                                      (lessonsRecord) =>
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<LessonsRecord>
                                                      containerLessonsRecordList =
                                                      snapshot.data!;
                                                  return Container(
                                                    width: 1000.0,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      100.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final allLessonsWithoutModules =
                                                                  containerLessonsRecordList
                                                                      .toList();
                                                              return GridView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                gridDelegate:
                                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount:
                                                                      2,
                                                                  crossAxisSpacing:
                                                                      24.0,
                                                                  mainAxisSpacing:
                                                                      24.0,
                                                                  childAspectRatio:
                                                                      () {
                                                                    if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointSmall) {
                                                                      return 1.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointMedium) {
                                                                      return 1.16;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointLarge) {
                                                                      return 1.59;
                                                                    } else {
                                                                      return 1.59;
                                                                    }
                                                                  }(),
                                                                ),
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    allLessonsWithoutModules
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        allLessonsWithoutModulesIndex) {
                                                                  final allLessonsWithoutModulesItem =
                                                                      allLessonsWithoutModules[
                                                                          allLessonsWithoutModulesIndex];
                                                                  return Stack(
                                                                    children: [
                                                                      if (valueOrDefault<
                                                                          bool>(
                                                                        (functions.returnDiffInDaysUserCreate(stackUsersRecord) ==
                                                                                null) ||
                                                                            (functions.addSomeDaysToDate(functions.returnDiffInDaysUserCreate(stackUsersRecord)!, allLessonsWithoutModulesItem.openDay) <
                                                                                getCurrentTimestamp),
                                                                        true,
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
                                                                          onTap:
                                                                              () async {
                                                                            await action_blocks.navigationForOpenLessonFree(
                                                                              context,
                                                                              currentLesson: allLessonsWithoutModulesItem,
                                                                              indexInList: allLessonsWithoutModulesIndex,
                                                                              userDoc: stackUsersRecord,
                                                                              countLessons: containerLessonsRecordList.length,
                                                                            );
                                                                          },
                                                                          child:
                                                                              LessonContainerWidget(
                                                                            key:
                                                                                Key('Keyg22_${allLessonsWithoutModulesIndex}_of_${allLessonsWithoutModules.length}'),
                                                                            currentState:
                                                                                0,
                                                                            userDoc:
                                                                                stackUsersRecord,
                                                                            currentLesson:
                                                                                allLessonsWithoutModulesItem,
                                                                            isFree:
                                                                                widget.currentCourse!.isFree,
                                                                          ),
                                                                        ),
                                                                      if (valueOrDefault<
                                                                          bool>(
                                                                        (functions.returnDiffInDaysUserCreate(stackUsersRecord) !=
                                                                                null) &&
                                                                            (functions.addSomeDaysToDate(functions.returnDiffInDaysUserCreate(stackUsersRecord)!, allLessonsWithoutModulesItem.openDay) >
                                                                                getCurrentTimestamp),
                                                                        false,
                                                                      ))
                                                                        Builder(
                                                                          builder: (context) =>
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
                                                                                    child: GestureDetector(
                                                                                      onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                      child: TariffCloseWidget(),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => setState(() {}));
                                                                            },
                                                                            child:
                                                                                LessonContainerWidget(
                                                                              key: Key('Key5gy_${allLessonsWithoutModulesIndex}_of_${allLessonsWithoutModules.length}'),
                                                                              currentState: 1,
                                                                              currentLesson: allLessonsWithoutModulesItem,
                                                                              userDoc: stackUsersRecord,
                                                                              isFree: widget.currentCourse!.isFree,
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
                                          ].addToStart(SizedBox(height: 1.0)),
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
                                    parent: widget.currentCourse?.reference,
                                    queryBuilder: (lessonsRecord) =>
                                        lessonsRecord.orderBy('index'),
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
                                    List<LessonsRecord>
                                        lessonsMobileLessonsRecordList =
                                        snapshot.data!;
                                    return Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final allLessons =
                                                lessonsMobileLessonsRecordList
                                                    .toList();
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                      allLessons.length,
                                                      (allLessonsIndex) {
                                                final allLessonsItem =
                                                    allLessons[allLessonsIndex];
                                                return Stack(
                                                  children: [
                                                    if (valueOrDefault<bool>(
                                                      (functions.returnDiffInDaysUserCreate(
                                                                  stackUsersRecord) ==
                                                              null) ||
                                                          (functions.addSomeDaysToDate(
                                                                  functions
                                                                      .returnDiffInDaysUserCreate(
                                                                          stackUsersRecord)!,
                                                                  allLessonsItem
                                                                      .openDay) <
                                                              getCurrentTimestamp),
                                                      true,
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
                                                          await action_blocks
                                                              .navigationForOpenLessonFree(
                                                            context,
                                                            currentLesson:
                                                                allLessonsItem,
                                                            indexInList:
                                                                allLessonsIndex,
                                                            userDoc:
                                                                stackUsersRecord,
                                                            countLessons:
                                                                lessonsMobileLessonsRecordList
                                                                    .length,
                                                          );
                                                        },
                                                        child: LesMobileWidget(
                                                          key: Key(
                                                              'Keyhv7_${allLessonsIndex}_of_${allLessons.length}'),
                                                          currentState: 0,
                                                          userDoc:
                                                              stackUsersRecord,
                                                          currentLesson:
                                                              allLessonsItem,
                                                          index:
                                                              allLessonsIndex,
                                                          countLessons:
                                                              lessonsMobileLessonsRecordList
                                                                  .length,
                                                          isFree: widget
                                                              .currentCourse!
                                                              .isFree,
                                                        ),
                                                      ),
                                                    if (valueOrDefault<bool>(
                                                      (functions.returnDiffInDaysUserCreate(
                                                                  stackUsersRecord) !=
                                                              null) &&
                                                          (functions.addSomeDaysToDate(
                                                                  functions
                                                                      .returnDiffInDaysUserCreate(
                                                                          stackUsersRecord)!,
                                                                  allLessonsItem
                                                                      .openDay) >
                                                              getCurrentTimestamp),
                                                      false,
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
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            isDismissible:
                                                                false,
                                                            enableDrag: false,
                                                            useSafeArea: true,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      TariffCloseMobileWidget(),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                        child: LesMobileWidget(
                                                          key: Key(
                                                              'Keykst_${allLessonsIndex}_of_${allLessons.length}'),
                                                          currentState: 1,
                                                          userDoc:
                                                              stackUsersRecord,
                                                          currentLesson:
                                                              allLessonsItem,
                                                          index:
                                                              allLessonsIndex,
                                                          countLessons:
                                                              lessonsMobileLessonsRecordList
                                                                  .length,
                                                          isFree: widget
                                                              .currentCourse!
                                                              .isFree,
                                                        ),
                                                      ),
                                                  ],
                                                );
                                              })
                                                  .divide(
                                                      SizedBox(height: 16.0))
                                                  .addToStart(
                                                      SizedBox(height: 21.0))
                                                  .addToEnd(
                                                      SizedBox(height: 80.0)),
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                            ],
                          ),
                        ),
                      wrapWithModel(
                        model: _model.appBarModel,
                        updateCallback: () => setState(() {}),
                        child: AppBarWidget(
                          selected: 2,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
