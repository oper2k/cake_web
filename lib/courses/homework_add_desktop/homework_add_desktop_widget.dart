import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/courses/chat_comp/chat_comp_widget.dart';
import '/courses/roadmap_item/roadmap_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'homework_add_desktop_model.dart';
export 'homework_add_desktop_model.dart';

class HomeworkAddDesktopWidget extends StatefulWidget {
  const HomeworkAddDesktopWidget({
    Key? key,
    required this.onlyPhoto,
    this.currentChat,
  }) : super(key: key);

  final bool? onlyPhoto;
  final ChatsRecord? currentChat;

  @override
  _HomeworkAddDesktopWidgetState createState() =>
      _HomeworkAddDesktopWidgetState();
}

class _HomeworkAddDesktopWidgetState extends State<HomeworkAddDesktopWidget>
    with TickerProviderStateMixin {
  late HomeworkAddDesktopModel _model;

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
    _model = createModel(context, () => HomeworkAddDesktopModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await widget.currentChat!.reference.update({
        ...mapToFirestore(
          {
            'last_message_seen_by':
                FieldValue.arrayUnion([currentUserReference]),
          },
        ),
      });
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
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(112.0, 85.0, 112.0, 89.0),
      child: StreamBuilder<LessonsRecord>(
        stream: LessonsRecord.getDocument(widget.currentChat!.rlLesson!),
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
          final containerLessonsRecord = snapshot.data!;
          return ClipRRect(
            borderRadius: BorderRadius.circular(24.0),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32.0, 32.0, 32.0, 32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Сдать домашнее задание',
                          style: FlutterFlowTheme.of(context).bodyLarge,
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 360.0,
                          height: MediaQuery.sizeOf(context).height * 0.7,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final allAdditionalButton =
                                    containerLessonsRecord.additionalInfoButton
                                        .toList();
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(
                                            allAdditionalButton.length,
                                            (allAdditionalButtonIndex) {
                                      final allAdditionalButtonItem =
                                          allAdditionalButton[
                                              allAdditionalButtonIndex];
                                      return RoadmapItemWidget(
                                        key: Key(
                                            'Keyq89_${allAdditionalButtonIndex}_of_${allAdditionalButton.length}'),
                                        itemInList: allAdditionalButtonIndex,
                                        lessonCount: containerLessonsRecord
                                            .additionalInfoButton.length,
                                        currentAdditionalButton:
                                            allAdditionalButtonItem,
                                      );
                                    })
                                        .divide(SizedBox(height: 18.0))
                                        .addToStart(SizedBox(height: 20.0))
                                        .addToEnd(SizedBox(height: 40.0)),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: MediaQuery.sizeOf(context).height * 0.65,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      32.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.65,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 20.0),
                                      child: wrapWithModel(
                                        model: _model.chatCompModel,
                                        updateCallback: () => setState(() {}),
                                        updateOnChange: true,
                                        child: ChatCompWidget(
                                          onlyPhoto: widget.onlyPhoto,
                                          currentChat: widget.currentChat!,
                                          currentLesson: containerLessonsRecord,
                                        ),
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
                  ].addToStart(SizedBox(height: 1.0)),
                ),
              ),
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
        },
      ),
    );
  }
}
