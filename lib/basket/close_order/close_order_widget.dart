import '/backend/backend.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'close_order_model.dart';
export 'close_order_model.dart';

class CloseOrderWidget extends StatefulWidget {
  const CloseOrderWidget({
    Key? key,
    required this.fullPrice,
  }) : super(key: key);

  final int? fullPrice;

  @override
  _CloseOrderWidgetState createState() => _CloseOrderWidgetState();
}

class _CloseOrderWidgetState extends State<CloseOrderWidget> {
  late CloseOrderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CloseOrderModel());

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

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 18.0, 20.0, 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Скрыть состав заказа',
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelSmallFamily,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).labelSmallFamily),
                          lineHeight: 1.3,
                        ),
                  ),
                  Container(
                    width: 24.0,
                    height: 24.0,
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Icon(
                        FFIcons.kdown,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 12.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 12.0),
                  child: Builder(
                    builder: (context) {
                      final tariffsInBasket =
                          FFAppState().basketTariffs.toList();
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(tariffsInBasket.length,
                            (tariffsInBasketIndex) {
                          final tariffsInBasketItem =
                              tariffsInBasket[tariffsInBasketIndex];
                          return FutureBuilder<TariffsRecord>(
                            future: TariffsRecord.getDocumentOnce(
                                tariffsInBasketItem),
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
                              final rowTariffsRecord = snapshot.data!;
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  StreamBuilder<CoursesRecord>(
                                    stream: CoursesRecord.getDocument(
                                        rowTariffsRecord.rlCourse!),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: SpinKitRipple(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      final courseNameCoursesRecord =
                                          snapshot.data!;
                                      return Text(
                                        'Курс \"${courseNameCoursesRecord.name}\"',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                      );
                                    },
                                  ),
                                  Text(
                                    '${rowTariffsRecord.price.toString()} ₽',
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                ],
                              );
                            },
                          );
                        }).divide(SizedBox(height: 28.0)),
                      );
                    },
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  indent: 18.0,
                  endIndent: 18.0,
                  color: FlutterFlowTheme.of(context).accent4,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Общая стоимость',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 17.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                      Text(
                        '${widget.fullPrice?.toString()} ₽',
                        style: FlutterFlowTheme.of(context).labelLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 34.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    'Card_Pay',
                    queryParameters: {
                      'fullPrice': serializeParam(
                        widget.fullPrice,
                        ParamType.int,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
                child: wrapWithModel(
                  model: _model.buttonModel,
                  updateCallback: () => setState(() {}),
                  child: ButtonWidget(
                    text: 'Оплатить ${widget.fullPrice?.toString()} ₽',
                    btnColor: FlutterFlowTheme.of(context).primaryText,
                    txtColor: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
