import '/archive/discount/discount_widget.dart';
import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
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
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'basket_model.dart';
export 'basket_model.dart';

class BasketWidget extends StatefulWidget {
  const BasketWidget({
    Key? key,
    int? currentPage,
    this.basketTariffs,
  })  : this.currentPage = currentPage ?? 0,
        super(key: key);

  final int currentPage;
  final List<DocumentReference>? basketTariffs;

  @override
  _BasketWidgetState createState() => _BasketWidgetState();
}

class _BasketWidgetState extends State<BasketWidget> {
  late BasketModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BasketModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.currentPage == 1) {
        return;
      }

      FFAppState().update(() {
        FFAppState().basketTariffs =
            widget.basketTariffs!.toList().cast<DocumentReference>();
      });
      return;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Align(
          alignment: AlignmentDirectional(0.00, -1.00),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: FutureBuilder<List<TariffsRecord>>(
              future: queryTariffsRecordOnce(),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: SpinKitRipple(
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 50.0,
                      ),
                    ),
                  );
                }
                List<TariffsRecord> containerTariffsRecordList = snapshot.data!;
                return Container(
                  constraints: BoxConstraints(
                    maxWidth: 1250.0,
                  ),
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.appBarModel,
                        updateCallback: () => setState(() {}),
                        child: AppBarWidget(
                          selected: 1,
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                  ))
                                    Container(
                                      width: 100.0,
                                      height: 16.0,
                                      decoration: BoxDecoration(),
                                    ),
                                  if (FFAppState().basketTariffs.length != 0)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 40.0),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .coursesListBasketModel,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child:
                                                        CoursesListBasketWidget(
                                                      fullprice:
                                                          valueOrDefault<int>(
                                                        functions.sum(containerTariffsRecordList
                                                            .where((e) => FFAppState()
                                                                .basketTariffs
                                                                .contains(e
                                                                    .reference))
                                                            .toList()
                                                            .map((e) => e.price)
                                                            .toList()),
                                                        0,
                                                      ),
                                                      tariffsDoc: containerTariffsRecordList
                                                          .where((e) =>
                                                              FFAppState()
                                                                  .basketTariffs
                                                                  .contains(e
                                                                      .reference))
                                                          .toList(),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (responsiveVisibility(
                                            context: context,
                                            phone: false,
                                            tablet: false,
                                            tabletLandscape: false,
                                          ))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      32.0, 40.0, 0.0, 0.0),
                                              child: Container(
                                                width: 384.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent3,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          18.0, 0.0, 18.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.00, 0.00),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      26.0,
                                                                      0.0,
                                                                      16.0),
                                                          child: Text(
                                                            'Ваша корзина',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge,
                                                          ),
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .courseNamePriceModel,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            CourseNamePriceWidget(),
                                                      ),
                                                      Divider(
                                                        thickness: 1.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent3,
                                                      ),
                                                      if (responsiveVisibility(
                                                        context: context,
                                                        phone: false,
                                                        tablet: false,
                                                        tabletLandscape: false,
                                                        desktop: false,
                                                      ))
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      12.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Если у вас есть промокод – введите его здесь.  Он есть у тех, кто оплачивал бронь',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily),
                                                                  lineHeight:
                                                                      1.4,
                                                                ),
                                                          ),
                                                        ),
                                                      if (responsiveVisibility(
                                                        context: context,
                                                        phone: false,
                                                        tablet: false,
                                                        tabletLandscape: false,
                                                        desktop: false,
                                                      ))
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
                                                                        0.0,
                                                                        12.0),
                                                            child:
                                                                wrapWithModel(
                                                              model: _model
                                                                  .discountModel,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              child:
                                                                  DiscountWidget(),
                                                            ),
                                                          ),
                                                        ),
                                                      if (responsiveVisibility(
                                                        context: context,
                                                        phone: false,
                                                        tablet: false,
                                                        tabletLandscape: false,
                                                        desktop: false,
                                                      ))
                                                        Divider(
                                                          thickness: 1.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent3,
                                                        ),
                                                      if (responsiveVisibility(
                                                        context: context,
                                                        phone: false,
                                                        tablet: false,
                                                        tabletLandscape: false,
                                                        desktop: false,
                                                      ))
                                                        wrapWithModel(
                                                          model: _model
                                                              .oldFullPriceRowModel,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              OldFullPriceRowWidget(),
                                                        ),
                                                      if (responsiveVisibility(
                                                        context: context,
                                                        phone: false,
                                                        tablet: false,
                                                        tabletLandscape: false,
                                                        desktop: false,
                                                      ))
                                                        wrapWithModel(
                                                          model: _model
                                                              .discountRowModel,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              DiscountRowWidget(),
                                                        ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .fullPriceRowModel,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            FullPriceRowWidget(
                                                          fullPrice:
                                                              valueOrDefault<
                                                                  int>(
                                                            functions.sum(containerTariffsRecordList
                                                                .where((e) => FFAppState()
                                                                    .basketTariffs
                                                                    .contains(e
                                                                        .reference))
                                                                .toList()
                                                                .map((e) =>
                                                                    e.price)
                                                                .toList()),
                                                            0,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
                                                                    0.0,
                                                                    26.0),
                                                        child: Stack(
                                                          children: [
                                                            if (loggedIn)
                                                              StreamBuilder<
                                                                  UsersRecord>(
                                                                stream: UsersRecord
                                                                    .getDocument(
                                                                        currentUserReference!)
                                                                  ..listen(
                                                                      (containerUsersRecord) async {
                                                                    if (_model.containerPreviousSnapshot !=
                                                                            null &&
                                                                        !UsersRecordDocumentEquality().equals(
                                                                            containerUsersRecord,
                                                                            _model.containerPreviousSnapshot)) {
                                                                      if (containerUsersRecord
                                                                              .rlBuyTariffs
                                                                              .where((e) => FFAppState().basketTariffs.contains(
                                                                                  e))
                                                                              .toList()
                                                                              .length ==
                                                                          FFAppState()
                                                                              .basketTariffs
                                                                              .length) {
                                                                        if (Navigator.of(context)
                                                                            .canPop()) {
                                                                          context
                                                                              .pop();
                                                                        }
                                                                        context
                                                                            .pushNamed(
                                                                          'Complete',
                                                                          queryParameters:
                                                                              {
                                                                            'tariffsInBasket':
                                                                                serializeParam(
                                                                              containerTariffsRecordList.where((e) => FFAppState().basketTariffs.contains(e.reference)).toList(),
                                                                              ParamType.Document,
                                                                              true,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            'tariffsInBasket':
                                                                                containerTariffsRecordList.where((e) => FFAppState().basketTariffs.contains(e.reference)).toList(),
                                                                            kTransitionInfoKey:
                                                                                TransitionInfo(
                                                                              hasTransition: true,
                                                                              transitionType: PageTransitionType.fade,
                                                                              duration: Duration(milliseconds: 0),
                                                                            ),
                                                                          },
                                                                        );
                                                                      } else {
                                                                        return;
                                                                      }

                                                                      setState(
                                                                          () {});
                                                                    }
                                                                    _model.containerPreviousSnapshot =
                                                                        containerUsersRecord;
                                                                  }),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            SpinKitRipple(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final containerUsersRecord =
                                                                      snapshot
                                                                          .data!;
                                                                  return Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await actions
                                                                            .showPaymentWidget(
                                                                          containerTariffsRecordList
                                                                              .where((e) => FFAppState().basketTariffs.contains(e.reference))
                                                                              .toList(),
                                                                        );
                                                                      },
                                                                      child:
                                                                          wrapWithModel(
                                                                        model: _model
                                                                            .buttonModel1,
                                                                        updateCallback:
                                                                            () =>
                                                                                setState(() {}),
                                                                        child:
                                                                            ButtonWidget(
                                                                          text:
                                                                              'Перейти к оформлению',
                                                                          btnColor:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          txtColor:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          btnWidth:
                                                                              268,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            if (!loggedIn)
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context.pushNamed(
                                                                        'Log_In');
                                                                  },
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .buttonModel2,
                                                                    updateCallback: () =>
                                                                        setState(
                                                                            () {}),
                                                                    child:
                                                                        ButtonWidget(
                                                                      text:
                                                                          'Перейти к оформлению',
                                                                      btnColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      txtColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      btnWidth:
                                                                          268,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            if (FFAppState().basketTariffs.length == 0)
                              wrapWithModel(
                                model: _model.basketEmptyModel,
                                updateCallback: () => setState(() {}),
                                child: BasketEmptyWidget(),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
