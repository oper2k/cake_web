// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourseBonusesStruct extends FFFirebaseStruct {
  CourseBonusesStruct({
    String? image,
    String? name,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _image = image,
        _name = name,
        _description = description,
        super(firestoreUtilData);

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

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

  static CourseBonusesStruct fromMap(Map<String, dynamic> data) =>
      CourseBonusesStruct(
        image: data['image'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
      );

  static CourseBonusesStruct? maybeFromMap(dynamic data) => data is Map
      ? CourseBonusesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'name': _name,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
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

  static CourseBonusesStruct fromSerializableMap(Map<String, dynamic> data) =>
      CourseBonusesStruct(
        image: deserializeParam(
          data['image'],
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
  String toString() => 'CourseBonusesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CourseBonusesStruct &&
        image == other.image &&
        name == other.name &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([image, name, description]);
}

CourseBonusesStruct createCourseBonusesStruct({
  String? image,
  String? name,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CourseBonusesStruct(
      image: image,
      name: name,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CourseBonusesStruct? updateCourseBonusesStruct(
  CourseBonusesStruct? courseBonuses, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    courseBonuses
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCourseBonusesStructData(
  Map<String, dynamic> firestoreData,
  CourseBonusesStruct? courseBonuses,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (courseBonuses == null) {
    return;
  }
  if (courseBonuses.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && courseBonuses.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final courseBonusesData =
      getCourseBonusesFirestoreData(courseBonuses, forFieldValue);
  final nestedData =
      courseBonusesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = courseBonuses.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCourseBonusesFirestoreData(
  CourseBonusesStruct? courseBonuses, [
  bool forFieldValue = false,
]) {
  if (courseBonuses == null) {
    return {};
  }
  final firestoreData = mapToFirestore(courseBonuses.toMap());

  // Add any Firestore field values
  courseBonuses.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCourseBonusesListFirestoreData(
  List<CourseBonusesStruct>? courseBonusess,
) =>
    courseBonusess
        ?.map((e) => getCourseBonusesFirestoreData(e, true))
        .toList() ??
    [];
