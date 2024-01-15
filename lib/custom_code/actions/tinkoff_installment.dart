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

import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:cake_school_web/auth/base_auth_user_provider.dart';

Future<String> tinkoffInstallment(List<TariffsRecord> tariffs) async {
  // Add your function code here!
  const requestUrl = 'https://forma.tinkoff.ru/api/partners/v2/orders/create';
  const shopId = 'a533336c-cd15-4208-b515-e5fafc38a065';
  const showcaseId = 'aa322965-631c-489a-9ebf-d705c7719fe3';

  final response = await http.post(
    Uri.parse(requestUrl),
    body: {
      "shopId": shopId,
      "showcaseId": showcaseId,
      "sum": sum(tariffs.map((tariff) => tariff.price).toList()),
      "items": tariffs
          .map((tariff) => {
                "name": tariff.name,
                "quantity": 1,
                "price": tariff.price,
                "vendorCode": tariff.reference,
              })
          .toList(),
      "orderNumber": Random().nextInt(9999999).toString(),
      "promoCode": "default",
      "values": {
        "contact": {
          "mobilePhone": "${currentUser?.uid}",
        }
      }
    },
  );

  return jsonDecode(response.body)['link'];
}
