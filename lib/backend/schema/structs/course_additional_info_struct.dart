// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourseAdditionalInfoStruct extends FFFirebaseStruct {
  CourseAdditionalInfoStruct({
    String? number,
    String? name,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _number = number,
        _name = name,
        _description = description,
        super(firestoreUtilData);

  // "number" field.
  String? _number;
  String get number => _number ?? '';
  set number(String? val) => _number = val;
  bool hasNumber() => _number != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  static CourseAdditionalInfoStruct fromMap(Map<String, dynamic> data) =>
      CourseAdditionalInfoStruct(
        number: data['number'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
      );

  static CourseAdditionalInfoStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? CourseAdditionalInfoStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'number': _number,
        'name': _name,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'number': serializeParam(
          _number,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static CourseAdditionalInfoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CourseAdditionalInfoStruct(
        number: deserializeParam(
          data['number'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CourseAdditionalInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CourseAdditionalInfoStruct &&
        number == other.number &&
        name == other.name &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([number, name, description]);
}

CourseAdditionalInfoStruct createCourseAdditionalInfoStruct({
  String? number,
  String? name,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CourseAdditionalInfoStruct(
      number: number,
      name: name,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CourseAdditionalInfoStruct? updateCourseAdditionalInfoStruct(
  CourseAdditionalInfoStruct? courseAdditionalInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    courseAdditionalInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCourseAdditionalInfoStructData(
  Map<String, dynamic> firestoreData,
  CourseAdditionalInfoStruct? courseAdditionalInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (courseAdditionalInfo == null) {
    return;
  }
  if (courseAdditionalInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && courseAdditionalInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final courseAdditionalInfoData =
      getCourseAdditionalInfoFirestoreData(courseAdditionalInfo, forFieldValue);
  final nestedData =
      courseAdditionalInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      courseAdditionalInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCourseAdditionalInfoFirestoreData(
  CourseAdditionalInfoStruct? courseAdditionalInfo, [
  bool forFieldValue = false,
]) {
  if (courseAdditionalInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(courseAdditionalInfo.toMap());

  // Add any Firestore field values
  courseAdditionalInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCourseAdditionalInfoListFirestoreData(
  List<CourseAdditionalInfoStruct>? courseAdditionalInfos,
) =>
    courseAdditionalInfos
        ?.map((e) => getCourseAdditionalInfoFirestoreData(e, true))
        .toList() ??
    [];
