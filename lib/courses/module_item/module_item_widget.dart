import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'module_item_model.dart';
export 'module_item_model.dart';

class ModuleItemWidget extends StatefulWidget {
  const ModuleItemWidget({
    Key? key,
    int? activeModule,
    this.currentModule,
    this.userDoc,
  })  : this.activeModule = activeModule ?? 0,
        super(key: key);

  final int activeModule;
  final ModulesRecord? currentModule;
  final UsersRecord? userDoc;

  @override
  _ModuleItemWidgetState createState() => _ModuleItemWidgetState();
}

class _ModuleItemWidgetState extends State<ModuleItemWidget> {
  late ModuleItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModuleItemModel());

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

    return Stack(
      children: [
        if (widget.activeModule == 1)
          Container(
            width: 368.0,
            height: 70.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryText,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.userDoc?.rlFinishedModule
                              ?.contains(widget.currentModule?.reference) ??
                          true)
                        Container(
                          width: 24.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).green2009F4E,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            FFIcons.kcheckmark,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 12.0,
                          ),
                        ),
                      if (!widget.userDoc!.rlFinishedModule
                              .contains(widget.currentModule?.reference) &&
                          widget.userDoc!.rlStartModule
                              .contains(widget.currentModule?.reference))
                        CircularPercentIndicator(
                          percent: 0.35,
                          radius: 12.0,
                          lineWidth: 4.0,
                          animation: true,
                          animateFromLastPercent: true,
                          progressColor: Color(0xFF009F4E),
                          backgroundColor:
                              FlutterFlowTheme.of(context).black3666666,
                        ),
                      if (!widget.userDoc!.rlFinishedModule
                              .contains(widget.currentModule?.reference) &&
                          !widget.userDoc!.rlStartModule
                              .contains(widget.currentModule?.reference))
                        CircularPercentIndicator(
                          percent: 0.0,
                          radius: 12.0,
                          lineWidth: 4.0,
                          animation: true,
                          animateFromLastPercent: true,
                          progressColor:
                              FlutterFlowTheme.of(context).black3666666,
                          backgroundColor:
                              FlutterFlowTheme.of(context).black3666666,
                        ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.currentModule!.name,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Text(
                              'Модуль ${widget.currentModule?.index?.toString()}',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodySmallFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodySmallFamily),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(),
                    child: Icon(
                      FFIcons.krightTo,
                      color: FlutterFlowTheme.of(context).accent2,
                      size: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (widget.activeModule == 0)
          Container(
            width: 368.0,
            height: 70.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).accent3,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.userDoc?.rlFinishedModule
                              ?.contains(widget.currentModule?.reference) ??
                          true)
                        Container(
                          width: 24.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).green2009F4E,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            FFIcons.kcheckmark,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 12.0,
                          ),
                        ),
                      if (!widget.userDoc!.rlFinishedModule
                              .contains(widget.currentModule?.reference) &&
                          widget.userDoc!.rlStartModule
                              .contains(widget.currentModule?.reference))
                        CircularPercentIndicator(
                          percent: 0.35,
                          radius: 12.0,
                          lineWidth: 4.0,
                          animation: true,
                          animateFromLastPercent: true,
                          progressColor: Color(0xFF009F4E),
                          backgroundColor: FlutterFlowTheme.of(context).accent4,
                        ),
                      if (!widget.userDoc!.rlFinishedModule
                              .contains(widget.currentModule?.reference) &&
                          !widget.userDoc!.rlStartModule
                              .contains(widget.currentModule?.reference))
                        CircularPercentIndicator(
                          percent: 0.0,
                          radius: 12.0,
                          lineWidth: 4.0,
                          animation: true,
                          animateFromLastPercent: true,
                          progressColor: FlutterFlowTheme.of(context).accent4,
                          backgroundColor: FlutterFlowTheme.of(context).accent4,
                        ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.currentModule!.name,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Text(
                              'Модуль ${widget.currentModule?.index?.toString()}',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodySmallFamily,
                                    color: FlutterFlowTheme.of(context).accent1,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodySmallFamily),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(),
                    child: Icon(
                      FFIcons.krightTo,
                      color: FlutterFlowTheme.of(context).accent1,
                      size: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
