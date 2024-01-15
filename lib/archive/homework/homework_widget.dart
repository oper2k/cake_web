import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/app_bar_widget.dart';
import '/components/button_widget.dart';
import '/courses/homework_add_desktop/homework_add_desktop_widget.dart';
import '/courses/roadmap_item/roadmap_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'homework_model.dart';
export 'homework_model.dart';

class HomeworkWidget extends StatefulWidget {
  const HomeworkWidget({
    Key? key,
    required this.lesson,
    required this.allLessCount,
    required this.indexInList,
    required this.courseFree,
    required this.tariff,
  }) : super(key: key);

  final LessonsRecord? lesson;
  final int? allLessCount;
  final int? indexInList;
  final bool? courseFree;
  final DocumentReference? tariff;

  @override
  _HomeworkWidgetState createState() => _HomeworkWidgetState();
}

class _HomeworkWidgetState extends State<HomeworkWidget> {
  late HomeworkModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeworkModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.courseFree == true) {
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
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
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
                final containerUsersRecord = snapshot.data!;
                return Container(
                  constraints: BoxConstraints(
                    maxWidth: 1250.0,
                  ),
                  decoration: BoxDecoration(),
                  child: StreamBuilder<List<ChatsRecord>>(
                    stream: queryChatsRecord(
                      queryBuilder: (chatsRecord) => chatsRecord
                          .where(
                            'user_client',
                            isEqualTo: containerUsersRecord.reference,
                          )
                          .where(
                            'rl_lesson',
                            isEqualTo: widget.lesson?.reference,
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
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      List<ChatsRecord> rowChatsRecordList = snapshot.data!;
                      final rowChatsRecord = rowChatsRecordList.isNotEmpty
                          ? rowChatsRecordList.first
                          : null;
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                wrapWithModel(
                                  model: _model.appBarModel,
                                  updateCallback: () => setState(() {}),
                                  child: AppBarWidget(
                                    selected: 0,
                                  ),
                                ),
                                Container(
                                  width: 100.0,
                                  height: 16.0,
                                  decoration: BoxDecoration(),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
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
                                                          context.safePop();
                                                        },
                                                        child: Container(
                                                          width: 24.0,
                                                          height: 24.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Icon(
                                                            FFIcons.kleftTo,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 16.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Домашнее задание',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineMedium,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    if ((!(rowChatsRecord !=
                                                                null) ||
                                                            ((rowChatsRecord !=
                                                                    null) &&
                                                                (rowChatsRecord
                                                                        ?.lastMessageSentBy !=
                                                                    containerUsersRecord
                                                                        .reference) &&
                                                                !valueOrDefault<
                                                                    bool>(
                                                                  rowChatsRecord
                                                                      ?.isFinished,
                                                                  false,
                                                                ))) &&
                                                        responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                          tablet: false,
                                                          tabletLandscape:
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
                                                          await action_blocks
                                                              .sendHomework(
                                                            context,
                                                            currentLesson:
                                                                widget.lesson,
                                                            userDoc:
                                                                containerUsersRecord,
                                                            allLessonCount: widget
                                                                .allLessCount,
                                                            indexLesson: widget
                                                                .indexInList,
                                                            currentChat:
                                                                rowChatsRecord,
                                                            currentTariff:
                                                                widget.tariff,
                                                          );
                                                        },
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .buttonModel1,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child: ButtonWidget(
                                                            text:
                                                                'Сдать домашнее задание ✍️',
                                                            btnColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            txtColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                        ),
                                                      ),
                                                    if (((rowChatsRecord !=
                                                                null) &&
                                                            (rowChatsRecord
                                                                    ?.lastMessageSentBy ==
                                                                containerUsersRecord
                                                                    .reference) &&
                                                            !valueOrDefault<
                                                                bool>(
                                                              rowChatsRecord
                                                                  ?.isFinished,
                                                              false,
                                                            )) &&
                                                        responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                          tablet: false,
                                                          tabletLandscape:
                                                              false,
                                                        ))
                                                      Builder(
                                                        builder: (context) =>
                                                            InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (MediaQuery.sizeOf(
                                                                        context)
                                                                    .width >=
                                                                kBreakpointLarge) {
                                                              await showDialog(
                                                                barrierDismissible:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child: WebViewAware(
                                                                        child: GestureDetector(
                                                                      onTap: () => _model
                                                                              .unfocusNode
                                                                              .canRequestFocus
                                                                          ? FocusScope.of(context).requestFocus(_model
                                                                              .unfocusNode)
                                                                          : FocusScope.of(context)
                                                                              .unfocus(),
                                                                      child:
                                                                          HomeworkAddDesktopWidget(
                                                                        onlyPhoto: widget
                                                                            .lesson!
                                                                            .withPhotoHomework,
                                                                        currentChat:
                                                                            rowChatsRecord,
                                                                      ),
                                                                    )),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));
                                                            } else {
                                                              context.pushNamed(
                                                                'HomeworkAdded',
                                                                queryParameters:
                                                                    {
                                                                  'currentChat':
                                                                      serializeParam(
                                                                    rowChatsRecord,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                  'photoOnly':
                                                                      serializeParam(
                                                                    widget
                                                                        .lesson
                                                                        ?.withPhotoHomework,
                                                                    ParamType
                                                                        .bool,
                                                                  ),
                                                                  'currentTariff':
                                                                      serializeParam(
                                                                    widget
                                                                        .tariff,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'currentChat':
                                                                      rowChatsRecord,
                                                                  kTransitionInfoKey:
                                                                      TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .fade,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            0),
                                                                  ),
                                                                },
                                                              );
                                                            }
                                                          },
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .buttonModel2,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child: ButtonWidget(
                                                              text:
                                                                  'Задание на проверке ⏱️',
                                                              btnColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              txtColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              btnWidth: 275,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (((rowChatsRecord !=
                                                                null) &&
                                                            rowChatsRecord!
                                                                .isFinished) &&
                                                        responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                          tablet: false,
                                                          tabletLandscape:
                                                              false,
                                                        ))
                                                      Builder(
                                                        builder: (context) =>
                                                            InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (MediaQuery.sizeOf(
                                                                        context)
                                                                    .width >=
                                                                kBreakpointLarge) {
                                                              await showDialog(
                                                                barrierDismissible:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child: WebViewAware(
                                                                        child: GestureDetector(
                                                                      onTap: () => _model
                                                                              .unfocusNode
                                                                              .canRequestFocus
                                                                          ? FocusScope.of(context).requestFocus(_model
                                                                              .unfocusNode)
                                                                          : FocusScope.of(context)
                                                                              .unfocus(),
                                                                      child:
                                                                          HomeworkAddDesktopWidget(
                                                                        onlyPhoto: widget
                                                                            .lesson!
                                                                            .withPhotoHomework,
                                                                        currentChat:
                                                                            rowChatsRecord,
                                                                      ),
                                                                    )),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));
                                                            } else {
                                                              context.pushNamed(
                                                                'HomeworkAdded',
                                                                queryParameters:
                                                                    {
                                                                  'currentChat':
                                                                      serializeParam(
                                                                    rowChatsRecord,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                  'photoOnly':
                                                                      serializeParam(
                                                                    widget
                                                                        .lesson
                                                                        ?.withPhotoHomework,
                                                                    ParamType
                                                                        .bool,
                                                                  ),
                                                                  'currentTariff':
                                                                      serializeParam(
                                                                    widget
                                                                        .tariff,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'currentChat':
                                                                      rowChatsRecord,
                                                                  kTransitionInfoKey:
                                                                      TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .fade,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            0),
                                                                  ),
                                                                },
                                                              );
                                                            }
                                                          },
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .buttonModel3,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child: ButtonWidget(
                                                              text:
                                                                  'Задание cдано ✅',
                                                              btnColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              txtColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              btnWidth: 215,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Wrap(
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
                                              Container(
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  32.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Домашнее задание',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge,
                                                      ),
                                                    ),
                                                    Builder(
                                                      builder: (context) {
                                                        final additionalInfoButton =
                                                            widget.lesson
                                                                    ?.additionalInfoButton
                                                                    ?.toList() ??
                                                                [];
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: List.generate(
                                                              additionalInfoButton
                                                                  .length,
                                                              (additionalInfoButtonIndex) {
                                                            final additionalInfoButtonItem =
                                                                additionalInfoButton[
                                                                    additionalInfoButtonIndex];
                                                            return RoadmapItemWidget(
                                                              key: Key(
                                                                  'Key5wr_${additionalInfoButtonIndex}_of_${additionalInfoButton.length}'),
                                                              itemInList:
                                                                  additionalInfoButtonIndex,
                                                              lessonCount: widget
                                                                  .lesson
                                                                  ?.additionalInfoButton
                                                                  ?.length,
                                                              currentAdditionalButton:
                                                                  additionalInfoButtonItem,
                                                            );
                                                          }).addToStart(
                                                              SizedBox(
                                                                  height:
                                                                      20.0)),
                                                        );
                                                      },
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  32.0,
                                                                  0.0,
                                                                  80.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                if (!(rowChatsRecord !=
                                                                        null) ||
                                                                    ((rowChatsRecord !=
                                                                            null) &&
                                                                        (rowChatsRecord?.lastMessageSentBy !=
                                                                            containerUsersRecord
                                                                                .reference) &&
                                                                        !valueOrDefault<
                                                                            bool>(
                                                                          rowChatsRecord
                                                                              ?.isFinished,
                                                                          false,
                                                                        )))
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
                                                                      await action_blocks
                                                                          .sendHomework(
                                                                        context,
                                                                        currentLesson:
                                                                            widget.lesson,
                                                                        userDoc:
                                                                            containerUsersRecord,
                                                                        allLessonCount:
                                                                            widget.allLessCount,
                                                                        indexLesson:
                                                                            widget.indexInList,
                                                                        currentChat:
                                                                            rowChatsRecord,
                                                                        currentTariff:
                                                                            widget.tariff,
                                                                      );
                                                                    },
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .buttonModel4,
                                                                      updateCallback:
                                                                          () =>
                                                                              setState(() {}),
                                                                      child:
                                                                          ButtonWidget(
                                                                        text:
                                                                            'Сдать домашнее задание ✍️',
                                                                        btnColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        txtColor:
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((rowChatsRecord !=
                                                                        null) &&
                                                                    (rowChatsRecord
                                                                            ?.lastMessageSentBy ==
                                                                        containerUsersRecord
                                                                            .reference) &&
                                                                    !valueOrDefault<
                                                                        bool>(
                                                                      rowChatsRecord
                                                                          ?.isFinished,
                                                                      false,
                                                                    ))
                                                                  Builder(
                                                                    builder:
                                                                        (context) =>
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
                                                                        if (MediaQuery.sizeOf(context).width >=
                                                                            kBreakpointLarge) {
                                                                          await showDialog(
                                                                            barrierDismissible:
                                                                                false,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (dialogContext) {
                                                                              return Dialog(
                                                                                insetPadding: EdgeInsets.zero,
                                                                                backgroundColor: Colors.transparent,
                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                child: WebViewAware(
                                                                                    child: GestureDetector(
                                                                                  onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                  child: HomeworkAddDesktopWidget(
                                                                                    onlyPhoto: widget.lesson!.withPhotoHomework,
                                                                                    currentChat: rowChatsRecord,
                                                                                  ),
                                                                                )),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              setState(() {}));
                                                                        } else {
                                                                          context
                                                                              .pushNamed(
                                                                            'HomeworkAdded',
                                                                            queryParameters:
                                                                                {
                                                                              'currentChat': serializeParam(
                                                                                rowChatsRecord,
                                                                                ParamType.Document,
                                                                              ),
                                                                              'photoOnly': serializeParam(
                                                                                widget.lesson?.withPhotoHomework,
                                                                                ParamType.bool,
                                                                              ),
                                                                              'currentTariff': serializeParam(
                                                                                widget.tariff,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'currentChat': rowChatsRecord,
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
                                                                          wrapWithModel(
                                                                        model: _model
                                                                            .buttonModel5,
                                                                        updateCallback:
                                                                            () =>
                                                                                setState(() {}),
                                                                        child:
                                                                            ButtonWidget(
                                                                          text:
                                                                              'Задание на проверке ⏱️',
                                                                          btnColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          txtColor:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          btnWidth:
                                                                              275,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((rowChatsRecord !=
                                                                        null) &&
                                                                    rowChatsRecord!
                                                                        .isFinished)
                                                                  Builder(
                                                                    builder:
                                                                        (context) =>
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
                                                                        if (MediaQuery.sizeOf(context).width >=
                                                                            kBreakpointLarge) {
                                                                          await showDialog(
                                                                            barrierDismissible:
                                                                                false,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (dialogContext) {
                                                                              return Dialog(
                                                                                insetPadding: EdgeInsets.zero,
                                                                                backgroundColor: Colors.transparent,
                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                child: WebViewAware(
                                                                                    child: GestureDetector(
                                                                                  onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                  child: HomeworkAddDesktopWidget(
                                                                                    onlyPhoto: widget.lesson!.withPhotoHomework,
                                                                                    currentChat: rowChatsRecord,
                                                                                  ),
                                                                                )),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              setState(() {}));
                                                                        } else {
                                                                          context
                                                                              .pushNamed(
                                                                            'HomeworkAdded',
                                                                            queryParameters:
                                                                                {
                                                                              'currentChat': serializeParam(
                                                                                rowChatsRecord,
                                                                                ParamType.Document,
                                                                              ),
                                                                              'photoOnly': serializeParam(
                                                                                widget.lesson?.withPhotoHomework,
                                                                                ParamType.bool,
                                                                              ),
                                                                              'currentTariff': serializeParam(
                                                                                widget.tariff,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'currentChat': rowChatsRecord,
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
                                                                          wrapWithModel(
                                                                        model: _model
                                                                            .buttonModel6,
                                                                        updateCallback:
                                                                            () =>
                                                                                setState(() {}),
                                                                        child:
                                                                            ButtonWidget(
                                                                          text:
                                                                              'Задание cдано ✅',
                                                                          btnColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          txtColor:
                                                                              FlutterFlowTheme.of(context).primaryText,
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
                                                  ].addToStart(
                                                      SizedBox(height: 1.0)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
