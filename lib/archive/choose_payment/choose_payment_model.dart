import '/basket/course_name_price/course_name_price_widget.dart';
import '/basket/full_price_row/full_price_row_widget.dart';
import '/components/app_bar_widget.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'choose_payment_widget.dart' show ChoosePaymentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChoosePaymentModel extends FlutterFlowModel<ChoosePaymentWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for button component.
  late ButtonModel buttonModel1;
  // Model for courseNamePrice component.
  late CourseNamePriceModel courseNamePriceModel1;
  // Model for fullPriceRow component.
  late FullPriceRowModel fullPriceRowModel1;
  // Model for courseNamePrice component.
  late CourseNamePriceModel courseNamePriceModel2;
  // Model for fullPriceRow component.
  late FullPriceRowModel fullPriceRowModel2;
  // Model for appBar component.
  late AppBarModel appBarModel;
  // Model for button component.
  late ButtonModel buttonModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    buttonModel1 = createModel(context, () => ButtonModel());
    courseNamePriceModel1 = createModel(context, () => CourseNamePriceModel());
    fullPriceRowModel1 = createModel(context, () => FullPriceRowModel());
    courseNamePriceModel2 = createModel(context, () => CourseNamePriceModel());
    fullPriceRowModel2 = createModel(context, () => FullPriceRowModel());
    appBarModel = createModel(context, () => AppBarModel());
    buttonModel2 = createModel(context, () => ButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    buttonModel1.dispose();
    courseNamePriceModel1.dispose();
    fullPriceRowModel1.dispose();
    courseNamePriceModel2.dispose();
    fullPriceRowModel2.dispose();
    appBarModel.dispose();
    buttonModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
