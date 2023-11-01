import '/backend/backend.dart';
import '/courses/photto_item/photto_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'les_mobile_widget.dart' show LesMobileWidget;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class LesMobileModel extends FlutterFlowModel<LesMobileWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for phottoItem component.
  late PhottoItemModel phottoItemModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    phottoItemModel = createModel(context, () => PhottoItemModel());
  }

  void dispose() {
    phottoItemModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
