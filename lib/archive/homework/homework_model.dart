import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_bar_widget.dart';
import '/components/button_widget.dart';
import '/courses/homework_add_desktop/homework_add_desktop_widget.dart';
import '/courses/roadmap_item/roadmap_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'homework_widget.dart' show HomeworkWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HomeworkModel extends FlutterFlowModel<HomeworkWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for appBar component.
  late AppBarModel appBarModel;
  // Model for button component.
  late ButtonModel buttonModel1;
  // Model for button component.
  late ButtonModel buttonModel2;
  // Model for button component.
  late ButtonModel buttonModel3;
  // Model for button component.
  late ButtonModel buttonModel4;
  // Model for button component.
  late ButtonModel buttonModel5;
  // Model for button component.
  late ButtonModel buttonModel6;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
    buttonModel3 = createModel(context, () => ButtonModel());
    buttonModel4 = createModel(context, () => ButtonModel());
    buttonModel5 = createModel(context, () => ButtonModel());
    buttonModel6 = createModel(context, () => ButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appBarModel.dispose();
    buttonModel1.dispose();
    buttonModel2.dispose();
    buttonModel3.dispose();
    buttonModel4.dispose();
    buttonModel5.dispose();
    buttonModel6.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
