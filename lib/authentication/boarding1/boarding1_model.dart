import '/authentication/board1/board1_widget.dart';
import '/authentication/page_wiew/page_wiew_widget.dart';
import '/components/app_bar_minimal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'boarding1_widget.dart' show Boarding1Widget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Boarding1Model extends FlutterFlowModel<Boarding1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for appBarMinimal component.
  late AppBarMinimalModel appBarMinimalModel;
  // Model for board1 component.
  late Board1Model board1Model;
  // Model for pageWiew component.
  late PageWiewModel pageWiewModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBarMinimalModel = createModel(context, () => AppBarMinimalModel());
    board1Model = createModel(context, () => Board1Model());
    pageWiewModel = createModel(context, () => PageWiewModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appBarMinimalModel.dispose();
    board1Model.dispose();
    pageWiewModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
