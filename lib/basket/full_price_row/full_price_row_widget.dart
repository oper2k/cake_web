import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'full_price_row_model.dart';
export 'full_price_row_model.dart';

class FullPriceRowWidget extends StatefulWidget {
  const FullPriceRowWidget({
    Key? key,
    this.fullPrice,
  }) : super(key: key);

  final int? fullPrice;

  @override
  _FullPriceRowWidgetState createState() => _FullPriceRowWidgetState();
}

class _FullPriceRowWidgetState extends State<FullPriceRowWidget> {
  late FullPriceRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FullPriceRowModel());

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
      width: 500.0,
      height: 28.0,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Общая стоимость',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 17.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyMediumFamily),
                  lineHeight: 1.6,
                ),
          ),
          Text(
            '${widget.fullPrice?.toString()} ₽',
            style: FlutterFlowTheme.of(context).labelLarge.override(
                  fontFamily: 'Inter',
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).labelLargeFamily),
                  lineHeight: 1.4,
                ),
          ),
        ],
      ),
    );
  }
}
