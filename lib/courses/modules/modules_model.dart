import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_bar_widget.dart';
import '/components/button_widget.dart';
import '/courses/info_course_comp_mobile/info_course_comp_mobile_widget.dart';
import '/courses/info_course_completed/info_course_completed_widget.dart';
import '/courses/les_mobile/les_mobile_widget.dart';
import '/courses/lesson_container/lesson_container_widget.dart';
import '/courses/module_item/module_item_widget.dart';
import '/courses/mood_mobile/mood_mobile_widget.dart';
import '/courses/tariff_change/tariff_change_widget.dart';
import '/courses/tariff_change_mobile/tariff_change_mobile_widget.dart';
import '/courses/tariff_close/tariff_close_widget.dart';
import '/courses/tariff_close_mobile/tariff_close_mobile_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'modules_widget.dart' show ModulesWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModulesModel extends FlutterFlowModel<ModulesWidget> {
  ///  Local state fields for this page.

  ModulesRecord? currentModule;

  bool showSert = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Modules widget.
  int? countLessonsWithHomework;
  // Stores action output result for [Firestore Query - Query a collection] action in Modules widget.
  List<LessonsRecord>? allLessonsWithHomework;
  // Stores action output result for [Firestore Query - Query a collection] action in Modules widget.
  int? countLessonWithPhoto;
  // Stores action output result for [Firestore Query - Query a collection] action in Modules widget.
  List<LessonsRecord>? allLessonsWithPhoto;
  // Stores action output result for [Firestore Query - Query a collection] action in Modules widget.
  int? countLessonWithPhoto2;
  // Stores action output result for [Firestore Query - Query a collection] action in Modules widget.
  List<LessonsRecord>? allLessonsWithPhoto2;
  // Model for button component.
  late ButtonModel buttonModel1;
  // Model for infoCourseCompMobile component.
  late InfoCourseCompMobileModel infoCourseCompMobileModel1;
  // Model for button component.
  late ButtonModel buttonModel2;
  // Model for infoCourseCompMobile component.
  late InfoCourseCompMobileModel infoCourseCompMobileModel2;
  // Model for appBar component.
  late AppBarModel appBarModel;
  // Model for infoCourseCompleted component.
  late InfoCourseCompletedModel infoCourseCompletedModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    buttonModel1 = createModel(context, () => ButtonModel());
    infoCourseCompMobileModel1 =
        createModel(context, () => InfoCourseCompMobileModel());
    buttonModel2 = createModel(context, () => ButtonModel());
    infoCourseCompMobileModel2 =
        createModel(context, () => InfoCourseCompMobileModel());
    appBarModel = createModel(context, () => AppBarModel());
    infoCourseCompletedModel =
        createModel(context, () => InfoCourseCompletedModel());
  }

  void dispose() {
    unfocusNode.dispose();
    buttonModel1.dispose();
    infoCourseCompMobileModel1.dispose();
    buttonModel2.dispose();
    infoCourseCompMobileModel2.dispose();
    appBarModel.dispose();
    infoCourseCompletedModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
