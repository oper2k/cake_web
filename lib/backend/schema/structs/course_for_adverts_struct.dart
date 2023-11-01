// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourseForAdvertsStruct extends FFFirebaseStruct {
  CourseForAdvertsStruct({
    String? name,
    String? subname,
    String? image,
    String? link,
    String? buttonName,
    String? buttonNameCourse,
    DocumentReference? buttonCourseRefCourse,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _subname = subname,
        _image = image,
        _link = link,
        _buttonName = buttonName,
        _buttonNameCourse = buttonNameCourse,
        _buttonCourseRefCourse = buttonCourseRefCourse,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "subname" field.
  String? _subname;
  String get subname => _subname ?? '';
  set subname(String? val) => _subname = val;
  bool hasSubname() => _subname != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;
  bool hasLink() => _link != null;

  // "buttonName" field.
  String? _buttonName;
  String get buttonName => _buttonName ?? '';
  set buttonName(String? val) => _buttonName = val;
  bool hasButtonName() => _buttonName != null;

  // "button_name_course" field.
  String? _buttonNameCourse;
  String get buttonNameCourse => _buttonNameCourse ?? '';
  set buttonNameCourse(String? val) => _buttonNameCourse = val;
  bool hasButtonNameCourse() => _buttonNameCourse != null;

  // "button_courseRef_course" field.
  DocumentReference? _buttonCourseRefCourse;
  DocumentReference? get buttonCourseRefCourse => _buttonCourseRefCourse;
  set buttonCourseRefCourse(DocumentReference? val) =>
      _buttonCourseRefCourse = val;
  bool hasButtonCourseRefCourse() => _buttonCourseRefCourse != null;

  static CourseForAdvertsStruct fromMap(Map<String, dynamic> data) =>
      CourseForAdvertsStruct(
        name: data['name'] as String?,
        subname: data['subname'] as String?,
        image: data['image'] as String?,
        link: data['link'] as String?,
        buttonName: data['buttonName'] as String?,
        buttonNameCourse: data['button_name_course'] as String?,
        buttonCourseRefCourse:
            data['button_courseRef_course'] as DocumentReference?,
      );

  static CourseForAdvertsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? CourseForAdvertsStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'subname': _subname,
        'image': _image,
        'link': _link,
        'buttonName': _buttonName,
        'button_name_course': _buttonNameCourse,
        'button_courseRef_course': _buttonCourseRefCourse,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'subname': serializeParam(
          _subname,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
        'buttonName': serializeParam(
          _buttonName,
          ParamType.String,
        ),
        'button_name_course': serializeParam(
          _buttonNameCourse,
          ParamType.String,
        ),
        'button_courseRef_course': serializeParam(
          _buttonCourseRefCourse,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static CourseForAdvertsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CourseForAdvertsStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        subname: deserializeParam(
          data['subname'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
        buttonName: deserializeParam(
          data['buttonName'],
          ParamType.String,
          false,
        ),
        buttonNameCourse: deserializeParam(
          data['button_name_course'],
          ParamType.String,
          false,
        ),
        buttonCourseRefCourse: deserializeParam(
          data['button_courseRef_course'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['courses'],
        ),
      );

  @override
  String toString() => 'CourseForAdvertsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CourseForAdvertsStruct &&
        name == other.name &&
        subname == other.subname &&
        image == other.image &&
        link == other.link &&
        buttonName == other.buttonName &&
        buttonNameCourse == other.buttonNameCourse &&
        buttonCourseRefCourse == other.buttonCourseRefCourse;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        subname,
        image,
        link,
        buttonName,
        buttonNameCourse,
        buttonCourseRefCourse
      ]);
}

CourseForAdvertsStruct createCourseForAdvertsStruct({
  String? name,
  String? subname,
  String? image,
  String? link,
  String? buttonName,
  String? buttonNameCourse,
  DocumentReference? buttonCourseRefCourse,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CourseForAdvertsStruct(
      name: name,
      subname: subname,
      image: image,
      link: link,
      buttonName: buttonName,
      buttonNameCourse: buttonNameCourse,
      buttonCourseRefCourse: buttonCourseRefCourse,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CourseForAdvertsStruct? updateCourseForAdvertsStruct(
  CourseForAdvertsStruct? courseForAdverts, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    courseForAdverts
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCourseForAdvertsStructData(
  Map<String, dynamic> firestoreData,
  CourseForAdvertsStruct? courseForAdverts,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (courseForAdverts == null) {
    return;
  }
  if (courseForAdverts.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && courseForAdverts.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final courseForAdvertsData =
      getCourseForAdvertsFirestoreData(courseForAdverts, forFieldValue);
  final nestedData =
      courseForAdvertsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = courseForAdverts.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCourseForAdvertsFirestoreData(
  CourseForAdvertsStruct? courseForAdverts, [
  bool forFieldValue = false,
]) {
  if (courseForAdverts == null) {
    return {};
  }
  final firestoreData = mapToFirestore(courseForAdverts.toMap());

  // Add any Firestore field values
  courseForAdverts.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCourseForAdvertsListFirestoreData(
  List<CourseForAdvertsStruct>? courseForAdvertss,
) =>
    courseForAdvertss
        ?.map((e) => getCourseForAdvertsFirestoreData(e, true))
        .toList() ??
    [];
