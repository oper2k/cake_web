import '/backend/backend.dart';
import '/courses/les_mobile/les_mobile_widget.dart';
import '/courses/tariff_change_mobile/tariff_change_mobile_widget.dart';
import '/courses/tariff_close_mobile/tariff_close_mobile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'mood_mobile_model.dart';
export 'mood_mobile_model.dart';

class MoodMobileWidget extends StatefulWidget {
  const MoodMobileWidget({
    Key? key,
    this.currentModule,
    this.userDoc,
    this.courseTariff,
    this.currentCourse,
  }) : super(key: key);

  final ModulesRecord? currentModule;
  final UsersRecord? userDoc;
  final DocumentReference? courseTariff;
  final CoursesRecord? currentCourse;

  @override
  _MoodMobileWidgetState createState() => _MoodMobileWidgetState();
}

class _MoodMobileWidgetState extends State<MoodMobileWidget> {
  late MoodMobileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodMobileModel());

    _model.expandableController = ExpandableController(initialExpanded: false);
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

    return FutureBuilder<List<LessonsRecord>>(
      future: queryLessonsRecordOnce(
        parent: widget.currentCourse?.reference,
        queryBuilder: (lessonsRecord) => lessonsRecord
            .where(
              'rl_modules',
              isEqualTo: widget.currentModule?.reference,
            )
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
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 50.0,
              ),
            ),
          );
        }
        List<LessonsRecord> containerLessonsRecordList = snapshot.data!;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).accent3,
            ),
          ),
          child: Container(
            width: double.infinity,
            color: Color(0x00000000),
            child: ExpandableNotifier(
              controller: _model.expandableController,
              child: ExpandablePanel(
                header: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (widget.userDoc?.rlFinishedModule
                                  ?.contains(widget.currentModule?.reference) ??
                              true)
                            Container(
                              width: 24.0,
                              height: 24.0,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).green2009F4E,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                FFIcons.kcheckmark,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 12.0,
                              ),
                            ),
                          if (!widget.userDoc!.rlFinishedModule
                                  .contains(widget.currentModule?.reference) &&
                              widget.userDoc!.rlStartModule
                                  .contains(widget.currentModule?.reference))
                            CircularPercentIndicator(
                              percent: 0.35,
                              radius: 12.0,
                              lineWidth: 4.0,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor: Color(0xFF009F4E),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).black3666666,
                            ),
                          if (!widget.userDoc!.rlFinishedModule
                                  .contains(widget.currentModule?.reference) &&
                              !widget.userDoc!.rlStartModule
                                  .contains(widget.currentModule?.reference))
                            CircularPercentIndicator(
                              percent: 0.0,
                              radius: 12.0,
                              lineWidth: 4.0,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor:
                                  FlutterFlowTheme.of(context).black3666666,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).black3666666,
                            ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.currentModule!.name,
                              style: FlutterFlowTheme.of(context).labelSmall,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Text(
                                'Модуль ${widget.currentModule?.index?.toString()}',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodySmallFamily,
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                collapsed: Container(),
                expanded: Stack(
                  children: [
                    if (widget.currentCourse?.isFree == true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final allLessons =
                                containerLessonsRecordList.toList();
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(allLessons.length,
                                      (allLessonsIndex) {
                                final allLessonsItem =
                                    allLessons[allLessonsIndex];
                                return Stack(
                                  children: [
                                    if (valueOrDefault<bool>(
                                      (functions.returnDiffInDaysUserCreate(
                                                  widget.userDoc!) ==
                                              null) ||
                                          (functions.addSomeDaysToDate(
                                                  functions
                                                      .returnDiffInDaysUserCreate(
                                                          widget.userDoc!)!,
                                                  allLessonsItem.openDay) <
                                              getCurrentTimestamp),
                                      true,
                                    ))
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await action_blocks
                                              .navigationForOpenLessonFree(
                                            context,
                                            currentLesson: allLessonsItem,
                                            indexInList: allLessonsIndex,
                                            userDoc: widget.userDoc,
                                            countLessons:
                                                containerLessonsRecordList
                                                    .length,
                                          );
                                        },
                                        child: LesMobileWidget(
                                          key: Key(
                                              'Keysqg_${allLessonsIndex}_of_${allLessons.length}'),
                                          currentState: 0,
                                          userDoc: widget.userDoc,
                                          currentLesson: allLessonsItem,
                                          index: allLessonsIndex,
                                          countLessons:
                                              containerLessonsRecordList.length,
                                          isFree: widget.currentCourse!.isFree,
                                        ),
                                      ),
                                    if (valueOrDefault<bool>(
                                      (functions.returnDiffInDaysUserCreate(
                                                  widget.userDoc!) !=
                                              null) &&
                                          (functions.addSomeDaysToDate(
                                                  functions
                                                      .returnDiffInDaysUserCreate(
                                                          widget.userDoc!)!,
                                                  allLessonsItem.openDay) >
                                              getCurrentTimestamp),
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
                                              return Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child:
                                                    TariffCloseMobileWidget(),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: LesMobileWidget(
                                          key: Key(
                                              'Keykvp_${allLessonsIndex}_of_${allLessons.length}'),
                                          currentState: 1,
                                          userDoc: widget.userDoc,
                                          currentLesson: allLessonsItem,
                                          index: allLessonsIndex,
                                          countLessons:
                                              containerLessonsRecordList.length,
                                          isFree: widget.currentCourse!.isFree,
                                        ),
                                      ),
                                  ],
                                );
                              })
                                  .divide(SizedBox(height: 16.0))
                                  .addToStart(SizedBox(height: 16.0))
                                  .addToEnd(SizedBox(height: 20.0)),
                            );
                          },
                        ),
                      ),
                    if (widget.currentCourse?.isFree != true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final allLessons =
                                containerLessonsRecordList.toList();
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(allLessons.length,
                                      (allLessonsIndex) {
                                final allLessonsItem =
                                    allLessons[allLessonsIndex];
                                return Stack(
                                  children: [
                                    if (allLessonsItem.rlTariff
                                            .contains(widget.courseTariff) ||
                                        widget.userDoc!.rlBonusLessons
                                            .contains(allLessonsItem.reference))
                                      Stack(
                                        children: [
                                          if (valueOrDefault<bool>(
                                            (allLessonsItem.openDate == null) ||
                                                (allLessonsItem.openDate! <
                                                    getCurrentTimestamp),
                                            true,
                                          ))
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await action_blocks
                                                    .navigationForOpenLesson(
                                                  context,
                                                  lessonIndexInList:
                                                      allLessonsIndex,
                                                  currentLesson: allLessonsItem,
                                                  userDoc: widget.userDoc,
                                                  countLessons:
                                                      containerLessonsRecordList
                                                          .length,
                                                  tariff: widget.courseTariff,
                                                );
                                              },
                                              child: LesMobileWidget(
                                                key: Key(
                                                    'Keylzo_${allLessonsIndex}_of_${allLessons.length}'),
                                                currentState: 0,
                                                userDoc: widget.userDoc,
                                                currentLesson: allLessonsItem,
                                                index: allLessonsIndex,
                                                countLessons:
                                                    containerLessonsRecordList
                                                        .length,
                                                isFree: widget
                                                    .currentCourse!.isFree,
                                              ),
                                            ),
                                          if (valueOrDefault<bool>(
                                            (allLessonsItem.openDate != null) &&
                                                (allLessonsItem.openDate! >
                                                    getCurrentTimestamp),
                                            false,
                                          ))
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  isDismissible: false,
                                                  enableDrag: false,
                                                  useSafeArea: true,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          TariffCloseMobileWidget(),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              child: LesMobileWidget(
                                                key: Key(
                                                    'Key256_${allLessonsIndex}_of_${allLessons.length}'),
                                                currentState: 1,
                                                userDoc: widget.userDoc,
                                                currentLesson: allLessonsItem,
                                                index: allLessonsIndex,
                                                countLessons:
                                                    containerLessonsRecordList
                                                        .length,
                                                isFree: widget
                                                    .currentCourse!.isFree,
                                              ),
                                            ),
                                        ],
                                      ),
                                    if (!(allLessonsItem.rlTariff
                                            .contains(widget.courseTariff) ||
                                        widget.userDoc!.rlBonusLessons.contains(
                                            allLessonsItem.reference)))
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
                                              return Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child:
                                                    TariffChangeMobileWidget(),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: LesMobileWidget(
                                          key: Key(
                                              'Key3qf_${allLessonsIndex}_of_${allLessons.length}'),
                                          currentState: 2,
                                          userDoc: widget.userDoc,
                                          currentLesson: allLessonsItem,
                                          index: allLessonsIndex,
                                          countLessons:
                                              containerLessonsRecordList.length,
                                          isFree: widget.currentCourse!.isFree,
                                        ),
                                      ),
                                  ],
                                );
                              })
                                  .divide(SizedBox(height: 16.0))
                                  .addToStart(SizedBox(height: 16.0))
                                  .addToEnd(SizedBox(height: 20.0)),
                            );
                          },
                        ),
                      ),
                  ],
                ),
                theme: ExpandableThemeData(
                  tapHeaderToExpand: true,
                  tapBodyToExpand: false,
                  tapBodyToCollapse: true,
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  hasIcon: true,
                  expandIcon: FFIcons.kright,
                  collapseIcon: FFIcons.kdown,
                  iconSize: 12.0,
                  iconColor: FlutterFlowTheme.of(context).accent1,
                  iconPadding: EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 20.0),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
