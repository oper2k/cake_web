// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonAdditionalInfoStruct extends FFFirebaseStruct {
  LessonAdditionalInfoStruct({
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

  static LessonAdditionalInfoStruct fromMap(Map<String, dynamic> data) =>
      LessonAdditionalInfoStruct(
        title: data['title'] as String?,
        text: data['text'] as String?,
      );

  static LessonAdditionalInfoStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? LessonAdditionalInfoStruct.fromMap(data)
          : null;

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

  static LessonAdditionalInfoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LessonAdditionalInfoStruct(
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
  String toString() => 'LessonAdditionalInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LessonAdditionalInfoStruct &&
        title == other.title &&
        text == other.text;
  }

  @override
  int get hashCode => const ListEquality().hash([title, text]);
}

LessonAdditionalInfoStruct createLessonAdditionalInfoStruct({
  String? title,
  String? text,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LessonAdditionalInfoStruct(
      title: title,
      text: text,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LessonAdditionalInfoStruct? updateLessonAdditionalInfoStruct(
  LessonAdditionalInfoStruct? lessonAdditionalInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    lessonAdditionalInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLessonAdditionalInfoStructData(
  Map<String, dynamic> firestoreData,
  LessonAdditionalInfoStruct? lessonAdditionalInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (lessonAdditionalInfo == null) {
    return;
  }
  if (lessonAdditionalInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && lessonAdditionalInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final lessonAdditionalInfoData =
      getLessonAdditionalInfoFirestoreData(lessonAdditionalInfo, forFieldValue);
  final nestedData =
      lessonAdditionalInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      lessonAdditionalInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLessonAdditionalInfoFirestoreData(
  LessonAdditionalInfoStruct? lessonAdditionalInfo, [
  bool forFieldValue = false,
]) {
  if (lessonAdditionalInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(lessonAdditionalInfo.toMap());

  // Add any Firestore field values
  lessonAdditionalInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLessonAdditionalInfoListFirestoreData(
  List<LessonAdditionalInfoStruct>? lessonAdditionalInfos,
) =>
    lessonAdditionalInfos
        ?.map((e) => getLessonAdditionalInfoFirestoreData(e, true))
        .toList() ??
    [];
