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

// If you want to show 3ds dialog on Android, make MainActivity implements FlutterFragmentActivity
// instead of FlutterActivity
// android/app/src/main/.../MainActivity.kt:
// import io.flutter.embedding.android.FlutterFragmentActivity
// class MainActivity: FlutterFragmentActivity() {}

import 'package:flutter/services.dart';

const MethodChannel _channel = const MethodChannel('cloudpayments');

Future<List<String>?> check3DSCloudPayments(
  String acsUrl,
  String transactionId,
  String paReq,
) async {
  final dynamic arguments = await _channel.invokeMethod<dynamic>('show3ds', {
    'acsUrl': acsUrl,
    'transactionId': transactionId,
    'paReq': paReq,
  });
  if (arguments == null) {
    return null;
  } else {
    print(arguments['md'].toString());
    print(arguments['paRes'].toString());
    return [arguments['md'].toString(), arguments['paRes'].toString()];
  }
  // Add your function code here!
}
