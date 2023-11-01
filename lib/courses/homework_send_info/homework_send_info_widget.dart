import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'homework_send_info_model.dart';
export 'homework_send_info_model.dart';

class HomeworkSendInfoWidget extends StatefulWidget {
  const HomeworkSendInfoWidget({Key? key}) : super(key: key);

  @override
  _HomeworkSendInfoWidgetState createState() => _HomeworkSendInfoWidgetState();
}

class _HomeworkSendInfoWidgetState extends State<HomeworkSendInfoWidget> {
  late HomeworkSendInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeworkSendInfoModel());

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
            width: 159.0,
            height: 28.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryText,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FFIcons.kcheckmark,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Задание отправлено',
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
            'Ожидайте ответа преподавателя.\nЕсли необходимо, добавьте новые данные или файлы ',
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
