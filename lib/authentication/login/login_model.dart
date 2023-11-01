import '/auth/firebase_auth/auth_util.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for LoginF widget.
  FocusNode? loginFFocusNode;
  TextEditingController? loginFController;
  String? Function(BuildContext, String?)? loginFControllerValidator;
  String? _loginFControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Это поле обязательно';
    }

    return null;
  }

  // State field(s) for PassF widget.
  FocusNode? passFFocusNode;
  TextEditingController? passFController;
  late bool passFVisibility;
  String? Function(BuildContext, String?)? passFControllerValidator;
  String? _passFControllerValidator(BuildContext context, String? val) {
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

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    loginFControllerValidator = _loginFControllerValidator;
    passFVisibility = false;
    passFControllerValidator = _passFControllerValidator;
    buttonModel = createModel(context, () => ButtonModel());
  }

  void dispose() {
    loginFFocusNode?.dispose();
    loginFController?.dispose();

    passFFocusNode?.dispose();
    passFController?.dispose();

    buttonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
