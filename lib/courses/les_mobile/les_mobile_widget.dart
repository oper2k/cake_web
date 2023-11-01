import '/backend/backend.dart';
import '/courses/photto_item/photto_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'les_mobile_model.dart';
export 'les_mobile_model.dart';

class LesMobileWidget extends StatefulWidget {
  const LesMobileWidget({
    Key? key,
    this.userDoc,
    this.currentState,
    this.currentLesson,
    required this.index,
    required this.countLessons,
    required this.isFree,
  }) : super(key: key);

  final UsersRecord? userDoc;
  final int? currentState;
  final LessonsRecord? currentLesson;
  final int? index;
  final int? countLessons;
  final bool? isFree;

  @override
  _LesMobileWidgetState createState() => _LesMobileWidgetState();
}

class _LesMobileWidgetState extends State<LesMobileWidget> {
  late LesMobileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LesMobileModel());

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
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: AlignmentDirectional(-1.00, 0.00),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.userDoc?.rlFinishedLessons
                            ?.contains(widget.currentLesson?.reference) ??
                        true)
                      Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).green2009F4E,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          FFIcons.kcheckmark,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          size: 12.0,
                        ),
                      ),
                    if (!widget.userDoc!.rlFinishedLessons
                        .contains(widget.currentLesson?.reference))
                      CircularPercentIndicator(
                        percent: 0.0,
                        radius: 10.0,
                        lineWidth: 4.0,
                        animation: true,
                        animateFromLastPercent: true,
                        progressColor:
                            FlutterFlowTheme.of(context).green2009F4E,
                        backgroundColor:
                            FlutterFlowTheme.of(context).green181C795,
                      ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 0.0, 0.0),
                    child: Text(
                      widget.currentLesson!.name,
                      style: FlutterFlowTheme.of(context).bodyLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(2.0, 16.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 108.0,
                  child: StyledVerticalDivider(
                    thickness: 1.0,
                    color:
                        functions.increase(widget.index) != widget.countLessons
                            ? Color(0x33000000)
                            : Colors.transparent,
                    lineStyle: DividerLineStyle.dashed,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.phottoItemModel,
                              updateCallback: () => setState(() {}),
                              child: PhottoItemWidget(
                                currentState: widget.currentState,
                                image: widget.currentLesson?.image,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        widget.currentLesson!.subname,
                                        maxLines: 7,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (widget.currentState == 1)
                          Stack(
                            children: [
                              if (widget.isFree ?? true)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.00, 0.00),
                                          child: Text(
                                            'Урок откроется: ${valueOrDefault<String>(
                                              functions.dateOnRussian(
                                                  functions.addSomeDaysToDate(
                                                      functions
                                                          .returnDiffInDaysUserCreate(
                                                              widget.userDoc!)!,
                                                      widget.currentLesson!
                                                          .openDay)),
                                              'Нет даты',
                                            )}',
                                            maxLines: 3,
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmallFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (!widget.isFree!)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.00, 0.00),
                                          child: Text(
                                            'Урок откроется: ${valueOrDefault<String>(
                                              functions.dateToRussian(widget
                                                  .currentLesson?.openDate),
                                              'Нет даты',
                                            )}',
                                            maxLines: 3,
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmallFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
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
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
