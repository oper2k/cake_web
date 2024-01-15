import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'roadmap_item_model.dart';
export 'roadmap_item_model.dart';

class RoadmapItemWidget extends StatefulWidget {
  const RoadmapItemWidget({
    Key? key,
    this.currentAdditionalButton,
    this.itemInList,
    this.lessonCount,
  }) : super(key: key);

  final AdditionalInfoButtonStruct? currentAdditionalButton;
  final int? itemInList;
  final int? lessonCount;

  @override
  _RoadmapItemWidgetState createState() => _RoadmapItemWidgetState();
}

class _RoadmapItemWidgetState extends State<RoadmapItemWidget> {
  late RoadmapItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RoadmapItemModel());

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
        if (functions.increase(widget.itemInList).toString() ==
            widget.lessonCount.toString())
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(17.0, 0.0, 0.0, 0.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 592.0,
              ),
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32.0, 4.0, 0.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.currentAdditionalButton!.title,
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                    Flexible(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Text(
                          widget.currentAdditionalButton!.text,
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodySmallFamily,
                                color: FlutterFlowTheme.of(context).accent1,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodySmallFamily),
                                lineHeight: 1.4,
                              ),
                        ),
                      ),
                    ),
                    if (widget.currentAdditionalButton?.additionalInfoLink !=
                            null &&
                        widget.currentAdditionalButton?.additionalInfoLink !=
                            '')
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await launchURL(widget
                                .currentAdditionalButton!.additionalInfoLink);
                          },
                          child: Container(
                            width: 281.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent4,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.currentAdditionalButton!
                                        .additionalInfoTitle,
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      widget.currentAdditionalButton!
                                          .additionalInfoText,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
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
                        ),
                      ),
                    if (widget.currentAdditionalButton?.linkTelegaButton !=
                            null &&
                        widget.currentAdditionalButton?.linkTelegaButton != '')
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await launchURL(widget
                                .currentAdditionalButton!.linkTelegaButton);
                          },
                          child: Container(
                            width: 252.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF0088CC),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FFIcons.ktelegram,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 18.0,
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      widget.currentAdditionalButton!
                                          .nameTelegaButton,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (widget.currentAdditionalButton?.linkWhatsappButton !=
                            null &&
                        widget.currentAdditionalButton?.linkWhatsappButton !=
                            '')
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await launchURL(widget
                                .currentAdditionalButton!.linkWhatsappButton);
                          },
                          child: Container(
                            width: 252.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF43D854),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FFIcons.kwattsUp,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 18.0,
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      widget.currentAdditionalButton!
                                          .nameWhatsappButton,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
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
            ),
          ),
        if (functions.increase(widget.itemInList).toString() !=
            widget.lessonCount.toString())
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(17.0, 0.0, 0.0, 0.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 592.0,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/Frame_3.png',
                  ).image,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32.0, 4.0, 0.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.currentAdditionalButton!.title,
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                    Flexible(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Text(
                          widget.currentAdditionalButton!.text,
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodySmallFamily,
                                color: FlutterFlowTheme.of(context).accent1,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodySmallFamily),
                                lineHeight: 1.4,
                              ),
                        ),
                      ),
                    ),
                    if (widget.currentAdditionalButton?.additionalInfoLink !=
                            null &&
                        widget.currentAdditionalButton?.additionalInfoLink !=
                            '')
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await launchURL(widget
                                .currentAdditionalButton!.additionalInfoLink);
                          },
                          child: Container(
                            width: 281.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent4,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.currentAdditionalButton!
                                        .additionalInfoTitle,
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      widget.currentAdditionalButton!
                                          .additionalInfoText,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
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
                        ),
                      ),
                    if (widget.currentAdditionalButton?.linkTelegaButton !=
                            null &&
                        widget.currentAdditionalButton?.linkTelegaButton != '')
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await launchURL(widget
                                .currentAdditionalButton!.linkTelegaButton);
                          },
                          child: Container(
                            width: 252.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF0088CC),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FFIcons.ktelegram,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 18.0,
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      widget.currentAdditionalButton!
                                          .nameTelegaButton,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (widget.currentAdditionalButton?.linkWhatsappButton !=
                            null &&
                        widget.currentAdditionalButton?.linkWhatsappButton !=
                            '')
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await launchURL(widget
                                .currentAdditionalButton!.linkWhatsappButton);
                          },
                          child: Container(
                            width: 252.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF43D854),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FFIcons.kwattsUp,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 18.0,
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      widget.currentAdditionalButton!
                                          .nameWhatsappButton,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
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
            ),
          ),
        Container(
          width: 36.0,
          height: 36.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).accent4,
            shape: BoxShape.circle,
          ),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              functions.increase(widget.itemInList).toString(),
              style: FlutterFlowTheme.of(context).labelSmall,
            ),
          ),
        ),
      ],
    );
  }
}
