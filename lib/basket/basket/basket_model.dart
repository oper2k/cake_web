import '/archive/discount/discount_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/basket/basket_empty/basket_empty_widget.dart';
import '/basket/course_name_price/course_name_price_widget.dart';
import '/basket/courses_list_basket/courses_list_basket_widget.dart';
import '/basket/discount_row/discount_row_widget.dart';
import '/basket/full_price_row/full_price_row_widget.dart';
import '/basket/old_full_price_row/old_full_price_row_widget.dart';
import '/components/app_bar_widget.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'basket_widget.dart' show BasketWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BasketModel extends FlutterFlowModel<BasketWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - Read Document] action in Basket widget.
  TariffsRecord? fisrtTariffsInBasket;
  // Stores action output result for [Backend Call - API (send email register)] action in Basket widget.
  ApiCallResponse? apiResults3f;
  // Model for appBar component.
  late AppBarModel appBarModel;
  // Model for coursesListBasket component.
  late CoursesListBasketModel coursesListBasketModel;
  // Model for courseNamePrice component.
  late CourseNamePriceModel courseNamePriceModel;
  // Model for discount component.
  late DiscountModel discountModel;
  // Model for oldFullPriceRow component.
  late OldFullPriceRowModel oldFullPriceRowModel;
  // Model for discountRow component.
  late DiscountRowModel discountRowModel;
  // Model for fullPriceRow component.
  late FullPriceRowModel fullPriceRowModel;
  // Model for button component.
  late ButtonModel buttonModel;
  // Model for basketEmpty component.
  late BasketEmptyModel basketEmptyModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    coursesListBasketModel =
        createModel(context, () => CoursesListBasketModel());
    courseNamePriceModel = createModel(context, () => CourseNamePriceModel());
    discountModel = createModel(context, () => DiscountModel());
    oldFullPriceRowModel = createModel(context, () => OldFullPriceRowModel());
    discountRowModel = createModel(context, () => DiscountRowModel());
    fullPriceRowModel = createModel(context, () => FullPriceRowModel());
    buttonModel = createModel(context, () => ButtonModel());
    basketEmptyModel = createModel(context, () => BasketEmptyModel());
  }

  void dispose() {
    unfocusNode.dispose();
    instantTimer?.cancel();
    appBarModel.dispose();
    coursesListBasketModel.dispose();
    courseNamePriceModel.dispose();
    discountModel.dispose();
    oldFullPriceRowModel.dispose();
    discountRowModel.dispose();
    fullPriceRowModel.dispose();
    buttonModel.dispose();
    basketEmptyModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
