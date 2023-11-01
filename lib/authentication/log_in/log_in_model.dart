import '/authentication/login/login_widget.dart';
import '/authentication/page_wiew/page_wiew_widget.dart';
import '/components/app_bar_minimal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'log_in_widget.dart' show LogInWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LogInModel extends FlutterFlowModel<LogInWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for appBarMinimal component.
  late AppBarMinimalModel appBarMinimalModel;
  // Model for login component.
  late LoginModel loginModel;
  // Model for pageWiew component.
  late PageWiewModel pageWiewModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBarMinimalModel = createModel(context, () => AppBarMinimalModel());
    loginModel = createModel(context, () => LoginModel());
    pageWiewModel = createModel(context, () => PageWiewModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appBarMinimalModel.dispose();
    loginModel.dispose();
    pageWiewModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
