// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourseReviewStruct extends FFFirebaseStruct {
  CourseReviewStruct({
    String? subTitle,
    String? title,
    String? image,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _subTitle = subTitle,
        _title = title,
        _image = image,
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

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  static CourseReviewStruct fromMap(Map<String, dynamic> data) =>
      CourseReviewStruct(
        subTitle: data['subTitle'] as String?,
        title: data['title'] as String?,
        image: data['image'] as String?,
        description: data['description'] as String?,
      );

  static CourseReviewStruct? maybeFromMap(dynamic data) => data is Map
      ? CourseReviewStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'subTitle': _subTitle,
        'title': _title,
        'image': _image,
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
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static CourseReviewStruct fromSerializableMap(Map<String, dynamic> data) =>
      CourseReviewStruct(
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
        image: deserializeParam(
          data['image'],
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
  String toString() => 'CourseReviewStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CourseReviewStruct &&
        subTitle == other.subTitle &&
        title == other.title &&
        image == other.image &&
        description == other.description;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([subTitle, title, image, description]);
}

CourseReviewStruct createCourseReviewStruct({
  String? subTitle,
  String? title,
  String? image,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CourseReviewStruct(
      subTitle: subTitle,
      title: title,
      image: image,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CourseReviewStruct? updateCourseReviewStruct(
  CourseReviewStruct? courseReview, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    courseReview
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCourseReviewStructData(
  Map<String, dynamic> firestoreData,
  CourseReviewStruct? courseReview,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (courseReview == null) {
    return;
  }
  if (courseReview.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && courseReview.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final courseReviewData =
      getCourseReviewFirestoreData(courseReview, forFieldValue);
  final nestedData =
      courseReviewData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = courseReview.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCourseReviewFirestoreData(
  CourseReviewStruct? courseReview, [
  bool forFieldValue = false,
]) {
  if (courseReview == null) {
    return {};
  }
  final firestoreData = mapToFirestore(courseReview.toMap());

  // Add any Firestore field values
  courseReview.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCourseReviewListFirestoreData(
  List<CourseReviewStruct>? courseReviews,
) =>
    courseReviews?.map((e) => getCourseReviewFirestoreData(e, true)).toList() ??
    [];
