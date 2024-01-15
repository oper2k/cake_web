// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourseMoreStruct extends FFFirebaseStruct {
  CourseMoreStruct({
    String? image,
    String? title,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _image = image,
        _title = title,
        super(firestoreUtilData);

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  static CourseMoreStruct fromMap(Map<String, dynamic> data) =>
      CourseMoreStruct(
        image: data['image'] as String?,
        title: data['title'] as String?,
      );

  static CourseMoreStruct? maybeFromMap(dynamic data) => data is Map
      ? CourseMoreStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'title': _title,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
      }.withoutNulls;

  static CourseMoreStruct fromSerializableMap(Map<String, dynamic> data) =>
      CourseMoreStruct(
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CourseMoreStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CourseMoreStruct &&
        image == other.image &&
        title == other.title;
  }

  @override
  int get hashCode => const ListEquality().hash([image, title]);
}

CourseMoreStruct createCourseMoreStruct({
  String? image,
  String? title,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CourseMoreStruct(
      image: image,
      title: title,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CourseMoreStruct? updateCourseMoreStruct(
  CourseMoreStruct? courseMore, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    courseMore
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCourseMoreStructData(
  Map<String, dynamic> firestoreData,
  CourseMoreStruct? courseMore,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (courseMore == null) {
    return;
  }
  if (courseMore.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && courseMore.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final courseMoreData = getCourseMoreFirestoreData(courseMore, forFieldValue);
  final nestedData = courseMoreData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = courseMore.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCourseMoreFirestoreData(
  CourseMoreStruct? courseMore, [
  bool forFieldValue = false,
]) {
  if (courseMore == null) {
    return {};
  }
  final firestoreData = mapToFirestore(courseMore.toMap());

  // Add any Firestore field values
  courseMore.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCourseMoreListFirestoreData(
  List<CourseMoreStruct>? courseMores,
) =>
    courseMores?.map((e) => getCourseMoreFirestoreData(e, true)).toList() ?? [];
