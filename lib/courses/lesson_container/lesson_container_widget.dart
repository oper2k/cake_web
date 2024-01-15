import '/backend/backend.dart';
import '/courses/finished/finished_widget.dart';
import '/courses/not_finished/not_finished_widget.dart';
import '/courses/photto_item/photto_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'lesson_container_model.dart';
export 'lesson_container_model.dart';

class LessonContainerWidget extends StatefulWidget {
  const LessonContainerWidget({
    Key? key,
    this.currentLesson,
    this.userDoc,
    this.currentState,
  }) : super(key: key);

  final LessonsRecord? currentLesson;
  final UsersRecord? userDoc;
  final int? currentState;

  @override
  _LessonContainerWidgetState createState() => _LessonContainerWidgetState();
}

class _LessonContainerWidgetState extends State<LessonContainerWidget> {
  late LessonContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LessonContainerModel());

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

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(24.0),
      ),
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.phottoItemModel,
                    updateCallback: () => setState(() {}),
                    child: PhottoItemWidget(
                      currentState: widget.currentState,
                      image: widget.currentLesson?.image,
                    ),
                  ),
                ]
                    .divide(SizedBox(width: 12.0))
                    .addToStart(SizedBox(width: 24.0))
                    .addToEnd(SizedBox(width: 24.0)),
              ),
            ),
            if (widget.userDoc?.rlFinishedLessons
                    ?.contains(widget.currentLesson?.reference) ??
                true)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                child: wrapWithModel(
                  model: _model.finishedModel,
                  updateCallback: () => setState(() {}),
                  child: FinishedWidget(),
                ),
              ),
            if (!widget.userDoc!.rlFinishedLessons
                .contains(widget.currentLesson?.reference))
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                child: wrapWithModel(
                  model: _model.notFinishedModel,
                  updateCallback: () => setState(() {}),
                  child: NotFinishedWidget(),
                ),
              ),
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
                      child: AutoSizeText(
                        widget.currentLesson!.name,
                        style: FlutterFlowTheme.of(context).bodyLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (widget.currentState == 1)
              Flexible(
                child: Stack(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 8.0, 24.0, 0.0),
                            child: AutoSizeText(
                              'Урок откроется: ${valueOrDefault<String>(
                                functions.dateOnRussian(
                                    widget.currentLesson?.openDate),
                                'Нет даты',
                              )}',
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodySmallFamily,
                                    color: FlutterFlowTheme.of(context).accent1,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodySmallFamily),
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
                    child: Text(
                      widget.currentLesson!.subname,
                      maxLines: 4,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodySmallFamily,
                            color: FlutterFlowTheme.of(context).accent1,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodySmallFamily),
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
