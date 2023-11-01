import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'info_continue_course_model.dart';
export 'info_continue_course_model.dart';

class InfoContinueCourseWidget extends StatefulWidget {
  const InfoContinueCourseWidget({
    Key? key,
    this.currentCourse,
    this.currentTariff,
  }) : super(key: key);

  final CoursesRecord? currentCourse;
  final TariffsRecord? currentTariff;

  @override
  _InfoContinueCourseWidgetState createState() =>
      _InfoContinueCourseWidgetState();
}

class _InfoContinueCourseWidgetState extends State<InfoContinueCourseWidget> {
  late InfoContinueCourseModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InfoContinueCourseModel());

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
      width: 350.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 12.0,
            color: FlutterFlowTheme.of(context).accent4,
            offset: Offset(0.0, 4.0),
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    'Modules',
                    queryParameters: {
                      'currentCourse': serializeParam(
                        widget.currentCourse,
                        ParamType.Document,
                      ),
                      'tariffRef': serializeParam(
                        widget.currentTariff?.reference,
                        ParamType.DocumentReference,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      'currentCourse': widget.currentCourse,
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: RichText(
                        textScaleFactor: MediaQuery.of(context).textScaleFactor,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Продолжить курс\n',
                              style: FlutterFlowTheme.of(context).labelSmall,
                            ),
                            TextSpan(
                              text: '«',
                              style: FlutterFlowTheme.of(context).labelSmall,
                            ),
                            TextSpan(
                              text: widget.currentCourse!.name,
                              style: FlutterFlowTheme.of(context).labelSmall,
                            ),
                            TextSpan(
                              text: '»? ',
                              style: FlutterFlowTheme.of(context).labelSmall,
                            )
                          ],
                          style: FlutterFlowTheme.of(context).labelSmall,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Text(
                        widget.currentCourse!.countLessonsString,
                        style:
                            FlutterFlowTheme.of(context).displayMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .displayMediumFamily,
                                  color: FlutterFlowTheme.of(context).accent1,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .displayMediumFamily),
                                ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          widget.currentCourse!.image,
                          width: 76.0,
                          height: 76.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.updatePage(() {
                              FFAppState().showContinueCourse = 0;
                            });
                          },
                          child: Container(
                            width: 16.0,
                            height: 16.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent3,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              FFIcons.kclose,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: 8.0,
                            ),
                          ),
                        ),
                      ),
                    ],
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
