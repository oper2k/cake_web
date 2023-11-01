import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sert_widget.dart' show SertWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SertModel extends FlutterFlowModel<SertWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SertField widget.
  FocusNode? sertFieldFocusNode;
  TextEditingController? sertFieldController;
  String? Function(BuildContext, String?)? sertFieldControllerValidator;
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
    sertFieldFocusNode?.dispose();
    sertFieldController?.dispose();

    buttonModel1.dispose();
    buttonModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
