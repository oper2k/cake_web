import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'not_finished_model.dart';
export 'not_finished_model.dart';

class NotFinishedWidget extends StatefulWidget {
  const NotFinishedWidget({Key? key}) : super(key: key);

  @override
  _NotFinishedWidgetState createState() => _NotFinishedWidgetState();
}

class _NotFinishedWidgetState extends State<NotFinishedWidget> {
  late NotFinishedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotFinishedModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          CircularPercentIndicator(
            percent: 0.0,
            radius: 12.0,
            lineWidth: 4.0,
            animation: true,
            animateFromLastPercent: true,
            progressColor: FlutterFlowTheme.of(context).green2009F4E,
            backgroundColor: FlutterFlowTheme.of(context).green181C795,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
            child: Text(
              'Не пройден',
              style: FlutterFlowTheme.of(context).labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
