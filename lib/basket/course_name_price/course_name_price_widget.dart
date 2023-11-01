import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'course_name_price_model.dart';
export 'course_name_price_model.dart';

class CourseNamePriceWidget extends StatefulWidget {
  const CourseNamePriceWidget({Key? key}) : super(key: key);

  @override
  _CourseNamePriceWidgetState createState() => _CourseNamePriceWidgetState();
}

class _CourseNamePriceWidgetState extends State<CourseNamePriceWidget> {
  late CourseNamePriceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CourseNamePriceModel());

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

    return Builder(
      builder: (context) {
        final tarifsInBasket = FFAppState().basketTariffs.toList();
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: List.generate(tarifsInBasket.length, (tarifsInBasketIndex) {
            final tarifsInBasketItem = tarifsInBasket[tarifsInBasketIndex];
            return FutureBuilder<TariffsRecord>(
              future: TariffsRecord.getDocumentOnce(tarifsInBasketItem),
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
                final containerTariffsRecord = snapshot.data!;
                return Container(
                  width: double.infinity,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: FutureBuilder<CoursesRecord>(
                    future: CoursesRecord.getDocumentOnce(
                        containerTariffsRecord.rlCourse!),
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
                      final rowCoursesRecord = snapshot.data!;
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible(
                                  child: Text(
                                    'Курс \"${rowCoursesRecord.name}\"',
                                    maxLines: 2,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
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
                          Text(
                            '${containerTariffsRecord.price.toString()} ₽',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            );
          }),
        );
      },
    );
  }
}
