import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'homework_success_info_model.dart';
export 'homework_success_info_model.dart';

class HomeworkSuccessInfoWidget extends StatefulWidget {
  const HomeworkSuccessInfoWidget({Key? key}) : super(key: key);

  @override
  _HomeworkSuccessInfoWidgetState createState() =>
      _HomeworkSuccessInfoWidgetState();
}

class _HomeworkSuccessInfoWidgetState extends State<HomeworkSuccessInfoWidget> {
  late HomeworkSuccessInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeworkSuccessInfoModel());

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

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
          child: Container(
            width: 125.0,
            height: 28.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).green2009F4E,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 16.0,
                    height: 16.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      FFIcons.kcheckmark,
                      color: FlutterFlowTheme.of(context).green2009F4E,
                      size: 10.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Задание сдано',
                      style: FlutterFlowTheme.of(context)
                          .displayMedium
                          .override(
                            fontFamily: FlutterFlowTheme.of(context)
                                .displayMediumFamily,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context)
                                    .displayMediumFamily),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 18.0),
          child: Text(
            'Переходите к следующему модулю',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).displayMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).displayMediumFamily,
                  color: FlutterFlowTheme.of(context).black3666666,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).displayMediumFamily),
                  lineHeight: 1.4,
                ),
          ),
        ),
      ],
    );
  }
}
