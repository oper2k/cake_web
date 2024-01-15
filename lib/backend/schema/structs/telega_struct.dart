// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TelegaStruct extends FFFirebaseStruct {
  TelegaStruct({
    String? telegaName,
    String? telegaLink,
    String? whatsappName,
    String? whatsappLink,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _telegaName = telegaName,
        _telegaLink = telegaLink,
        _whatsappName = whatsappName,
        _whatsappLink = whatsappLink,
        super(firestoreUtilData);

  // "telegaName" field.
  String? _telegaName;
  String get telegaName => _telegaName ?? '';
  set telegaName(String? val) => _telegaName = val;
  bool hasTelegaName() => _telegaName != null;

  // "telegaLink" field.
  String? _telegaLink;
  String get telegaLink => _telegaLink ?? '';
  set telegaLink(String? val) => _telegaLink = val;
  bool hasTelegaLink() => _telegaLink != null;

  // "whatsappName" field.
  String? _whatsappName;
  String get whatsappName => _whatsappName ?? '';
  set whatsappName(String? val) => _whatsappName = val;
  bool hasWhatsappName() => _whatsappName != null;

  // "whatsappLink" field.
  String? _whatsappLink;
  String get whatsappLink => _whatsappLink ?? '';
  set whatsappLink(String? val) => _whatsappLink = val;
  bool hasWhatsappLink() => _whatsappLink != null;

  static TelegaStruct fromMap(Map<String, dynamic> data) => TelegaStruct(
        telegaName: data['telegaName'] as String?,
        telegaLink: data['telegaLink'] as String?,
        whatsappName: data['whatsappName'] as String?,
        whatsappLink: data['whatsappLink'] as String?,
      );

  static TelegaStruct? maybeFromMap(dynamic data) =>
      data is Map ? TelegaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'telegaName': _telegaName,
        'telegaLink': _telegaLink,
        'whatsappName': _whatsappName,
        'whatsappLink': _whatsappLink,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'telegaName': serializeParam(
          _telegaName,
          ParamType.String,
        ),
        'telegaLink': serializeParam(
          _telegaLink,
          ParamType.String,
        ),
        'whatsappName': serializeParam(
          _whatsappName,
          ParamType.String,
        ),
        'whatsappLink': serializeParam(
          _whatsappLink,
          ParamType.String,
        ),
      }.withoutNulls;

  static TelegaStruct fromSerializableMap(Map<String, dynamic> data) =>
      TelegaStruct(
        telegaName: deserializeParam(
          data['telegaName'],
          ParamType.String,
          false,
        ),
        telegaLink: deserializeParam(
          data['telegaLink'],
          ParamType.String,
          false,
        ),
        whatsappName: deserializeParam(
          data['whatsappName'],
          ParamType.String,
          false,
        ),
        whatsappLink: deserializeParam(
          data['whatsappLink'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TelegaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TelegaStruct &&
        telegaName == other.telegaName &&
        telegaLink == other.telegaLink &&
        whatsappName == other.whatsappName &&
        whatsappLink == other.whatsappLink;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([telegaName, telegaLink, whatsappName, whatsappLink]);
}

TelegaStruct createTelegaStruct({
  String? telegaName,
  String? telegaLink,
  String? whatsappName,
  String? whatsappLink,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TelegaStruct(
      telegaName: telegaName,
      telegaLink: telegaLink,
      whatsappName: whatsappName,
      whatsappLink: whatsappLink,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TelegaStruct? updateTelegaStruct(
  TelegaStruct? telega, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    telega
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTelegaStructData(
  Map<String, dynamic> firestoreData,
  TelegaStruct? telega,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (telega == null) {
    return;
  }
  if (telega.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && telega.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final telegaData = getTelegaFirestoreData(telega, forFieldValue);
  final nestedData = telegaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = telega.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTelegaFirestoreData(
  TelegaStruct? telega, [
  bool forFieldValue = false,
]) {
  if (telega == null) {
    return {};
  }
  final firestoreData = mapToFirestore(telega.toMap());

  // Add any Firestore field values
  telega.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTelegaListFirestoreData(
  List<TelegaStruct>? telegas,
) =>
    telegas?.map((e) => getTelegaFirestoreData(e, true)).toList() ?? [];
