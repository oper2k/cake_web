import '/archive/discount/discount_widget.dart';
import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'courses_list_basket_model.dart';
export 'courses_list_basket_model.dart';

class CoursesListBasketWidget extends StatefulWidget {
  const CoursesListBasketWidget({
    Key? key,
    required this.fullprice,
    required this.tariffsDoc,
  }) : super(key: key);

  final int? fullprice;
  final List<TariffsRecord>? tariffsDoc;

  @override
  _CoursesListBasketWidgetState createState() =>
      _CoursesListBasketWidgetState();
}

class _CoursesListBasketWidgetState extends State<CoursesListBasketWidget> {
  late CoursesListBasketModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoursesListBasketModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: AlignmentDirectional(-1.00, 0.00),
          child: Text(
            'Корзина',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  fontSize: MediaQuery.sizeOf(context).width <= kBreakpointSmall
                      ? 30.0
                      : 34.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).headlineMediumFamily),
                  lineHeight: 1.2,
                ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(-1.00, 0.00),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 12.0),
            child: Text(
              'Добавленные курсы (${FFAppState().basketTariffs.length.toString()})',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).black3666666,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            wrapWithModel(
              model: _model.courseItemModel,
              updateCallback: () => setState(() {}),
              child: CourseItemWidget(),
            ),
            if (responsiveVisibility(
              context: context,
              phone: false,
              desktop: false,
            ))
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 48.0, 0.0, 40.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).accent3,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 26.0, 0.0, 16.0),
                          child: Text(
                            'Ваша корзина',
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: 'Inter',
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyLargeFamily),
                                ),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.courseNamePriceModel,
                          updateCallback: () => setState(() {}),
                          child: CourseNamePriceWidget(),
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
                            color: FlutterFlowTheme.of(context).accent3,
                          ),
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                wrapWithModel(
                                  model: _model.discountModel1,
                                  updateCallback: () => setState(() {}),
                                  child: DiscountWidget(),
                                ),
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: Text(
                                      'Если у вас есть промокод – введите его здесь.  Он есть у тех, кто оплачивал бронь',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 12.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        Divider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).accent3,
                        ),
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          wrapWithModel(
                            model: _model.oldFullPriceRowModel,
                            updateCallback: () => setState(() {}),
                            child: OldFullPriceRowWidget(),
                          ),
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          wrapWithModel(
                            model: _model.discountRowModel,
                            updateCallback: () => setState(() {}),
                            child: DiscountRowWidget(),
                          ),
                        wrapWithModel(
                          model: _model.fullPriceRowModel1,
                          updateCallback: () => setState(() {}),
                          child: FullPriceRowWidget(
                            fullPrice: widget.fullprice,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 20.0),
                          child: Stack(
                            children: [
                              if (loggedIn)
                                StreamBuilder<UsersRecord>(
                                  stream: UsersRecord.getDocument(
                                      currentUserReference!)
                                    ..listen((containerUsersRecord) async {
                                      if (_model.containerPreviousSnapshot !=
                                              null &&
                                          !UsersRecordDocumentEquality().equals(
                                              containerUsersRecord,
                                              _model
                                                  .containerPreviousSnapshot)) {
                                        if (containerUsersRecord.rlBuyTariffs
                                                .where((e) => FFAppState()
                                                    .basketTariffs
                                                    .contains(e))
                                                .toList()
                                                .length ==
                                            FFAppState().basketTariffs.length) {
                                          _model.fisrtTariffsInBasketPad =
                                              await TariffsRecord
                                                  .getDocumentOnce(FFAppState()
                                                      .basketTariffs
                                                      .first);
                                          _model.apiResults3fCopy =
                                              await GetResponseGroup
                                                  .sendEmailRegisterCall
                                                  .call(
                                            subject: 'Покупка',
                                            email: currentUserEmail,
                                            name: 'Покупка',
                                            templateID: _model
                                                .fisrtTariffsInBasketPad
                                                ?.getresponseId,
                                          );
                                          FFAppState().update(() {
                                            FFAppState().deleteBasketTariffs();
                                            FFAppState().basketTariffs = [];
                                          });
                                          if (Navigator.of(context).canPop()) {
                                            context.pop();
                                          }
                                          context.pushNamed(
                                            'Complete',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        } else {
                                          return;
                                        }

                                        setState(() {});
                                      }
                                      _model.containerPreviousSnapshot =
                                          containerUsersRecord;
                                    }),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitRipple(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    final containerUsersRecord = snapshot.data!;
                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await actions.showPaymentWidget(
                                            widget.tariffsDoc!.toList(),
                                          );
                                        },
                                        child: wrapWithModel(
                                          model: _model.buttonModel1,
                                          updateCallback: () => setState(() {}),
                                          child: ButtonWidget(
                                            text: 'Перейти к оформлению',
                                            btnColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            txtColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            btnWidth: 268,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              if (!loggedIn)
                                Container(
                                  decoration: BoxDecoration(),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('Log_In');
                                    },
                                    child: wrapWithModel(
                                      model: _model.buttonModel2,
                                      updateCallback: () => setState(() {}),
                                      child: ButtonWidget(
                                        text: 'Перейти к оформлению',
                                        btnColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        txtColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        btnWidth: 268,
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
            if (responsiveVisibility(
              context: context,
              tablet: false,
              tabletLandscape: false,
              desktop: false,
            ))
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      wrapWithModel(
                        model: _model.discountModel2,
                        updateCallback: () => setState(() {}),
                        child: DiscountWidget(),
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
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Если у вас есть промокод – введите его здесь.  Он есть у тех, кто оплачивал бронь',
                              style: FlutterFlowTheme.of(context).displayMedium,
                            ),
                          ],
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.fullPriceRowModel2,
                        updateCallback: () => setState(() {}),
                        child: FullPriceRowWidget(
                          fullPrice: widget.fullprice,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 80.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            isDismissible: false,
                            enableDrag: false,
                            useSafeArea: true,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                  child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: CloseOrderWidget(
                                  fullPrice: widget.fullprice!,
                                  tariffsDoc: widget.tariffsDoc,
                                ),
                              ));
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        child: wrapWithModel(
                          model: _model.buttonModel3,
                          updateCallback: () => setState(() {}),
                          child: ButtonWidget(
                            text: 'Перейти к оплате',
                            btnColor: FlutterFlowTheme.of(context).primaryText,
                            txtColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}
