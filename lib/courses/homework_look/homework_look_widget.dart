import '/backend/backend.dart';
import '/courses/roadmap_item/roadmap_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'homework_look_model.dart';
export 'homework_look_model.dart';

class HomeworkLookWidget extends StatefulWidget {
  const HomeworkLookWidget({
    Key? key,
    required this.currentLesson,
  }) : super(key: key);

  final LessonsRecord? currentLesson;

  @override
  _HomeworkLookWidgetState createState() => _HomeworkLookWidgetState();
}

class _HomeworkLookWidgetState extends State<HomeworkLookWidget>
    with TickerProviderStateMixin {
  late HomeworkLookModel _model;

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
    _model = createModel(context, () => HomeworkLookModel());

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

    return Align(
      alignment: AlignmentDirectional(0.00, 0.00),
      child: Container(
        width: 592.0,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.9,
        ),
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
                children: [
                  Text(
                    'Домашнее задание',
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
              Flexible(
                child: Builder(
                  builder: (context) {
                    final allAdditionButton =
                        widget.currentLesson?.additionalInfoButton?.toList() ??
                            [];
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(allAdditionButton.length,
                                (allAdditionButtonIndex) {
                          final allAdditionButtonItem =
                              allAdditionButton[allAdditionButtonIndex];
                          return RoadmapItemWidget(
                            key: Key(
                                'Keywdk_${allAdditionButtonIndex}_of_${allAdditionButton.length}'),
                            itemInList: allAdditionButtonIndex,
                            lessonCount: widget
                                .currentLesson?.additionalInfoButton?.length,
                            currentAdditionalButton: allAdditionButtonItem,
                          );
                        })
                            .divide(SizedBox(height: 18.0))
                            .addToStart(SizedBox(height: 20.0)),
                      ),
                    );
                  },
                ),
              ),
            ].addToStart(SizedBox(height: 1.0)),
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
