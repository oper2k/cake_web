import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'signin_widget.dart' show SigninWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SigninModel extends FlutterFlowModel<SigninWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for LoginField widget.
  FocusNode? loginFieldFocusNode;
  TextEditingController? loginFieldController;
  String? Function(BuildContext, String?)? loginFieldControllerValidator;
  String? _loginFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Это поле обязательно';
    }

    return null;
  }

  // State field(s) for PassField widget.
  FocusNode? passFieldFocusNode;
  TextEditingController? passFieldController;
  late bool passFieldVisibility;
  String? Function(BuildContext, String?)? passFieldControllerValidator;
  String? _passFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Это поле обязательно';
    }

    if (val.length < 6) {
      return 'Минимум 6 символов';
    }

    return null;
  }

  // State field(s) for PassRepField widget.
  FocusNode? passRepFieldFocusNode;
  TextEditingController? passRepFieldController;
  late bool passRepFieldVisibility;
  String? Function(BuildContext, String?)? passRepFieldControllerValidator;
  String? _passRepFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Это поле обязательно';
    }

    if (val.length < 6) {
      return 'Минимум 6 символов';
    }

    return null;
  }

  // Model for button component.
  late ButtonModel buttonModel;
  // Stores action output result for [Backend Call - API (send email register)] action in button widget.
  ApiCallResponse? apiResultuuy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    loginFieldControllerValidator = _loginFieldControllerValidator;
    passFieldVisibility = false;
    passFieldControllerValidator = _passFieldControllerValidator;
    passRepFieldVisibility = false;
    passRepFieldControllerValidator = _passRepFieldControllerValidator;
    buttonModel = createModel(context, () => ButtonModel());
  }

  void dispose() {
    loginFieldFocusNode?.dispose();
    loginFieldController?.dispose();

    passFieldFocusNode?.dispose();
    passFieldController?.dispose();

    passRepFieldFocusNode?.dispose();
    passRepFieldController?.dispose();

    buttonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
