import '/archive/balance/balance_widget.dart';
import '/archive/sert/sert_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/components/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile/socials/socials_widget.dart';
import '/profile/support_desktop/support_desktop_widget.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for appBar component.
  late AppBarModel appBarModel;
  // Model for supportDesktop.
  late SupportDesktopModel supportDesktopModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    supportDesktopModel = createModel(context, () => SupportDesktopModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appBarModel.dispose();
    supportDesktopModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
