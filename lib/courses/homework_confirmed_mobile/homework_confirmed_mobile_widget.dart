import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_bar_widget.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'homework_confirmed_mobile_model.dart';
export 'homework_confirmed_mobile_model.dart';

class HomeworkConfirmedMobileWidget extends StatefulWidget {
  const HomeworkConfirmedMobileWidget({
    Key? key,
    this.currentLesson,
    required this.countLesson,
    required this.lessonIndx,
    required this.currentTariff,
  }) : super(key: key);

  final LessonsRecord? currentLesson;
  final int? countLesson;
  final int? lessonIndx;
  final DocumentReference? currentTariff;

  @override
  _HomeworkConfirmedMobileWidgetState createState() =>
      _HomeworkConfirmedMobileWidgetState();
}

class _HomeworkConfirmedMobileWidgetState
    extends State<HomeworkConfirmedMobileWidget> {
  late HomeworkConfirmedMobileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeworkConfirmedMobileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (loggedIn) {
        if ((currentUserDocument?.rlBuyTariffs?.toList() ?? [])
            .contains(widget.currentTariff)) {
          return;
        }

        context.pushNamed('Courses_Old');

        return;
      } else {
        context.pushNamed('Log_In');

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
        body: Visibility(
          visible: responsiveVisibility(
            context: context,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          ),
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
                final columnUsersRecord = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    wrapWithModel(
                      model: _model.appBarModel,
                      updateCallback: () => setState(() {}),
                      child: AppBarWidget(
                        selected: 2,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.safePop();

                                        await columnUsersRecord.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'rl_confirmed_rules_lessons':
                                                  FieldValue.arrayRemove([
                                                widget.currentLesson?.reference
                                              ]),
                                            },
                                          ),
                                        });
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
                                          'Подтвердите выполнение урока',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: RichText(
                                  textScaleFactor:
                                      MediaQuery.of(context).textScaleFactor,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Все права защищены законом.\n',
                                        style: FlutterFlowTheme.of(context)
                                            .displayMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .displayMediumFamily,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displayMediumFamily),
                                              lineHeight: 1.7,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            '・Запрещено пересылать материалы в чатах или любых\n    других ресурсах; \n',
                                        style: FlutterFlowTheme.of(context)
                                            .displayMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .displayMediumFamily,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .displayMediumFamily,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displayMediumFamily),
                                              lineHeight: 1.7,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            '・Делать запись экрана; воспроизводить и распространять \n    материалы; \n',
                                        style: FlutterFlowTheme.of(context)
                                            .displayMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .displayMediumFamily,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displayMediumFamily),
                                              lineHeight: 1.7,
                                            ),
                                      ),
                                      TextSpan(
                                        text: '・Переводить на английский; \n',
                                        style: FlutterFlowTheme.of(context)
                                            .displayMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .displayMediumFamily,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displayMediumFamily),
                                              lineHeight: 1.7,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            '・Использовать в качестве контента для своих курсов и \n    соц.сетей без явного письменного разрешения \n    владельца авторских прав.\n',
                                        style: FlutterFlowTheme.of(context)
                                            .displayMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .displayMediumFamily,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .displayMediumFamily,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displayMediumFamily),
                                              lineHeight: 1.7,
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .displayMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .displayMediumFamily,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .displayMediumFamily),
                                          lineHeight: 1.7,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 80.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Stack(
                                      children: [
                                        if (!columnUsersRecord
                                            .rlConfirmedRulesLessons
                                            .contains(widget
                                                .currentLesson?.reference))
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await columnUsersRecord.reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'rl_confirmed_rules_lessons':
                                                        FieldValue.arrayUnion([
                                                      widget.currentLesson
                                                          ?.reference
                                                    ]),
                                                  },
                                                ),
                                              });
                                            },
                                            child: Container(
                                              width: 20.0,
                                              height: 20.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  width: 1.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (columnUsersRecord
                                            .rlConfirmedRulesLessons
                                            .contains(widget
                                                .currentLesson?.reference))
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await columnUsersRecord.reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'rl_confirmed_rules_lessons':
                                                        FieldValue.arrayRemove([
                                                      widget.currentLesson
                                                          ?.reference
                                                    ]),
                                                  },
                                                ),
                                              });
                                            },
                                            child: Container(
                                              width: 20.0,
                                              height: 20.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                              ),
                                              child: Icon(
                                                Icons.check_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 17.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                                lineHeight: 1.6,
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
                    if (columnUsersRecord.rlConfirmedRulesLessons
                        .contains(widget.currentLesson?.reference))
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                        child: Stack(
                          children: [
                            if ((currentUserDocument?.rlFinishedLessons
                                        ?.toList() ??
                                    [])
                                .contains(widget.currentLesson?.reference))
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => wrapWithModel(
                                    model: _model.buttonModel1,
                                    updateCallback: () => setState(() {}),
                                    child: ButtonWidget(
                                      text: 'Вы прошли урок 🎉',
                                      btnColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      txtColor:
                                          FlutterFlowTheme.of(context).accent1,
                                    ),
                                  ),
                                ),
                              ),
                            if (!columnUsersRecord.rlFinishedLessons
                                .contains(widget.currentLesson?.reference))
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await action_blocks.lessonCompleted(
                                      context,
                                      currentLesson: widget.currentLesson,
                                      userDoc: columnUsersRecord,
                                      allLessonCount: widget.countLesson,
                                      lessonIndex: widget.lessonIndx,
                                    );
                                    context.safePop();
                                  },
                                  child: wrapWithModel(
                                    model: _model.buttonModel2,
                                    updateCallback: () => setState(() {}),
                                    child: ButtonWidget(
                                      text: 'Урок пройден 👍',
                                      btnColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      txtColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
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
          ),
        ),
      ),
    );
  }
}
