import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_bar_widget.dart';
import '/components/button_widget.dart';
import '/courses/homework_add_desktop/homework_add_desktop_widget.dart';
import '/courses/homework_confirmed/homework_confirmed_widget.dart';
import '/courses/material/material_widget.dart';
import '/courses/roadmap_item/roadmap_item_widget.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'lesson_model.dart';
export 'lesson_model.dart';

class LessonWidget extends StatefulWidget {
  const LessonWidget({
    Key? key,
    this.currentLesson,
    this.lessonIndex,
    this.countLessons,
    this.tariff,
    required this.freeCourse,
  }) : super(key: key);

  final LessonsRecord? currentLesson;
  final int? lessonIndex;
  final int? countLessons;
  final DocumentReference? tariff;
  final bool? freeCourse;

  @override
  _LessonWidgetState createState() => _LessonWidgetState();
}

class _LessonWidgetState extends State<LessonWidget> {
  late LessonModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LessonModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().rulesOpen = false;
      });
      if (widget.freeCourse == true) {
        return;
      }

      if ((currentUserDocument?.rlBuyTariffs?.toList() ?? [])
          .contains(widget.tariff)) {
        return;
      }

      context.pushNamed('Courses_Old');

      return;
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
        body: Align(
          alignment: AlignmentDirectional(0.00, -1.00),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: FutureBuilder<List<LessonsContentRecord>>(
              future: queryLessonsContentRecordOnce(
                parent: widget.currentLesson?.parentReference,
                queryBuilder: (lessonsContentRecord) => lessonsContentRecord
                    .where(
                      'rl_lessons',
                      isEqualTo: widget.currentLesson?.reference,
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
                List<LessonsContentRecord>
                    lessonContentLessonsContentRecordList = snapshot.data!;
                return Container(
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
                      final columnUsersRecord = snapshot.data!;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          wrapWithModel(
                            model: _model.appBarModel,
                            updateCallback: () => setState(() {}),
                            child: AppBarWidget(
                              selected: 2,
                            ),
                          ),
                          Expanded(
                            child: StreamBuilder<List<ChatsRecord>>(
                              stream: queryChatsRecord(
                                queryBuilder: (chatsRecord) => chatsRecord
                                    .where(
                                      'user_client',
                                      isEqualTo: columnUsersRecord.reference,
                                    )
                                    .where(
                                      'rl_lesson',
                                      isEqualTo:
                                          widget.currentLesson?.reference,
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
                                List<ChatsRecord> columnChatsRecordList =
                                    snapshot.data!;
                                final columnChatsRecord =
                                    columnChatsRecordList.isNotEmpty
                                        ? columnChatsRecordList.first
                                        : null;
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
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
                                                    widget.currentLesson!.name,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(),
                                                child: Stack(
                                                  children: [
                                                    if (!widget.currentLesson!
                                                            .withHomework &&
                                                        !widget.currentLesson!
                                                            .withPhotoHomework)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    2.0,
                                                                    0.0),
                                                        child: Stack(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          children: [
                                                            if (columnUsersRecord
                                                                    .rlFinishedLessons
                                                                    .contains(widget
                                                                        .currentLesson
                                                                        ?.reference) &&
                                                                responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                ))
                                                              wrapWithModel(
                                                                model: _model
                                                                    .buttonModel1,
                                                                updateCallback:
                                                                    () => setState(
                                                                        () {}),
                                                                child:
                                                                    ButtonWidget(
                                                                  text:
                                                                      'Вы прошли урок  🎉',
                                                                  btnColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  txtColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent1,
                                                                  btnWidth: 240,
                                                                ),
                                                              ),
                                                            if (!columnUsersRecord
                                                                    .rlFinishedLessons
                                                                    .contains(widget
                                                                        .currentLesson
                                                                        ?.reference) &&
                                                                responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                ))
                                                              Builder(
                                                                builder:
                                                                    (context) =>
                                                                        InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    if ((widget.currentLesson!.showRules &&
                                                                            (FFAppState().agreeRules ==
                                                                                1)) ||
                                                                        (widget.currentLesson?.showRules ==
                                                                            false)) {
                                                                      await action_blocks
                                                                          .lessonCompleted(
                                                                        context,
                                                                        currentLesson:
                                                                            widget.currentLesson,
                                                                        userDoc:
                                                                            columnUsersRecord,
                                                                        allLessonCount:
                                                                            widget.countLessons,
                                                                        lessonIndex:
                                                                            widget.lessonIndex,
                                                                      );
                                                                      return;
                                                                    } else {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width <=
                                                                          kBreakpointSmall) {
                                                                        context
                                                                            .pushNamed(
                                                                          'Homework_Confirmed_Mobile',
                                                                          queryParameters:
                                                                              {
                                                                            'currentLesson':
                                                                                serializeParam(
                                                                              widget.currentLesson,
                                                                              ParamType.Document,
                                                                            ),
                                                                            'countLesson':
                                                                                serializeParam(
                                                                              widget.countLessons,
                                                                              ParamType.int,
                                                                            ),
                                                                            'lessonIndx':
                                                                                serializeParam(
                                                                              widget.lessonIndex,
                                                                              ParamType.int,
                                                                            ),
                                                                            'courseFree':
                                                                                serializeParam(
                                                                              widget.freeCourse,
                                                                              ParamType.bool,
                                                                            ),
                                                                            'currentTariff':
                                                                                serializeParam(
                                                                              widget.tariff,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            'currentLesson':
                                                                                widget.currentLesson,
                                                                            kTransitionInfoKey:
                                                                                TransitionInfo(
                                                                              hasTransition: true,
                                                                              transitionType: PageTransitionType.fade,
                                                                              duration: Duration(milliseconds: 0),
                                                                            ),
                                                                          },
                                                                        );

                                                                        return;
                                                                      } else {
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().rulesOpen =
                                                                              true;
                                                                        });
                                                                        await showAlignedDialog(
                                                                          barrierDismissible:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          isGlobal:
                                                                              true,
                                                                          avoidOverflow:
                                                                              false,
                                                                          targetAnchor:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          followerAnchor:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Material(
                                                                              color: Colors.transparent,
                                                                              child: WebViewAware(
                                                                                  child: GestureDetector(
                                                                                onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                child: HomeworkConfirmedWidget(
                                                                                  lesson: widget.currentLesson!,
                                                                                  countLes: widget.countLessons!,
                                                                                  index: widget.lessonIndex!,
                                                                                  courseFree: widget.freeCourse!,
                                                                                ),
                                                                              )),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            setState(() {}));

                                                                        return;
                                                                      }
                                                                    }
                                                                  },
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .buttonModel2,
                                                                    updateCallback: () =>
                                                                        setState(
                                                                            () {}),
                                                                    child:
                                                                        ButtonWidget(
                                                                      text:
                                                                          'Урок пройден  👍',
                                                                      btnColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      txtColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      btnWidth:
                                                                          238,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    if (widget.currentLesson!
                                                            .withHomework ||
                                                        widget.currentLesson!
                                                            .withPhotoHomework)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    2.0,
                                                                    0.0),
                                                        child: Stack(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          children: [
                                                            if ((!(columnChatsRecord !=
                                                                        null) ||
                                                                    ((columnChatsRecord !=
                                                                            null) &&
                                                                        (columnChatsRecord?.lastMessageSentBy !=
                                                                            columnUsersRecord
                                                                                .reference) &&
                                                                        !columnChatsRecord!
                                                                            .isFinished)) &&
                                                                responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                ))
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  await action_blocks
                                                                      .sendHomework(
                                                                    context,
                                                                    currentLesson:
                                                                        widget
                                                                            .currentLesson,
                                                                    userDoc:
                                                                        columnUsersRecord,
                                                                    allLessonCount:
                                                                        widget
                                                                            .countLessons,
                                                                    indexLesson:
                                                                        widget
                                                                            .lessonIndex,
                                                                    currentChat:
                                                                        columnChatsRecord,
                                                                    currentTariff:
                                                                        widget
                                                                            .tariff,
                                                                    freeCourse:
                                                                        widget
                                                                            .freeCourse,
                                                                  );
                                                                },
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .buttonModel3,
                                                                  updateCallback:
                                                                      () => setState(
                                                                          () {}),
                                                                  child:
                                                                      ButtonWidget(
                                                                    text:
                                                                        'Сдать домашнее задание ✍️',
                                                                    btnColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    txtColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                ),
                                                              ),
                                                            if (((columnChatsRecord !=
                                                                        null) &&
                                                                    (columnChatsRecord
                                                                            ?.lastMessageSentBy ==
                                                                        columnUsersRecord
                                                                            .reference) &&
                                                                    !columnChatsRecord!
                                                                        .isFinished) &&
                                                                responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                ))
                                                              Builder(
                                                                builder:
                                                                    (context) =>
                                                                        InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    if (MediaQuery.sizeOf(context)
                                                                            .width >=
                                                                        kBreakpointLarge) {
                                                                      await showAlignedDialog(
                                                                        barrierDismissible:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        isGlobal:
                                                                            true,
                                                                        avoidOverflow:
                                                                            false,
                                                                        targetAnchor:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        followerAnchor:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            child: WebViewAware(
                                                                                child: GestureDetector(
                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                              child: HomeworkAddDesktopWidget(
                                                                                onlyPhoto: widget.currentLesson!.withPhotoHomework,
                                                                                currentChat: columnChatsRecord,
                                                                              ),
                                                                            )),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    } else {
                                                                      context
                                                                          .pushNamed(
                                                                        'HomeworkAdded',
                                                                        queryParameters:
                                                                            {
                                                                          'currentChat':
                                                                              serializeParam(
                                                                            columnChatsRecord,
                                                                            ParamType.Document,
                                                                          ),
                                                                          'photoOnly':
                                                                              serializeParam(
                                                                            widget.currentLesson?.withPhotoHomework,
                                                                            ParamType.bool,
                                                                          ),
                                                                          'currentTariff':
                                                                              serializeParam(
                                                                            widget.tariff,
                                                                            ParamType.DocumentReference,
                                                                          ),
                                                                          'courseFree':
                                                                              serializeParam(
                                                                            widget.freeCourse,
                                                                            ParamType.bool,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'currentChat':
                                                                              columnChatsRecord,
                                                                          kTransitionInfoKey:
                                                                              TransitionInfo(
                                                                            hasTransition:
                                                                                true,
                                                                            transitionType:
                                                                                PageTransitionType.fade,
                                                                            duration:
                                                                                Duration(milliseconds: 0),
                                                                          ),
                                                                        },
                                                                      );
                                                                    }
                                                                  },
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .buttonModel4,
                                                                    updateCallback: () =>
                                                                        setState(
                                                                            () {}),
                                                                    child:
                                                                        ButtonWidget(
                                                                      text:
                                                                          'Задание на проверке ⏱️',
                                                                      btnColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      txtColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      btnWidth:
                                                                          275,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            if (((columnChatsRecord !=
                                                                        null) &&
                                                                    columnChatsRecord!
                                                                        .isFinished) &&
                                                                responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                ))
                                                              Builder(
                                                                builder:
                                                                    (context) =>
                                                                        InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    if (MediaQuery.sizeOf(context)
                                                                            .width >=
                                                                        kBreakpointLarge) {
                                                                      await showAlignedDialog(
                                                                        barrierDismissible:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        isGlobal:
                                                                            true,
                                                                        avoidOverflow:
                                                                            false,
                                                                        targetAnchor:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        followerAnchor:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            child: WebViewAware(
                                                                                child: GestureDetector(
                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                              child: HomeworkAddDesktopWidget(
                                                                                onlyPhoto: widget.currentLesson!.withPhotoHomework,
                                                                                currentChat: columnChatsRecord,
                                                                              ),
                                                                            )),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    } else {
                                                                      context
                                                                          .pushNamed(
                                                                        'HomeworkAdded',
                                                                        queryParameters:
                                                                            {
                                                                          'currentChat':
                                                                              serializeParam(
                                                                            columnChatsRecord,
                                                                            ParamType.Document,
                                                                          ),
                                                                          'photoOnly':
                                                                              serializeParam(
                                                                            widget.currentLesson?.withPhotoHomework,
                                                                            ParamType.bool,
                                                                          ),
                                                                          'currentTariff':
                                                                              serializeParam(
                                                                            widget.tariff,
                                                                            ParamType.DocumentReference,
                                                                          ),
                                                                          'courseFree':
                                                                              serializeParam(
                                                                            widget.freeCourse,
                                                                            ParamType.bool,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'currentChat':
                                                                              columnChatsRecord,
                                                                          kTransitionInfoKey:
                                                                              TransitionInfo(
                                                                            hasTransition:
                                                                                true,
                                                                            transitionType:
                                                                                PageTransitionType.fade,
                                                                            duration:
                                                                                Duration(milliseconds: 0),
                                                                          ),
                                                                        },
                                                                      );
                                                                    }
                                                                  },
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .buttonModel5,
                                                                    updateCallback: () =>
                                                                        setState(
                                                                            () {}),
                                                                    child:
                                                                        ButtonWidget(
                                                                      text:
                                                                          'Задание cдано ✅',
                                                                      btnColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      txtColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      btnWidth:
                                                                          215,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Wrap(
                                              spacing: 0.0,
                                              runSpacing: 0.0,
                                              alignment: WrapAlignment.start,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.start,
                                              direction: Axis.horizontal,
                                              runAlignment: WrapAlignment.start,
                                              verticalDirection:
                                                  VerticalDirection.down,
                                              clipBehavior: Clip.none,
                                              children: [
                                                if (lessonContentLessonsContentRecordList
                                                        .where((e) =>
                                                            (lessonContentLessonsContentRecordList
                                                                    .where((e) =>
                                                                        (e.pdf !=
                                                                            null) &&
                                                                        (e.pdf.name !=
                                                                                null &&
                                                                            e.pdf.name !=
                                                                                ''))
                                                                    .toList()
                                                                    .length ==
                                                                0) ||
                                                            (widget
                                                                    .currentLesson
                                                                    ?.additionalInfoButton
                                                                    ?.length ==
                                                                0) ||
                                                            (widget
                                                                    .currentLesson
                                                                    ?.additionalInfo
                                                                    ?.length ==
                                                                0))
                                                        .toList()
                                                        .length !=
                                                    0)
                                                  Container(
                                                    width: () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .width <
                                                          kBreakpointSmall) {
                                                        return 490.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointMedium) {
                                                        return 780.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointLarge) {
                                                        return 590.0;
                                                      } else {
                                                        return 590.0;
                                                      }
                                                    }(),
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Builder(
                                                            builder: (context) {
                                                              final allLessonContent =
                                                                  lessonContentLessonsContentRecordList
                                                                      .where((e) =>
                                                                          e.imageL
                                                                              .length ==
                                                                          0)
                                                                      .toList();
                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: List.generate(
                                                                    allLessonContent
                                                                        .length,
                                                                    (allLessonContentIndex) {
                                                                  final allLessonContentItem =
                                                                      allLessonContent[
                                                                          allLessonContentIndex];
                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      if (allLessonContentItem.text !=
                                                                              null &&
                                                                          allLessonContentItem.text !=
                                                                              '')
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              24.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            allLessonContentItem.text,
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                  lineHeight: 1.4,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      if ((allLessonContentItem.title != null &&
                                                                              allLessonContentItem.title !=
                                                                                  '') &&
                                                                          (allLessonContentItem.title !=
                                                                              'Материалы:'))
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              24.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            allLessonContentItem.title,
                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  fontSize: 22.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      if (allLessonContentItem.subtitle !=
                                                                              null &&
                                                                          allLessonContentItem.subtitle !=
                                                                              '')
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              24.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            allLessonContentItem.subtitle,
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                  lineHeight: 1.4,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      if (allLessonContentItem
                                                                              .pointText
                                                                              .length >
                                                                          0)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              24.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final pointsText = allLessonContentItem.pointText.toList();
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: List.generate(pointsText.length, (pointsTextIndex) {
                                                                                  final pointsTextItem = pointsText[pointsTextIndex];
                                                                                  return RichText(
                                                                                    textScaleFactor: MediaQuery.of(context).textScaleFactor,
                                                                                    text: TextSpan(
                                                                                      children: [
                                                                                        TextSpan(
                                                                                          text: '•',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                fontWeight: FontWeight.bold,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                        ),
                                                                                        TextSpan(
                                                                                          text: ' ',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        ),
                                                                                        TextSpan(
                                                                                          text: pointsTextItem,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        )
                                                                                      ],
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    ),
                                                                                  );
                                                                                }).divide(SizedBox(height: 8.0)),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      if (allLessonContentItem
                                                                              .numberText
                                                                              .length >
                                                                          0)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              24.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final numbersText = allLessonContentItem.numberText.toList();
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: List.generate(numbersText.length, (numbersTextIndex) {
                                                                                  final numbersTextItem = numbersText[numbersTextIndex];
                                                                                  return RichText(
                                                                                    textScaleFactor: MediaQuery.of(context).textScaleFactor,
                                                                                    text: TextSpan(
                                                                                      children: [
                                                                                        TextSpan(
                                                                                          text: functions.increase(numbersTextIndex).toString(),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        ),
                                                                                        TextSpan(
                                                                                          text: '.  ',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        ),
                                                                                        TextSpan(
                                                                                          text: numbersTextItem,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        )
                                                                                      ],
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    ),
                                                                                  );
                                                                                }).divide(SizedBox(height: 8.0)),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      if (allLessonContentItem.audio.link !=
                                                                              null &&
                                                                          allLessonContentItem.audio.link !=
                                                                              '')
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              24.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                384.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                FlutterFlowAudioPlayer(
                                                                              audio: Audio.network(
                                                                                allLessonContentItem.audio.link,
                                                                                metas: Metas(
                                                                                  id: 'sample3.mp3-6157b4dc',
                                                                                  title: valueOrDefault<String>(
                                                                                    allLessonContentItem.audio.name,
                                                                                    'Аудио',
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              titleTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    fontSize: 15.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                  ),
                                                                              playbackDurationTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                    color: Color(0xFFB2B2B2),
                                                                                    fontSize: 15.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                  ),
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              playbackButtonColor: FlutterFlowTheme.of(context).primary,
                                                                              activeTrackColor: Color(0xFF57636C),
                                                                              elevation: 0.0,
                                                                              pauseOnNavigate: false,
                                                                              playInBackground: PlayInBackground.disabledRestoreOnForeground,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (allLessonContentItem.video !=
                                                                              null &&
                                                                          allLessonContentItem.video !=
                                                                              '')
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            if (allLessonContentItem.videoString != null &&
                                                                                allLessonContentItem.videoString != '')
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  allLessonContentItem.videoString,
                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                        lineHeight: 1.4,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                                child: Container(
                                                                                  width: () {
                                                                                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                      return 385.0;
                                                                                    } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                      return 416.0;
                                                                                    } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                      return 590.0;
                                                                                    } else {
                                                                                      return 590.0;
                                                                                    }
                                                                                  }(),
                                                                                  height: () {
                                                                                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                      return 217.0;
                                                                                    } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                      return 234.0;
                                                                                    } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                      return 332.0;
                                                                                    } else {
                                                                                      return 332.0;
                                                                                    }
                                                                                  }(),
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                  ),
                                                                                  child: Visibility(
                                                                                    visible: FFAppState().rulesOpen == false,
                                                                                    child: FlutterFlowWebView(
                                                                                      content: allLessonContentItem.video,
                                                                                      bypass: false,
                                                                                      width: 590.0,
                                                                                      height: 332.0,
                                                                                      verticalScroll: false,
                                                                                      horizontalScroll: false,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      Wrap(
                                                                        spacing:
                                                                            16.0,
                                                                        runSpacing:
                                                                            0.0,
                                                                        alignment:
                                                                            WrapAlignment.center,
                                                                        crossAxisAlignment:
                                                                            WrapCrossAlignment.start,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        runAlignment:
                                                                            WrapAlignment.start,
                                                                        verticalDirection:
                                                                            VerticalDirection.down,
                                                                        clipBehavior:
                                                                            Clip.none,
                                                                        children: [
                                                                          if (allLessonContentItem.socialButton.telegaName != null &&
                                                                              allLessonContentItem.socialButton.telegaName != '')
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  await launchURL(allLessonContentItem.socialButton.telegaLink);
                                                                                },
                                                                                child: Container(
                                                                                  width: () {
                                                                                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                      return 390.0;
                                                                                    } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                      return 290.0;
                                                                                    } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                      return 290.0;
                                                                                    } else {
                                                                                      return 290.0;
                                                                                    }
                                                                                  }(),
                                                                                  height: 52.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFF0088CC),
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Icon(
                                                                                        FFIcons.ktelegram,
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        size: 18.0,
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.00, 0.00),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            allLessonContentItem.socialButton.telegaName,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (allLessonContentItem.socialButton.whatsappName != null &&
                                                                              allLessonContentItem.socialButton.whatsappName != '')
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  await launchURL(allLessonContentItem.socialButton.whatsappName);
                                                                                },
                                                                                child: Container(
                                                                                  width: () {
                                                                                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                      return 390.0;
                                                                                    } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                      return 290.0;
                                                                                    } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                      return 290.0;
                                                                                    } else {
                                                                                      return 290.0;
                                                                                    }
                                                                                  }(),
                                                                                  height: 52.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFF43D854),
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Icon(
                                                                                        FFIcons.kwattsUp,
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        size: 18.0,
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.00, 0.00),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            allLessonContentItem.socialButton.whatsappName,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  );
                                                                }),
                                                              );
                                                            },
                                                          ),
                                                          if (lessonContentLessonsContentRecordList
                                                                  .where((e) =>
                                                                      e.imageL
                                                                          .length !=
                                                                      0)
                                                                  .toList()
                                                                  .length !=
                                                              0)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          24.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Галерея',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          124.0,
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final allImagesInLesson = functions.imageList(lessonContentLessonsContentRecordList.where((e) => e.imageL.length != 0).toList()).toList();
                                                                              return SingleChildScrollView(
                                                                                scrollDirection: Axis.horizontal,
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: List.generate(allImagesInLesson.length, (allImagesInLessonIndex) {
                                                                                    final allImagesInLessonItem = allImagesInLesson[allImagesInLessonIndex];
                                                                                    return InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        context.pushNamed(
                                                                                          'Gallerry',
                                                                                          queryParameters: {
                                                                                            'allImages': serializeParam(
                                                                                              functions.imageList(lessonContentLessonsContentRecordList.where((e) => e.imageL.length != 0).toList()),
                                                                                              ParamType.String,
                                                                                              true,
                                                                                            ),
                                                                                            'currentIndex': serializeParam(
                                                                                              allImagesInLessonIndex,
                                                                                              ParamType.int,
                                                                                            ),
                                                                                            'courseFree': serializeParam(
                                                                                              widget.freeCourse,
                                                                                              ParamType.bool,
                                                                                            ),
                                                                                            'tariff': serializeParam(
                                                                                              widget.tariff,
                                                                                              ParamType.DocumentReference,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            kTransitionInfoKey: TransitionInfo(
                                                                                              hasTransition: true,
                                                                                              transitionType: PageTransitionType.fade,
                                                                                              duration: Duration(milliseconds: 0),
                                                                                            ),
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Container(
                                                                                        width: 124.0,
                                                                                        height: 124.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                        ),
                                                                                        child: ClipRRect(
                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                          child: Image.network(
                                                                                            allImagesInLessonItem,
                                                                                            width: 300.0,
                                                                                            height: 200.0,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }).divide(SizedBox(width: 16.0)).addToEnd(SizedBox(width: 20.0)),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                          if (responsiveVisibility(
                                                                            context:
                                                                                context,
                                                                            phone:
                                                                                false,
                                                                          ))
                                                                            Align(
                                                                              alignment: AlignmentDirectional(1.00, 0.00),
                                                                              child: Container(
                                                                                width: 100.0,
                                                                                height: 124.0,
                                                                                decoration: BoxDecoration(
                                                                                  gradient: LinearGradient(
                                                                                    colors: [
                                                                                      FlutterFlowTheme.of(context).primaryBackground,
                                                                                      Color(0x00FFFFFF)
                                                                                    ],
                                                                                    stops: [
                                                                                      0.0,
                                                                                      1.0
                                                                                    ],
                                                                                    begin: AlignmentDirectional(1.0, 0.0),
                                                                                    end: AlignmentDirectional(-1.0, 0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                if ((lessonContentLessonsContentRecordList
                                                            .where((e) =>
                                                                (lessonContentLessonsContentRecordList
                                                                        .where((e) =>
                                                                            (e.pdf !=
                                                                                null) &&
                                                                            (e.pdf.name != null &&
                                                                                e.pdf.name !=
                                                                                    ''))
                                                                        .toList()
                                                                        .length ==
                                                                    0) ||
                                                                (widget
                                                                        .currentLesson
                                                                        ?.additionalInfoButton
                                                                        ?.length ==
                                                                    0) ||
                                                                (widget
                                                                        .currentLesson
                                                                        ?.additionalInfo
                                                                        ?.length ==
                                                                    0))
                                                            .toList()
                                                            .length !=
                                                        0) &&
                                                    responsiveVisibility(
                                                      context: context,
                                                      phone: false,
                                                      tablet: false,
                                                      tabletLandscape: false,
                                                    ))
                                                  Container(
                                                    width: 32.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(),
                                                  ),
                                                Container(
                                                  width: () {
                                                    if (MediaQuery.sizeOf(
                                                                context)
                                                            .width <
                                                        kBreakpointSmall) {
                                                      return 490.0;
                                                    } else if (MediaQuery
                                                                .sizeOf(context)
                                                            .width <
                                                        kBreakpointMedium) {
                                                      return 780.0;
                                                    } else if (MediaQuery
                                                                .sizeOf(context)
                                                            .width <
                                                        kBreakpointLarge) {
                                                      return 610.0;
                                                    } else {
                                                      return 610.0;
                                                    }
                                                  }(),
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      if (lessonContentLessonsContentRecordList
                                                              .where((e) =>
                                                                  (e.pdf !=
                                                                      null) &&
                                                                  (e.pdf.name !=
                                                                          null &&
                                                                      e.pdf.name !=
                                                                          ''))
                                                              .toList()
                                                              .length !=
                                                          0)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      24.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    'Материалы',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge,
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            32.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final materials = lessonContentLessonsContentRecordList
                                                                        .where((e) =>
                                                                            (e.pdf !=
                                                                                null) &&
                                                                            (e.pdf.name != null &&
                                                                                e.pdf.name != ''))
                                                                        .toList();
                                                                    return Wrap(
                                                                      spacing:
                                                                          16.0,
                                                                      runSpacing:
                                                                          16.0,
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
                                                                          materials
                                                                              .length,
                                                                          (materialsIndex) {
                                                                        final materialsItem =
                                                                            materials[materialsIndex];
                                                                        return MaterialWidget(
                                                                          key: Key(
                                                                              'Key5hm_${materialsIndex}_of_${materials.length}'),
                                                                          currentMaterial:
                                                                              materialsItem,
                                                                        );
                                                                      }),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      if (widget
                                                              .currentLesson!
                                                              .additionalInfoButton
                                                              .length >
                                                          0)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      24.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  widget
                                                                      .currentLesson
                                                                      ?.additionalInfoString,
                                                                  'Дополнительная информация',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final additionalInfoButton = widget
                                                                            .currentLesson
                                                                            ?.additionalInfoButton
                                                                            ?.toList() ??
                                                                        [];
                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: List.generate(
                                                                          additionalInfoButton
                                                                              .length,
                                                                          (additionalInfoButtonIndex) {
                                                                        final additionalInfoButtonItem =
                                                                            additionalInfoButton[additionalInfoButtonIndex];
                                                                        return RoadmapItemWidget(
                                                                          key: Key(
                                                                              'Keyjo1_${additionalInfoButtonIndex}_of_${additionalInfoButton.length}'),
                                                                          currentAdditionalButton:
                                                                              additionalInfoButtonItem,
                                                                          itemInList:
                                                                              additionalInfoButtonIndex,
                                                                          lessonCount: widget
                                                                              .currentLesson
                                                                              ?.additionalInfoButton
                                                                              ?.length,
                                                                        );
                                                                      }),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      if (widget
                                                              .currentLesson!
                                                              .additionalInfo
                                                              .length >
                                                          0)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      24.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Дополнительная информация',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Stack(
                                                                  children: [
                                                                    if (!_model
                                                                        .showAllAdditionalInfo)
                                                                      Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final additionalInfoTwo = (widget.currentLesson?.additionalInfo?.toList() ?? [])
                                                                              .take(2)
                                                                              .toList();
                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                List.generate(additionalInfoTwo.length, (additionalInfoTwoIndex) {
                                                                              final additionalInfoTwoItem = additionalInfoTwo[additionalInfoTwoIndex];
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    '• ${additionalInfoTwoItem.title}',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          lineHeight: 1.4,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    additionalInfoTwoItem.text,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          lineHeight: 1.4,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            }),
                                                                          );
                                                                        },
                                                                      ),
                                                                    if (_model
                                                                        .showAllAdditionalInfo)
                                                                      Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final additionalInfoAll =
                                                                              widget.currentLesson?.additionalInfo?.toList() ?? [];
                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                List.generate(additionalInfoAll.length, (additionalInfoAllIndex) {
                                                                              final additionalInfoAllItem = additionalInfoAll[additionalInfoAllIndex];
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    '• ${additionalInfoAllItem.title}',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          lineHeight: 1.4,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    additionalInfoAllItem.text,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          lineHeight: 1.4,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            }),
                                                                          );
                                                                        },
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                              if (widget
                                                                      .currentLesson!
                                                                      .additionalInfo
                                                                      .length >
                                                                  2)
                                                                Stack(
                                                                  children: [
                                                                    if (!_model
                                                                        .showAllAdditionalInfo)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
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
                                                                            setState(() {
                                                                              _model.showAllAdditionalInfo = true;
                                                                            });
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'Раскрыть',
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).blue33E84FA,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                  lineHeight: 1.4,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (_model
                                                                        .showAllAdditionalInfo)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
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
                                                                            setState(() {
                                                                              _model.showAllAdditionalInfo = false;
                                                                            });
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'Свернуть',
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).blue33E84FA,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                  lineHeight: 1.4,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    32.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                width: () {
                                                                  if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointSmall) {
                                                                    return 390.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointMedium) {
                                                                    return 350.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointLarge) {
                                                                    return 350.0;
                                                                  } else {
                                                                    return 350.0;
                                                                  }
                                                                }(),
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    Visibility(
                                                                  visible: (MediaQuery.sizeOf(context)
                                                                              .width <=
                                                                          kBreakpointSmall) ||
                                                                      ((MediaQuery.sizeOf(context).width >
                                                                              kBreakpointSmall) &&
                                                                          ((lessonContentLessonsContentRecordList.where((e) => (e.pdf != null) && (e.pdf.name != null && e.pdf.name != '')).toList().length != 0) ||
                                                                              (widget.currentLesson?.additionalInfoButton?.length != 0) ||
                                                                              (widget.currentLesson?.additionalInfo?.length != 0))),
                                                                  child: Stack(
                                                                    children: [
                                                                      if (!widget
                                                                              .currentLesson!
                                                                              .withHomework &&
                                                                          !widget
                                                                              .currentLesson!
                                                                              .withPhotoHomework)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              80.0),
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              if (columnUsersRecord.rlFinishedLessons.contains(widget.currentLesson?.reference))
                                                                                wrapWithModel(
                                                                                  model: _model.buttonModel6,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: ButtonWidget(
                                                                                    text: 'Вы прошли урок 🎉',
                                                                                    btnColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    txtColor: FlutterFlowTheme.of(context).accent1,
                                                                                  ),
                                                                                ),
                                                                              if (!columnUsersRecord.rlFinishedLessons.contains(widget.currentLesson?.reference))
                                                                                Builder(
                                                                                  builder: (context) => InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      if ((widget.currentLesson!.showRules && (FFAppState().agreeRules == 1)) || (widget.currentLesson?.showRules == false)) {
                                                                                        await action_blocks.lessonCompleted(
                                                                                          context,
                                                                                          currentLesson: widget.currentLesson,
                                                                                          userDoc: columnUsersRecord,
                                                                                          allLessonCount: widget.countLessons,
                                                                                          lessonIndex: widget.lessonIndex,
                                                                                        );
                                                                                        return;
                                                                                      } else {
                                                                                        if (MediaQuery.sizeOf(context).width <= kBreakpointSmall) {
                                                                                          context.pushNamed(
                                                                                            'Homework_Confirmed_Mobile',
                                                                                            queryParameters: {
                                                                                              'currentLesson': serializeParam(
                                                                                                widget.currentLesson,
                                                                                                ParamType.Document,
                                                                                              ),
                                                                                              'countLesson': serializeParam(
                                                                                                widget.countLessons,
                                                                                                ParamType.int,
                                                                                              ),
                                                                                              'lessonIndx': serializeParam(
                                                                                                widget.lessonIndex,
                                                                                                ParamType.int,
                                                                                              ),
                                                                                              'currentTariff': serializeParam(
                                                                                                widget.tariff,
                                                                                                ParamType.DocumentReference,
                                                                                              ),
                                                                                              'courseFree': serializeParam(
                                                                                                widget.freeCourse,
                                                                                                ParamType.bool,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                            extra: <String, dynamic>{
                                                                                              'currentLesson': widget.currentLesson,
                                                                                              kTransitionInfoKey: TransitionInfo(
                                                                                                hasTransition: true,
                                                                                                transitionType: PageTransitionType.fade,
                                                                                                duration: Duration(milliseconds: 0),
                                                                                              ),
                                                                                            },
                                                                                          );

                                                                                          return;
                                                                                        } else {
                                                                                          FFAppState().update(() {
                                                                                            FFAppState().rulesOpen = true;
                                                                                          });
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
                                                                                                  child: HomeworkConfirmedWidget(
                                                                                                    lesson: widget.currentLesson!,
                                                                                                    countLes: widget.countLessons!,
                                                                                                    index: widget.lessonIndex!,
                                                                                                    courseFree: widget.freeCourse!,
                                                                                                  ),
                                                                                                )),
                                                                                              );
                                                                                            },
                                                                                          ).then((value) => setState(() {}));

                                                                                          return;
                                                                                        }
                                                                                      }
                                                                                    },
                                                                                    child: wrapWithModel(
                                                                                      model: _model.buttonModel7,
                                                                                      updateCallback: () => setState(() {}),
                                                                                      child: ButtonWidget(
                                                                                        text: 'Урок пройден 👍',
                                                                                        btnColor: FlutterFlowTheme.of(context).primaryText,
                                                                                        txtColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      if (widget
                                                                              .currentLesson!
                                                                              .withHomework ||
                                                                          widget
                                                                              .currentLesson!
                                                                              .withPhotoHomework)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              80.0),
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              if (!(columnChatsRecord != null) || ((columnChatsRecord != null) && (columnChatsRecord?.lastMessageSentBy != columnUsersRecord.reference) && !columnChatsRecord!.isFinished))
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    await action_blocks.sendHomework(
                                                                                      context,
                                                                                      currentLesson: widget.currentLesson,
                                                                                      userDoc: columnUsersRecord,
                                                                                      allLessonCount: widget.countLessons,
                                                                                      indexLesson: widget.lessonIndex,
                                                                                      currentChat: columnChatsRecord,
                                                                                      currentTariff: widget.tariff,
                                                                                      freeCourse: widget.freeCourse,
                                                                                    );
                                                                                  },
                                                                                  child: wrapWithModel(
                                                                                    model: _model.buttonModel8,
                                                                                    updateCallback: () => setState(() {}),
                                                                                    child: ButtonWidget(
                                                                                      text: 'Сдать домашнее задание ✍️',
                                                                                      btnColor: FlutterFlowTheme.of(context).primaryText,
                                                                                      txtColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if ((columnChatsRecord != null) && (columnChatsRecord?.lastMessageSentBy == columnUsersRecord.reference) && !columnChatsRecord!.isFinished)
                                                                                Builder(
                                                                                  builder: (context) => InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      if (MediaQuery.sizeOf(context).width >= kBreakpointLarge) {
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
                                                                                                child: HomeworkAddDesktopWidget(
                                                                                                  onlyPhoto: widget.currentLesson!.withPhotoHomework,
                                                                                                  currentChat: columnChatsRecord,
                                                                                                ),
                                                                                              )),
                                                                                            );
                                                                                          },
                                                                                        ).then((value) => setState(() {}));
                                                                                      } else {
                                                                                        context.pushNamed(
                                                                                          'HomeworkAdded',
                                                                                          queryParameters: {
                                                                                            'currentChat': serializeParam(
                                                                                              columnChatsRecord,
                                                                                              ParamType.Document,
                                                                                            ),
                                                                                            'photoOnly': serializeParam(
                                                                                              widget.currentLesson?.withPhotoHomework,
                                                                                              ParamType.bool,
                                                                                            ),
                                                                                            'currentTariff': serializeParam(
                                                                                              widget.tariff,
                                                                                              ParamType.DocumentReference,
                                                                                            ),
                                                                                            'courseFree': serializeParam(
                                                                                              widget.freeCourse,
                                                                                              ParamType.bool,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            'currentChat': columnChatsRecord,
                                                                                            kTransitionInfoKey: TransitionInfo(
                                                                                              hasTransition: true,
                                                                                              transitionType: PageTransitionType.fade,
                                                                                              duration: Duration(milliseconds: 0),
                                                                                            ),
                                                                                          },
                                                                                        );
                                                                                      }
                                                                                    },
                                                                                    child: wrapWithModel(
                                                                                      model: _model.buttonModel9,
                                                                                      updateCallback: () => setState(() {}),
                                                                                      child: ButtonWidget(
                                                                                        text: 'Задание на проверке ⏱️',
                                                                                        btnColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        txtColor: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if ((columnChatsRecord != null) && columnChatsRecord!.isFinished)
                                                                                Builder(
                                                                                  builder: (context) => InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      if (MediaQuery.sizeOf(context).width >= kBreakpointLarge) {
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
                                                                                                child: HomeworkAddDesktopWidget(
                                                                                                  onlyPhoto: widget.currentLesson!.withPhotoHomework,
                                                                                                  currentChat: columnChatsRecord,
                                                                                                ),
                                                                                              )),
                                                                                            );
                                                                                          },
                                                                                        ).then((value) => setState(() {}));
                                                                                      } else {
                                                                                        context.pushNamed(
                                                                                          'HomeworkAdded',
                                                                                          queryParameters: {
                                                                                            'currentChat': serializeParam(
                                                                                              columnChatsRecord,
                                                                                              ParamType.Document,
                                                                                            ),
                                                                                            'photoOnly': serializeParam(
                                                                                              widget.currentLesson?.withPhotoHomework,
                                                                                              ParamType.bool,
                                                                                            ),
                                                                                            'currentTariff': serializeParam(
                                                                                              widget.tariff,
                                                                                              ParamType.DocumentReference,
                                                                                            ),
                                                                                            'courseFree': serializeParam(
                                                                                              widget.freeCourse,
                                                                                              ParamType.bool,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            'currentChat': columnChatsRecord,
                                                                                            kTransitionInfoKey: TransitionInfo(
                                                                                              hasTransition: true,
                                                                                              transitionType: PageTransitionType.fade,
                                                                                              duration: Duration(milliseconds: 0),
                                                                                            ),
                                                                                          },
                                                                                        );
                                                                                      }
                                                                                    },
                                                                                    child: wrapWithModel(
                                                                                      model: _model.buttonModel10,
                                                                                      updateCallback: () => setState(() {}),
                                                                                      child: ButtonWidget(
                                                                                        text: 'Задание cдано ✅',
                                                                                        btnColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        txtColor: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              phone: false,
                                                            ))
                                                              Container(
                                                                width: 220.0,
                                                                height: 100.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ].addToEnd(SizedBox(height: 45.0)),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
