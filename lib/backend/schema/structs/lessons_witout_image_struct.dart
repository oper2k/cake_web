// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonsWitoutImageStruct extends FFFirebaseStruct {
  LessonsWitoutImageStruct({
    String? subTitle,
    String? title,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _subTitle = subTitle,
        _title = title,
        _description = description,
        super(firestoreUtilData);

  // "subTitle" field.
  String? _subTitle;
  String get subTitle => _subTitle ?? '';
  set subTitle(String? val) => _subTitle = val;
  bool hasSubTitle() => _subTitle != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  static LessonsWitoutImageStruct fromMap(Map<String, dynamic> data) =>
      LessonsWitoutImageStruct(
        subTitle: data['subTitle'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
      );

  static LessonsWitoutImageStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? LessonsWitoutImageStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'subTitle': _subTitle,
        'title': _title,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'subTitle': serializeParam(
          _subTitle,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static LessonsWitoutImageStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LessonsWitoutImageStruct(
        subTitle: deserializeParam(
          data['subTitle'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
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
  String toString() => 'LessonsWitoutImageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LessonsWitoutImageStruct &&
        subTitle == other.subTitle &&
        title == other.title &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([subTitle, title, description]);
}

LessonsWitoutImageStruct createLessonsWitoutImageStruct({
  String? subTitle,
  String? title,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LessonsWitoutImageStruct(
      subTitle: subTitle,
      title: title,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LessonsWitoutImageStruct? updateLessonsWitoutImageStruct(
  LessonsWitoutImageStruct? lessonsWitoutImage, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    lessonsWitoutImage
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLessonsWitoutImageStructData(
  Map<String, dynamic> firestoreData,
  LessonsWitoutImageStruct? lessonsWitoutImage,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (lessonsWitoutImage == null) {
    return;
  }
  if (lessonsWitoutImage.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && lessonsWitoutImage.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final lessonsWitoutImageData =
      getLessonsWitoutImageFirestoreData(lessonsWitoutImage, forFieldValue);
  final nestedData =
      lessonsWitoutImageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      lessonsWitoutImage.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLessonsWitoutImageFirestoreData(
  LessonsWitoutImageStruct? lessonsWitoutImage, [
  bool forFieldValue = false,
]) {
  if (lessonsWitoutImage == null) {
    return {};
  }
  final firestoreData = mapToFirestore(lessonsWitoutImage.toMap());

  // Add any Firestore field values
  lessonsWitoutImage.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLessonsWitoutImageListFirestoreData(
  List<LessonsWitoutImageStruct>? lessonsWitoutImages,
) =>
    lessonsWitoutImages
        ?.map((e) => getLessonsWitoutImageFirestoreData(e, true))
        .toList() ??
    [];
