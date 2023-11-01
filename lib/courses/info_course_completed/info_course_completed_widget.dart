import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'info_course_completed_model.dart';
export 'info_course_completed_model.dart';

class InfoCourseCompletedWidget extends StatefulWidget {
  const InfoCourseCompletedWidget({Key? key}) : super(key: key);

  @override
  _InfoCourseCompletedWidgetState createState() =>
      _InfoCourseCompletedWidgetState();
}

class _InfoCourseCompletedWidgetState extends State<InfoCourseCompletedWidget> {
  late InfoCourseCompletedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InfoCourseCompletedModel());

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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Поздравляю с успешным завершением обучения. Теперь вы можете скачать сертификат и похвастаться им в соц. сетях  🥳',
                    style: FlutterFlowTheme.of(context).displayMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).displayMediumFamily,
                          color: FlutterFlowTheme.of(context).accent1,
                          fontSize: 12.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).displayMediumFamily),
                          lineHeight: 1.6,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
