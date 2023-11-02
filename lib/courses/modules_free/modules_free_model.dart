import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_bar_widget.dart';
import '/courses/les_mobile/les_mobile_widget.dart';
import '/courses/lesson_container/lesson_container_widget.dart';
import '/courses/module_item/module_item_widget.dart';
import '/courses/mood_mobile/mood_mobile_widget.dart';
import '/courses/tariff_close/tariff_close_widget.dart';
import '/courses/tariff_close_mobile/tariff_close_mobile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'modules_free_widget.dart' show ModulesFreeWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ModulesFreeModel extends FlutterFlowModel<ModulesFreeWidget> {
  ///  Local state fields for this page.

  ModulesRecord? currentModule;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for appBar component.
  late AppBarModel appBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
