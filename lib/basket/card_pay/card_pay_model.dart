import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/basket/full_price_row/full_price_row_widget.dart';
import '/components/app_bar_widget.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'card_pay_widget.dart' show CardPayWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class CardPayModel extends FlutterFlowModel<CardPayWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for appBar component.
  late AppBarModel appBarModel;
  // State field(s) for NumberCard widget.
  FocusNode? numberCardFocusNode;
  TextEditingController? numberCardController;
  final numberCardMask = MaskTextInputFormatter(mask: '#### #### #### ####');
  String? Function(BuildContext, String?)? numberCardControllerValidator;
  // State field(s) for Date widget.
  FocusNode? dateFocusNode;
  TextEditingController? dateController;
  final dateMask = MaskTextInputFormatter(mask: '##/##');
  String? Function(BuildContext, String?)? dateControllerValidator;
  // State field(s) for CVV widget.
  FocusNode? cvvFocusNode;
  TextEditingController? cvvController;
  late bool cvvVisibility;
  final cvvMask = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? cvvControllerValidator;
  // Model for fullPriceRow component.
  late FullPriceRowModel fullPriceRowModel1;
  // Model for button component.
  late ButtonModel buttonModel1;
  // Model for fullPriceRow component.
  late FullPriceRowModel fullPriceRowModel2;
  // Model for button component.
  late ButtonModel buttonModel2;
  // Stores action output result for [Custom Action - validateCardNumber] action in button widget.
  bool? validateCardNumber1;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    cvvVisibility = false;
    fullPriceRowModel1 = createModel(context, () => FullPriceRowModel());
    buttonModel1 = createModel(context, () => ButtonModel());
    fullPriceRowModel2 = createModel(context, () => FullPriceRowModel());
    buttonModel2 = createModel(context, () => ButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appBarModel.dispose();
    numberCardFocusNode?.dispose();
    numberCardController?.dispose();

    dateFocusNode?.dispose();
    dateController?.dispose();

    cvvFocusNode?.dispose();
    cvvController?.dispose();

    fullPriceRowModel1.dispose();
    buttonModel1.dispose();
    fullPriceRowModel2.dispose();
    buttonModel2.dispose();
  }

  /// Action blocks are added here.

  Future paymentActionBlock(
    BuildContext context, {
    required int? fullPrice,
    required String? getResponseID,
  }) async {
    bool? validateCardNumber1;
    bool? validateCardDate;
    String? cryptogramCard;
    ApiCallResponse? apiResultrx5;
    List<DocumentReference>? resultListTariffs;
    ApiCallResponse? apiResults3f;
    List<String>? check3DS;
    ApiCallResponse? apiResultwlb;
    List<DocumentReference>? listForUpdate;
    ApiCallResponse? apiResultx02;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Перед проверкой номера карты',
          style: GoogleFonts.getFont(
            'Inter',
            color: FlutterFlowTheme.of(context).primaryText,
          ),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: Color(0xFFEE8B60),
      ),
    );
    validateCardNumber1 = await actions.validateCardNumber(
      numberCardController.text,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Номер карты',
          style: GoogleFonts.getFont(
            'Inter',
            color: FlutterFlowTheme.of(context).primaryText,
          ),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: Color(0xFFEE8B60),
      ),
    );
    if (validateCardNumber1!) {
      validateCardDate = await actions.validateCardExpireDate(
        dateController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Дата карты',
            style: GoogleFonts.getFont(
              'Inter',
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: Color(0xFFEE8B60),
        ),
      );
      if (validateCardDate!) {
        cryptogramCard =
            await actions.returnStringCardCryptogramForCloudpayments(
          numberCardController.text,
          dateController.text,
          cvvController.text,
          FFAppState().publicID,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Криптопрограмма',
              style: GoogleFonts.getFont(
                'Inter',
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: Color(0xFFEE8B60),
          ),
        );
        apiResultrx5 = await CloudpaymentsGroup.payByCardCopyCall.call(
          publicId: FFAppState().publicID,
          cardCryptogramPacket: cryptogramCard,
          email: currentUserEmail,
          accountId: currentUserEmail,
          amount: fullPrice,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Апиколл создание оплаты',
              style: GoogleFonts.getFont(
                'Inter',
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: Color(0xFFEE8B60),
          ),
        );
        if ((apiResultrx5?.succeeded ?? true)) {
          if (CloudpaymentsGroup.payByCardCopyCall.isSuccess(
            (apiResultrx5?.jsonBody ?? ''),
          )) {
            resultListTariffs = await actions.combines2Lists(
              FFAppState().basketTariffs.toList(),
              (currentUserDocument?.rlBuyTariffs?.toList() ?? []).toList(),
            );

            await currentUserReference!.update({
              ...mapToFirestore(
                {
                  'rl_buy_tariffs': resultListTariffs,
                },
              ),
            });
            apiResults3f = await GetResponseGroup.sendEmailRegisterCall.call(
              subject: 'Покупка',
              email: currentUserEmail,
              name: 'Покупка',
              templateID: getResponseID,
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  CloudpaymentsGroup.payByCardCopyCall
                      .successMessage(
                        (apiResultrx5?.jsonBody ?? ''),
                      )
                      .toString(),
                  style: GoogleFonts.getFont(
                    'Inter',
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: Color(0xFFEE8B60),
              ),
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
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );
          } else {
            if (CloudpaymentsGroup.payByCardCopyCall.reasonCode(
                  (apiResultrx5?.jsonBody ?? ''),
                ) !=
                null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Что-то пошло не так: ${CloudpaymentsGroup.payByCardCopyCall.message(
                          (apiResultrx5?.jsonBody ?? ''),
                        ).toString().toString()}',
                    style: GoogleFonts.getFont(
                      'Inter',
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                  duration: Duration(milliseconds: 4000),
                  backgroundColor: Color(0xFFEE8B60),
                ),
              );
              return;
            }
            if (CloudpaymentsGroup.payByCardCopyCall
                        .urlForConfirm(
                          (apiResultrx5?.jsonBody ?? ''),
                        )
                        .toString() !=
                    null &&
                CloudpaymentsGroup.payByCardCopyCall
                        .urlForConfirm(
                          (apiResultrx5?.jsonBody ?? ''),
                        )
                        .toString() !=
                    '') {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Перед 3дс',
                    style: GoogleFonts.getFont(
                      'Inter',
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                  duration: Duration(milliseconds: 4000),
                  backgroundColor: Color(0xFFEE8B60),
                ),
              );
              check3DS = await actions.check3DSCloudPayments(
                CloudpaymentsGroup.payByCardCopyCall
                    .urlForConfirm(
                      (apiResultrx5?.jsonBody ?? ''),
                    )
                    .toString(),
                CloudpaymentsGroup.payByCardCopyCall
                    .transactionId(
                      (apiResultrx5?.jsonBody ?? ''),
                    )
                    .toString()
                    .toString(),
                CloudpaymentsGroup.payByCardCopyCall
                    .paReq(
                      (apiResultrx5?.jsonBody ?? ''),
                    )
                    .toString(),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'После 3дс',
                    style: GoogleFonts.getFont(
                      'Inter',
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                  duration: Duration(milliseconds: 4000),
                  backgroundColor: Color(0xFFEE8B60),
                ),
              );
              if (check3DS!.length > 0) {
                apiResultwlb = await CloudpaymentsGroup.checkDSCopyCall.call(
                  transactionId: int.parse(check3DS!.first),
                  paRes: check3DS?.last,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Апикол о 3дс',
                      style: GoogleFonts.getFont(
                        'Inter',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: Color(0xFFEE8B60),
                  ),
                );
                if ((apiResultwlb?.succeeded ?? true)) {
                  if (CloudpaymentsGroup.checkDSCopyCall.isSuccess(
                    (apiResultwlb?.jsonBody ?? ''),
                  )) {
                    listForUpdate = await actions.combines2Lists(
                      FFAppState().basketTariffs.toList(),
                      (currentUserDocument?.rlBuyTariffs?.toList() ?? [])
                          .toList(),
                    );

                    await currentUserReference!.update({
                      ...mapToFirestore(
                        {
                          'rl_buy_tariffs': listForUpdate,
                        },
                      ),
                    });
                    apiResultx02 =
                        await GetResponseGroup.sendEmailRegisterCall.call(
                      subject: 'Покупка',
                      email: currentUserEmail,
                      name: 'Покупка',
                      templateID: getResponseID,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          CloudpaymentsGroup.checkDSCopyCall
                              .message(
                                (apiResultwlb?.jsonBody ?? ''),
                              )
                              .toString()
                              .toString(),
                          style: GoogleFonts.getFont(
                            'Inter',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: Color(0xFFEE8B60),
                      ),
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
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );

                    return;
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Что-то пошло не так: ${CloudpaymentsGroup.checkDSCopyCall.message(
                                (apiResultwlb?.jsonBody ?? ''),
                              ).toString().toString()}',
                          style: GoogleFonts.getFont(
                            'Inter',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: Color(0xFFEE8B60),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Что-то пошло не так: ${(apiResultwlb?.statusCode ?? 200).toString()}',
                        style: GoogleFonts.getFont(
                          'Inter',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                      duration: Duration(milliseconds: 4000),
                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Ошибка 3DS',
                      style: GoogleFonts.getFont(
                        'Inter',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: Color(0xFFEE8B60),
                  ),
                );
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Что-то пошло не так: ${CloudpaymentsGroup.payByCardCopyCall.message(
                          (apiResultrx5?.jsonBody ?? ''),
                        ).toString().toString()}',
                    style: GoogleFonts.getFont(
                      'Inter',
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                  duration: Duration(milliseconds: 4000),
                  backgroundColor: Color(0xFFEE8B60),
                ),
              );
            }
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Что-то пошло не так: ${(apiResultrx5?.statusCode ?? 200).toString()}',
                style: GoogleFonts.getFont(
                  'Inter',
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: Color(0xFFEE8B60),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Срок карты введён неверно',
              style: GoogleFonts.getFont(
                'Inter',
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: Color(0xFFEE8B60),
          ),
        );
        return;
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Номер карты введён неверно',
            style: GoogleFonts.getFont(
              'Inter',
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: Color(0xFFEE8B60),
        ),
      );
      return;
    }
  }

  /// Additional helper methods are added here.
}
