import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_bar_minimal_model.dart';
export 'app_bar_minimal_model.dart';

class AppBarMinimalWidget extends StatefulWidget {
  const AppBarMinimalWidget({Key? key}) : super(key: key);

  @override
  _AppBarMinimalWidgetState createState() => _AppBarMinimalWidgetState();
}

class _AppBarMinimalWidgetState extends State<AppBarMinimalWidget> {
  late AppBarMinimalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppBarMinimalModel());

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

    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: () {
            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
              return 0.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
              return 20.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
              return 94.0;
            } else {
              return 94.0;
            }
          }(),
          height: () {
            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
              return 48.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
              return 64.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
              return 64.0;
            } else {
              return 64.0;
            }
          }(),
          decoration: BoxDecoration(),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
          child: Container(
            height: valueOrDefault<double>(
              () {
                if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                  return 32.0;
                } else if (MediaQuery.sizeOf(context).width <
                    kBreakpointMedium) {
                  return 40.0;
                } else if (MediaQuery.sizeOf(context).width <
                    kBreakpointLarge) {
                  return 40.0;
                } else {
                  return 40.0;
                }
              }(),
              0.0,
            ),
            decoration: BoxDecoration(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.asset(
                'assets/images/CakeSchool.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
