import '/archive/discount/discount_widget.dart';
import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/basket/close_order/close_order_widget.dart';
import '/basket/course_item/course_item_widget.dart';
import '/basket/course_name_price/course_name_price_widget.dart';
import '/basket/discount_row/discount_row_widget.dart';
import '/basket/full_price_row/full_price_row_widget.dart';
import '/basket/old_full_price_row/old_full_price_row_widget.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'courses_list_basket_widget.dart' show CoursesListBasketWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CoursesListBasketModel extends FlutterFlowModel<CoursesListBasketWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for courseItem component.
  late CourseItemModel courseItemModel;
  // Model for courseNamePrice component.
  late CourseNamePriceModel courseNamePriceModel;
  // Model for discount component.
  late DiscountModel discountModel1;
  // Model for oldFullPriceRow component.
  late OldFullPriceRowModel oldFullPriceRowModel;
  // Model for discountRow component.
  late DiscountRowModel discountRowModel;
  // Model for fullPriceRow component.
  late FullPriceRowModel fullPriceRowModel1;
  UsersRecord? containerPreviousSnapshot;
  // Model for button component.
  late ButtonModel buttonModel1;
  // Model for button component.
  late ButtonModel buttonModel2;
  // Model for discount component.
  late DiscountModel discountModel2;
  // Model for fullPriceRow component.
  late FullPriceRowModel fullPriceRowModel2;
  // Model for button component.
  late ButtonModel buttonModel3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    courseItemModel = createModel(context, () => CourseItemModel());
    courseNamePriceModel = createModel(context, () => CourseNamePriceModel());
    discountModel1 = createModel(context, () => DiscountModel());
    oldFullPriceRowModel = createModel(context, () => OldFullPriceRowModel());
    discountRowModel = createModel(context, () => DiscountRowModel());
    fullPriceRowModel1 = createModel(context, () => FullPriceRowModel());
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
    discountModel2 = createModel(context, () => DiscountModel());
    fullPriceRowModel2 = createModel(context, () => FullPriceRowModel());
    buttonModel3 = createModel(context, () => ButtonModel());
  }

  void dispose() {
    courseItemModel.dispose();
    courseNamePriceModel.dispose();
    discountModel1.dispose();
    oldFullPriceRowModel.dispose();
    discountRowModel.dispose();
    fullPriceRowModel1.dispose();
    buttonModel1.dispose();
    buttonModel2.dispose();
    discountModel2.dispose();
    fullPriceRowModel2.dispose();
    buttonModel3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
