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

Future<List<DocumentReference>> combines2Lists(
  List<DocumentReference> listInBasket,
  List<DocumentReference> listInDoc,
) async {
  List<DocumentReference> combinedList = [];

  // Add all elements from listInBasket to combinedList
  combinedList.addAll(listInBasket);

  // Loop through listInDoc and add elements to combinedList if they are not already present
  for (DocumentReference docRef in listInDoc) {
    if (!combinedList.contains(docRef)) {
      combinedList.add(docRef);
    }
  }

  return combinedList;
}
