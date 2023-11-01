import '/basket/pay_complete/pay_complete_widget.dart';
import '/components/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'complete_widget.dart' show CompleteWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CompleteModel extends FlutterFlowModel<CompleteWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for appBar component.
  late AppBarModel appBarModel;
  // Model for payComplete component.
  late PayCompleteModel payCompleteModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    payCompleteModel = createModel(context, () => PayCompleteModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appBarModel.dispose();
    payCompleteModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
