// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import "dart:js" as js;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cake_school_web/auth/base_auth_user_provider.dart';

Future showPaymentWidget(List<TariffsRecord> tarrifsToBuy) async {
  js.context.callMethod('showPaymentWidget', [
    valueOrDefault<int>(
      functions.sum(tarrifsToBuy
          .where((e) => FFAppState().basketTariffs.contains(e.reference))
          .toList()
          .map((e) => e.price)
          .toList()),
      0,
    ),
    'Оплата',
    currentUser!.uid,
    FFAppState().basketTariffs.map((e) => e.id).join(';'),
  ]);
}
