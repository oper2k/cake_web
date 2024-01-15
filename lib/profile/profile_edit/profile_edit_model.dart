import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/app_bar_widget.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'profile_edit_widget.dart' show ProfileEditWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileEditModel extends FlutterFlowModel<ProfileEditWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey1 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Model for appBar component.
  late AppBarModel appBarModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  String? _nameFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Это поле обязательно';
    }

    return null;
  }

  // State field(s) for SurnameField widget.
  FocusNode? surnameFieldFocusNode;
  TextEditingController? surnameFieldController;
  String? Function(BuildContext, String?)? surnameFieldControllerValidator;
  String? _surnameFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Это поле обязательно';
    }

    return null;
  }

  // State field(s) for InstField widget.
  FocusNode? instFieldFocusNode;
  TextEditingController? instFieldController;
  String? Function(BuildContext, String?)? instFieldControllerValidator;
  // State field(s) for PhoneField widget.
  FocusNode? phoneFieldFocusNode;
  TextEditingController? phoneFieldController;
  String? Function(BuildContext, String?)? phoneFieldControllerValidator;
  String? _phoneFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Это поле обязательно';
    }

    return null;
  }

  DateTime? datePicked;
  // Model for button component.
  late ButtonModel buttonModel1;
  // State field(s) for Mail1Field widget.
  FocusNode? mail1FieldFocusNode;
  TextEditingController? mail1FieldController;
  String? Function(BuildContext, String?)? mail1FieldControllerValidator;
  // Model for button component.
  late ButtonModel buttonModel2;
  // State field(s) for MailField widget.
  FocusNode? mailFieldFocusNode;
  TextEditingController? mailFieldController;
  String? Function(BuildContext, String?)? mailFieldControllerValidator;
  // Model for button component.
  late ButtonModel buttonModel3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    nameFieldControllerValidator = _nameFieldControllerValidator;
    surnameFieldControllerValidator = _surnameFieldControllerValidator;
    phoneFieldControllerValidator = _phoneFieldControllerValidator;
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
    buttonModel3 = createModel(context, () => ButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appBarModel.dispose();
    tabBarController?.dispose();
    nameFieldFocusNode?.dispose();
    nameFieldController?.dispose();

    surnameFieldFocusNode?.dispose();
    surnameFieldController?.dispose();

    instFieldFocusNode?.dispose();
    instFieldController?.dispose();

    phoneFieldFocusNode?.dispose();
    phoneFieldController?.dispose();

    buttonModel1.dispose();
    mail1FieldFocusNode?.dispose();
    mail1FieldController?.dispose();

    buttonModel2.dispose();
    mailFieldFocusNode?.dispose();
    mailFieldController?.dispose();

    buttonModel3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
