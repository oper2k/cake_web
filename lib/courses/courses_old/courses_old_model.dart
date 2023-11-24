import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_bar_widget.dart';
import '/courses/choose_course/choose_course_widget.dart';
import '/courses/info_continue_course/info_continue_course_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'courses_old_widget.dart' show CoursesOldWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CoursesOldModel extends FlutterFlowModel<CoursesOldWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for appBar component.
  late AppBarModel appBarModel;
  // Model for infoContinueCourse component.
  late InfoContinueCourseModel infoContinueCourseModel1;
  // Model for chooseCourse component.
  late ChooseCourseModel chooseCourseModel;
  // Model for infoContinueCourse component.
  late InfoContinueCourseModel infoContinueCourseModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    infoContinueCourseModel1 =
        createModel(context, () => InfoContinueCourseModel());
    chooseCourseModel = createModel(context, () => ChooseCourseModel());
    infoContinueCourseModel2 =
        createModel(context, () => InfoContinueCourseModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appBarModel.dispose();
    infoContinueCourseModel1.dispose();
    chooseCourseModel.dispose();
    infoContinueCourseModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
