import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_bar_widget.dart';
import '/courses/chat_comp/chat_comp_widget.dart';
import '/courses/homework_look/homework_look_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'homework_added_widget.dart' show HomeworkAddedWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeworkAddedModel extends FlutterFlowModel<HomeworkAddedWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for appBar component.
  late AppBarModel appBarModel;
  // Model for chatComp component.
  late ChatCompModel chatCompModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    chatCompModel = createModel(context, () => ChatCompModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appBarModel.dispose();
    chatCompModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
