import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'info_course_comp_mobile_model.dart';
export 'info_course_comp_mobile_model.dart';

class InfoCourseCompMobileWidget extends StatefulWidget {
  const InfoCourseCompMobileWidget({
    Key? key,
    this.currentCourse,
  }) : super(key: key);

  final CoursesRecord? currentCourse;

  @override
  _InfoCourseCompMobileWidgetState createState() =>
      _InfoCourseCompMobileWidgetState();
}

class _InfoCourseCompMobileWidgetState
    extends State<InfoCourseCompMobileWidget> {
  late InfoCourseCompMobileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InfoCourseCompMobileModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FutureBuilder<List<CourseTeacherRecord>>(
            future: queryCourseTeacherRecordOnce(
              queryBuilder: (courseTeacherRecord) => courseTeacherRecord.where(
                'name',
                isEqualTo: widget.currentCourse?.teacherString,
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
              List<CourseTeacherRecord> circleImageCourseTeacherRecordList =
                  snapshot.data!;
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final circleImageCourseTeacherRecord =
                  circleImageCourseTeacherRecordList.isNotEmpty
                      ? circleImageCourseTeacherRecordList.first
                      : null;
              return Container(
                width: 40.0,
                height: 40.0,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  circleImageCourseTeacherRecord!.image,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: Container(
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
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Поздравляю с успешным завершением обучения. Теперь вы можете скачать сертификат и похвастаться им в соц. сетях  🥳',
                                  style: FlutterFlowTheme.of(context)
                                      .displayMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .displayMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        fontSize: 12.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .displayMediumFamily),
                                        lineHeight: 1.6,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Скачать сертификат',
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Icon(
                                          FFIcons.kright,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 12.0,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
