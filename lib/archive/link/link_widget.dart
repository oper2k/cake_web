import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'link_model.dart';
export 'link_model.dart';

class LinkWidget extends StatefulWidget {
  const LinkWidget({
    Key? key,
    String? text,
    required this.icon,
    required this.color,
    Color? iconColor,
  })  : this.text = text ?? 'nothing',
        this.iconColor = iconColor ?? const Color(0xFFF3F4F5),
        super(key: key);

  final String text;
  final Widget? icon;
  final Color? color;
  final Color iconColor;

  @override
  _LinkWidgetState createState() => _LinkWidgetState();
}

class _LinkWidgetState extends State<LinkWidget> {
  late LinkModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LinkModel());

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
      width: 290.0,
      height: 52.0,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.icon!,
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
              child: Text(
                'Вступить в чат курса',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
