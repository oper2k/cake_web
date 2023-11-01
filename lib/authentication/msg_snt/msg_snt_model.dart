import '/authentication/msg_sent/msg_sent_widget.dart';
import '/authentication/page_wiew/page_wiew_widget.dart';
import '/components/app_bar_minimal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'msg_snt_widget.dart' show MsgSntWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MsgSntModel extends FlutterFlowModel<MsgSntWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for appBarMinimal component.
  late AppBarMinimalModel appBarMinimalModel;
  // Model for msgSent component.
  late MsgSentModel msgSentModel;
  // Model for pageWiew component.
  late PageWiewModel pageWiewModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBarMinimalModel = createModel(context, () => AppBarMinimalModel());
    msgSentModel = createModel(context, () => MsgSentModel());
    pageWiewModel = createModel(context, () => PageWiewModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appBarMinimalModel.dispose();
    msgSentModel.dispose();
    pageWiewModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
