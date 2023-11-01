// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdditionalInfoStruct extends FFFirebaseStruct {
  AdditionalInfoStruct({
    String? title,
    String? text,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _text = text,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;
  bool hasText() => _text != null;

  static AdditionalInfoStruct fromMap(Map<String, dynamic> data) =>
      AdditionalInfoStruct(
        title: data['title'] as String?,
        text: data['text'] as String?,
      );

  static AdditionalInfoStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AdditionalInfoStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'text': _text,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
      }.withoutNulls;

  static AdditionalInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      AdditionalInfoStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AdditionalInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AdditionalInfoStruct &&
        title == other.title &&
        text == other.text;
  }

  @override
  int get hashCode => const ListEquality().hash([title, text]);
}

AdditionalInfoStruct createAdditionalInfoStruct({
  String? title,
  String? text,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AdditionalInfoStruct(
      title: title,
      text: text,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AdditionalInfoStruct? updateAdditionalInfoStruct(
  AdditionalInfoStruct? additionalInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    additionalInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAdditionalInfoStructData(
  Map<String, dynamic> firestoreData,
  AdditionalInfoStruct? additionalInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (additionalInfo == null) {
    return;
  }
  if (additionalInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && additionalInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final additionalInfoData =
      getAdditionalInfoFirestoreData(additionalInfo, forFieldValue);
  final nestedData =
      additionalInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = additionalInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAdditionalInfoFirestoreData(
  AdditionalInfoStruct? additionalInfo, [
  bool forFieldValue = false,
]) {
  if (additionalInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(additionalInfo.toMap());

  // Add any Firestore field values
  additionalInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAdditionalInfoListFirestoreData(
  List<AdditionalInfoStruct>? additionalInfos,
) =>
    additionalInfos
        ?.map((e) => getAdditionalInfoFirestoreData(e, true))
        .toList() ??
    [];
