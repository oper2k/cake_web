import '/components/app_bar_widget.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'payment_card_widget.dart' show PaymentCardWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class PaymentCardModel extends FlutterFlowModel<PaymentCardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for appBar component.
  late AppBarModel appBarModel;
  // State field(s) for Number widget.
  FocusNode? numberFocusNode;
  TextEditingController? numberController;
  final numberMask = MaskTextInputFormatter(mask: '#### #### #### ####');
  String? Function(BuildContext, String?)? numberControllerValidator;
  // State field(s) for Date widget.
  FocusNode? dateFocusNode;
  TextEditingController? dateController;
  final dateMask = MaskTextInputFormatter(mask: '##/##');
  String? Function(BuildContext, String?)? dateControllerValidator;
  // State field(s) for CVV widget.
  FocusNode? cvvFocusNode;
  TextEditingController? cvvController;
  late bool cvvVisibility;
  final cvvMask = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? cvvControllerValidator;
  // Model for button component.
  late ButtonModel buttonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    cvvVisibility = false;
    buttonModel = createModel(context, () => ButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appBarModel.dispose();
    numberFocusNode?.dispose();
    numberController?.dispose();

    dateFocusNode?.dispose();
    dateController?.dispose();

    cvvFocusNode?.dispose();
    cvvController?.dispose();

    buttonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
