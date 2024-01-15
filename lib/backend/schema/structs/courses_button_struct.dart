// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoursesButtonStruct extends FFFirebaseStruct {
  CoursesButtonStruct({
    String? name,
    bool? withLink,
    String? link,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _withLink = withLink,
        _link = link,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "withLink" field.
  bool? _withLink;
  bool get withLink => _withLink ?? false;
  set withLink(bool? val) => _withLink = val;
  bool hasWithLink() => _withLink != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;
  bool hasLink() => _link != null;

  static CoursesButtonStruct fromMap(Map<String, dynamic> data) =>
      CoursesButtonStruct(
        name: data['name'] as String?,
        withLink: data['withLink'] as bool?,
        link: data['link'] as String?,
      );

  static CoursesButtonStruct? maybeFromMap(dynamic data) => data is Map
      ? CoursesButtonStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'withLink': _withLink,
        'link': _link,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'withLink': serializeParam(
          _withLink,
          ParamType.bool,
        ),
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
      }.withoutNulls;

  static CoursesButtonStruct fromSerializableMap(Map<String, dynamic> data) =>
      CoursesButtonStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        withLink: deserializeParam(
          data['withLink'],
          ParamType.bool,
          false,
        ),
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CoursesButtonStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CoursesButtonStruct &&
        name == other.name &&
        withLink == other.withLink &&
        link == other.link;
  }

  @override
  int get hashCode => const ListEquality().hash([name, withLink, link]);
}

CoursesButtonStruct createCoursesButtonStruct({
  String? name,
  bool? withLink,
  String? link,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CoursesButtonStruct(
      name: name,
      withLink: withLink,
      link: link,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CoursesButtonStruct? updateCoursesButtonStruct(
  CoursesButtonStruct? coursesButton, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    coursesButton
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCoursesButtonStructData(
  Map<String, dynamic> firestoreData,
  CoursesButtonStruct? coursesButton,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (coursesButton == null) {
    return;
  }
  if (coursesButton.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && coursesButton.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final coursesButtonData =
      getCoursesButtonFirestoreData(coursesButton, forFieldValue);
  final nestedData =
      coursesButtonData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = coursesButton.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCoursesButtonFirestoreData(
  CoursesButtonStruct? coursesButton, [
  bool forFieldValue = false,
]) {
  if (coursesButton == null) {
    return {};
  }
  final firestoreData = mapToFirestore(coursesButton.toMap());

  // Add any Firestore field values
  coursesButton.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCoursesButtonListFirestoreData(
  List<CoursesButtonStruct>? coursesButtons,
) =>
    coursesButtons
        ?.map((e) => getCoursesButtonFirestoreData(e, true))
        .toList() ??
    [];
