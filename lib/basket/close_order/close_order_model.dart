import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'close_order_widget.dart' show CloseOrderWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CloseOrderModel extends FlutterFlowModel<CloseOrderWidget> {
  ///  State fields for stateful widgets in this component.

  UsersRecord? containerPreviousSnapshot;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  TariffsRecord? fisrtTariffsInBasketMob;
  // Stores action output result for [Backend Call - API (send email register)] action in Container widget.
  ApiCallResponse? apiResults3fCopy;
  // Model for button component.
  late ButtonModel buttonModel1;
  // Model for button component.
  late ButtonModel buttonModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
  }

  void dispose() {
    buttonModel1.dispose();
    buttonModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
