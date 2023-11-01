// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourseForWhoCourseStruct extends FFFirebaseStruct {
  CourseForWhoCourseStruct({
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

  static CourseForWhoCourseStruct fromMap(Map<String, dynamic> data) =>
      CourseForWhoCourseStruct(
        image: data['image'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
      );

  static CourseForWhoCourseStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? CourseForWhoCourseStruct.fromMap(data)
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

  static CourseForWhoCourseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CourseForWhoCourseStruct(
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
  String toString() => 'CourseForWhoCourseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CourseForWhoCourseStruct &&
        image == other.image &&
        name == other.name &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([image, name, description]);
}

CourseForWhoCourseStruct createCourseForWhoCourseStruct({
  String? image,
  String? name,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CourseForWhoCourseStruct(
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

CourseForWhoCourseStruct? updateCourseForWhoCourseStruct(
  CourseForWhoCourseStruct? courseForWhoCourse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    courseForWhoCourse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCourseForWhoCourseStructData(
  Map<String, dynamic> firestoreData,
  CourseForWhoCourseStruct? courseForWhoCourse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (courseForWhoCourse == null) {
    return;
  }
  if (courseForWhoCourse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && courseForWhoCourse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final courseForWhoCourseData =
      getCourseForWhoCourseFirestoreData(courseForWhoCourse, forFieldValue);
  final nestedData =
      courseForWhoCourseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      courseForWhoCourse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCourseForWhoCourseFirestoreData(
  CourseForWhoCourseStruct? courseForWhoCourse, [
  bool forFieldValue = false,
]) {
  if (courseForWhoCourse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(courseForWhoCourse.toMap());

  // Add any Firestore field values
  courseForWhoCourse.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCourseForWhoCourseListFirestoreData(
  List<CourseForWhoCourseStruct>? courseForWhoCourses,
) =>
    courseForWhoCourses
        ?.map((e) => getCourseForWhoCourseFirestoreData(e, true))
        .toList() ??
    [];
