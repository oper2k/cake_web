import '/backend/backend.dart';
import '/courses/finished/finished_widget.dart';
import '/courses/not_finished/not_finished_widget.dart';
import '/courses/photto_item/photto_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'lesson_container_widget.dart' show LessonContainerWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LessonContainerModel extends FlutterFlowModel<LessonContainerWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for phottoItem component.
  late PhottoItemModel phottoItemModel;
  // Model for Finished component.
  late FinishedModel finishedModel;
  // Model for notFinished component.
  late NotFinishedModel notFinishedModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    phottoItemModel = createModel(context, () => PhottoItemModel());
    finishedModel = createModel(context, () => FinishedModel());
    notFinishedModel = createModel(context, () => NotFinishedModel());
  }

  void dispose() {
    phottoItemModel.dispose();
    finishedModel.dispose();
    notFinishedModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
