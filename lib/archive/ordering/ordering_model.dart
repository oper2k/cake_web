import '/basket/course_name_price/course_name_price_widget.dart';
import '/basket/full_price_row/full_price_row_widget.dart';
import '/components/app_bar_widget.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'ordering_widget.dart' show OrderingWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderingModel extends FlutterFlowModel<OrderingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  // State field(s) for PhoneField widget.
  FocusNode? phoneFieldFocusNode;
  TextEditingController? phoneFieldController;
  String? Function(BuildContext, String?)? phoneFieldControllerValidator;
  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldController;
  String? Function(BuildContext, String?)? emailFieldControllerValidator;
  // Model for fullPriceRow component.
  late FullPriceRowModel fullPriceRowModel1;
  // Model for button component.
  late ButtonModel buttonModel;
  // Model for courseNamePrice component.
  late CourseNamePriceModel courseNamePriceModel;
  // Model for fullPriceRow component.
  late FullPriceRowModel fullPriceRowModel2;
  // Model for appBar component.
  late AppBarModel appBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    fullPriceRowModel1 = createModel(context, () => FullPriceRowModel());
    buttonModel = createModel(context, () => ButtonModel());
    courseNamePriceModel = createModel(context, () => CourseNamePriceModel());
    fullPriceRowModel2 = createModel(context, () => FullPriceRowModel());
    appBarModel = createModel(context, () => AppBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    nameFieldFocusNode?.dispose();
    nameFieldController?.dispose();

    phoneFieldFocusNode?.dispose();
    phoneFieldController?.dispose();

    emailFieldFocusNode?.dispose();
    emailFieldController?.dispose();

    fullPriceRowModel1.dispose();
    buttonModel.dispose();
    courseNamePriceModel.dispose();
    fullPriceRowModel2.dispose();
    appBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
