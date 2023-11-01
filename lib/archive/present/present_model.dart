import '/components/app_bar_widget.dart';
import '/components/button_widget.dart';
import '/courses/roadmap_item/roadmap_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'present_widget.dart' show PresentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PresentModel extends FlutterFlowModel<PresentWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for button component.
  late ButtonModel buttonModel1;
  // Model for roadmapItem component.
  late RoadmapItemModel roadmapItemModel;
  // Model for button component.
  late ButtonModel buttonModel2;
  // Model for appBar component.
  late AppBarModel appBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    buttonModel1 = createModel(context, () => ButtonModel());
    roadmapItemModel = createModel(context, () => RoadmapItemModel());
    buttonModel2 = createModel(context, () => ButtonModel());
    appBarModel = createModel(context, () => AppBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    buttonModel1.dispose();
    roadmapItemModel.dispose();
    buttonModel2.dispose();
    appBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
