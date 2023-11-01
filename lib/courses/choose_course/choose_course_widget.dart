import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'choose_course_model.dart';
export 'choose_course_model.dart';

class ChooseCourseWidget extends StatefulWidget {
  const ChooseCourseWidget({Key? key}) : super(key: key);

  @override
  _ChooseCourseWidgetState createState() => _ChooseCourseWidgetState();
}

class _ChooseCourseWidgetState extends State<ChooseCourseWidget> {
  late ChooseCourseModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseCourseModel());

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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: Image.asset(
              'assets/images/cook.png',
              width: 72.0,
              height: 72.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Text(
              'Нет купленных курсов',
              style: FlutterFlowTheme.of(context).bodyLarge,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Text(
              'Давайте уже начнём обучение.  Но для начала курс нужно купить',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: FlutterFlowTheme.of(context).accent1,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: wrapWithModel(
              model: _model.buttonModel,
              updateCallback: () => setState(() {}),
              child: ButtonWidget(
                text: 'Выбрать курс',
                btnColor: FlutterFlowTheme.of(context).primaryText,
                txtColor: FlutterFlowTheme.of(context).primaryBackground,
                btnWidth: 206,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
