import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'gallerry_model.dart';
export 'gallerry_model.dart';

class GallerryWidget extends StatefulWidget {
  const GallerryWidget({
    Key? key,
    this.allImages,
    required this.currentIndex,
    required this.courseFree,
    required this.tariff,
  }) : super(key: key);

  final List<String>? allImages;
  final int? currentIndex;
  final bool? courseFree;
  final DocumentReference? tariff;

  @override
  _GallerryWidgetState createState() => _GallerryWidgetState();
}

class _GallerryWidgetState extends State<GallerryWidget> {
  late GallerryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GallerryModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.courseFree == true) {
        return;
      }

      if ((currentUserDocument?.rlBuyTariffs?.toList() ?? [])
          .contains(widget.tariff)) {
        return;
      }

      context.pushNamed('Courses_Old');

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
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
        body: Align(
          alignment: AlignmentDirectional(0.00, 0.00),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                maxWidth: 1200.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.network(
                            _model.currentImageIndex != null
                                ? (widget.allImages![_model.currentImageIndex!])
                                : (widget.allImages![widget.currentIndex!]),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(),
                          child: Icon(
                            FFIcons.kclose,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.00, 1.00),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 94.0),
                        child: Container(
                          height: 100.0,
                          child: Stack(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            children: [
                              Builder(
                                builder: (context) {
                                  final allImages =
                                      widget.allImages?.toList() ?? [];
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: List.generate(allImages.length,
                                              (allImagesIndex) {
                                        final allImagesItem =
                                            allImages[allImagesIndex];
                                        return Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          children: [
                                            if (((_model.currentImageIndex ==
                                                        null) &&
                                                    (widget.currentIndex ==
                                                        allImagesIndex)) ||
                                                ((_model.currentImageIndex !=
                                                        null) &&
                                                    (_model.currentImageIndex ==
                                                        allImagesIndex)))
                                              Container(
                                                width: 94.0,
                                                height: 94.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x5B767575),
                                                      offset: Offset(0.0, 2.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  child: Image.network(
                                                    allImagesItem,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            if (((_model.currentImageIndex ==
                                                        null) &&
                                                    (widget.currentIndex !=
                                                        allImagesIndex)) ||
                                                ((_model.currentImageIndex !=
                                                        null) &&
                                                    (_model.currentImageIndex !=
                                                        allImagesIndex)))
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setState(() {
                                                    _model.currentImageIndex =
                                                        allImagesIndex;
                                                  });
                                                },
                                                child: Container(
                                                  width: 87.0,
                                                  height: 87.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x5B767575),
                                                        offset:
                                                            Offset(0.0, 2.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    child: Image.network(
                                                      allImagesItem,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        );
                                      })
                                          .divide(SizedBox(width: 16.0))
                                          .addToStart(SizedBox(width: 20.0))
                                          .addToEnd(SizedBox(width: 20.0)),
                                    ),
                                  );
                                },
                              ),
                              if (responsiveVisibility(
                                context: context,
                                tablet: false,
                                tabletLandscape: false,
                                desktop: false,
                              ))
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (((_model.currentImageIndex == null) &&
                                            (widget.currentIndex != 0)) ||
                                        ((_model.currentImageIndex != null) &&
                                            (_model.currentImageIndex != 0)))
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.00, 0.00),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (_model.currentImageIndex !=
                                                null) {
                                              setState(() {
                                                _model.currentImageIndex =
                                                    _model.currentImageIndex! +
                                                        -1;
                                              });
                                              return;
                                            } else {
                                              setState(() {
                                                _model.currentImageIndex =
                                                    widget.currentIndex;
                                              });
                                              setState(() {
                                                _model.currentImageIndex =
                                                    _model.currentImageIndex! +
                                                        -1;
                                              });
                                              return;
                                            }
                                          },
                                          child: Container(
                                            width: 60.0,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xCB666666),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              FFIcons.kleftTo,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    Spacer(),
                                    if (((_model.currentImageIndex == null) &&
                                            (functions
                                                    .increase(
                                                        widget.currentIndex)
                                                    .toString() !=
                                                widget.allImages?.length
                                                    .toString())) ||
                                        ((_model.currentImageIndex != null) &&
                                            (functions
                                                    .increase(_model
                                                        .currentImageIndex)
                                                    .toString() !=
                                                widget.allImages?.length
                                                    .toString())))
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.00, 0.00),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (_model.currentImageIndex !=
                                                null) {
                                              setState(() {
                                                _model.currentImageIndex =
                                                    _model.currentImageIndex! +
                                                        1;
                                              });
                                              return;
                                            } else {
                                              setState(() {
                                                _model.currentImageIndex =
                                                    widget.currentIndex;
                                              });
                                              setState(() {
                                                _model.currentImageIndex =
                                                    _model.currentImageIndex! +
                                                        1;
                                              });
                                              return;
                                            }
                                          },
                                          child: Container(
                                            width: 60.0,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xCB666666),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              FFIcons.krightTo,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                    ))
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (((_model.currentImageIndex == null) &&
                                    (widget.currentIndex != 0)) ||
                                ((_model.currentImageIndex != null) &&
                                    (_model.currentImageIndex != 0)))
                              Align(
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.currentImageIndex != null) {
                                      setState(() {
                                        _model.currentImageIndex =
                                            _model.currentImageIndex! + -1;
                                      });
                                      return;
                                    } else {
                                      setState(() {
                                        _model.currentImageIndex =
                                            widget.currentIndex;
                                      });
                                      setState(() {
                                        _model.currentImageIndex =
                                            _model.currentImageIndex! + -1;
                                      });
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xCC666666),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      FFIcons.kleftTo,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                            Spacer(),
                            if (((_model.currentImageIndex == null) &&
                                    (functions
                                            .increase(widget.currentIndex)
                                            .toString() !=
                                        widget.allImages?.length.toString())) ||
                                ((_model.currentImageIndex != null) &&
                                    (functions
                                            .increase(_model.currentImageIndex)
                                            .toString() !=
                                        widget.allImages?.length.toString())))
                              Align(
                                alignment: AlignmentDirectional(1.00, 0.00),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.currentImageIndex != null) {
                                      setState(() {
                                        _model.currentImageIndex =
                                            _model.currentImageIndex! + 1;
                                      });
                                      return;
                                    } else {
                                      setState(() {
                                        _model.currentImageIndex =
                                            widget.currentIndex;
                                      });
                                      setState(() {
                                        _model.currentImageIndex =
                                            _model.currentImageIndex! + 1;
                                      });
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xCB666666),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      FFIcons.krightTo,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 24.0,
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
        ),
      ),
    );
  }
}
