import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/courses/chat_comp/chat_comp_widget.dart';
import '/courses/roadmap_item/roadmap_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'homework_add_desktop_widget.dart' show HomeworkAddDesktopWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeworkAddDesktopModel
    extends FlutterFlowModel<HomeworkAddDesktopWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for chatComp component.
  late ChatCompModel chatCompModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    chatCompModel = createModel(context, () => ChatCompModel());
  }

  void dispose() {
    chatCompModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
