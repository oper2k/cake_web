import '/authentication/page_wiew/page_wiew_widget.dart';
import '/authentication/password_restore/password_restore_widget.dart';
import '/components/app_bar_minimal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pass_restore_model.dart';
export 'pass_restore_model.dart';

class PassRestoreWidget extends StatefulWidget {
  const PassRestoreWidget({Key? key}) : super(key: key);

  @override
  _PassRestoreWidgetState createState() => _PassRestoreWidgetState();
}

class _PassRestoreWidgetState extends State<PassRestoreWidget> {
  late PassRestoreModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PassRestoreModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Stack(
                children: [
                  wrapWithModel(
                    model: _model.appBarMinimalModel,
                    updateCallback: () => setState(() {}),
                    child: AppBarMinimalWidget(),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: wrapWithModel(
                      model: _model.passwordRestoreModel,
                      updateCallback: () => setState(() {}),
                      child: PasswordRestoreWidget(),
                    ),
                  ),
                ],
              ),
            ),
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
              tabletLandscape: false,
            ))
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 20.0, 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: wrapWithModel(
                        model: _model.pageWiewModel,
                        updateCallback: () => setState(() {}),
                        child: PageWiewWidget(),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
