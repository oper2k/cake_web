import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/basket/pay_complete/pay_complete_widget.dart';
import '/components/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'complete_model.dart';
export 'complete_model.dart';

class CompleteWidget extends StatefulWidget {
  const CompleteWidget({
    Key? key,
    required this.tariffsInBasket,
  }) : super(key: key);

  final List<TariffsRecord>? tariffsInBasket;

  @override
  _CompleteWidgetState createState() => _CompleteWidgetState();
}

class _CompleteWidgetState extends State<CompleteWidget> {
  late CompleteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompleteModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while (_model.countLoopAction < FFAppState().basketTariffs.length) {
        _model.apiResultlvv = await GetResponseGroup.addContactCall.call(
          email: currentUserEmail,
          campaignId: widget.tariffsInBasket?[_model.countLoopAction]?.tokenId,
          name: currentUserDisplayName,
        );
        setState(() {
          _model.countLoopAction = _model.countLoopAction + 1;
        });
      }
      setState(() {
        FFAppState().deleteBasketTariffs();
        FFAppState().basketTariffs = [];
      });
      await Future.delayed(const Duration(milliseconds: 3000));

      context.pushNamed(
        'Courses_Old',
        extra: <String, dynamic>{
          kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );
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
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 1250.0,
              ),
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  wrapWithModel(
                    model: _model.appBarModel,
                    updateCallback: () => setState(() {}),
                    child: AppBarWidget(
                      selected: 1,
                    ),
                  ),
                  Lottie.asset(
                    'assets/lottie_animations/ivrk6_.json',
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    fit: BoxFit.contain,
                    animate: true,
                  ),
                  wrapWithModel(
                    model: _model.payCompleteModel,
                    updateCallback: () => setState(() {}),
                    child: PayCompleteWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
