import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'photto_item_model.dart';
export 'photto_item_model.dart';

class PhottoItemWidget extends StatefulWidget {
  const PhottoItemWidget({
    Key? key,
    this.currentState,
    this.image,
  }) : super(key: key);

  final int? currentState;
  final String? image;

  @override
  _PhottoItemWidgetState createState() => _PhottoItemWidgetState();
}

class _PhottoItemWidgetState extends State<PhottoItemWidget> {
  late PhottoItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhottoItemModel());

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
        if ((widget.currentState == 1) || (widget.currentState == 2))
          Container(
            width: 76.0,
            height: 76.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).accent3,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Icon(
              Icons.lock_outline_rounded,
              color: FlutterFlowTheme.of(context).accent1,
              size: 34.0,
            ),
          ),
        if (widget.currentState == 0)
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(
              widget.image!,
              width: 76.0,
              height: 76.0,
              fit: BoxFit.cover,
            ),
          ),
      ],
    );
  }
}
