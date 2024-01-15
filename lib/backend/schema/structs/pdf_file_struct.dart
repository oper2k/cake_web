// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PdfFileStruct extends FFFirebaseStruct {
  PdfFileStruct({
    String? name,
    String? subname,
    String? link,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _subname = subname,
        _link = link,
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

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;
  bool hasLink() => _link != null;

  static PdfFileStruct fromMap(Map<String, dynamic> data) => PdfFileStruct(
        name: data['name'] as String?,
        subname: data['subname'] as String?,
        link: data['link'] as String?,
      );

  static PdfFileStruct? maybeFromMap(dynamic data) =>
      data is Map ? PdfFileStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'subname': _subname,
        'link': _link,
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
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
      }.withoutNulls;

  static PdfFileStruct fromSerializableMap(Map<String, dynamic> data) =>
      PdfFileStruct(
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
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PdfFileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PdfFileStruct &&
        name == other.name &&
        subname == other.subname &&
        link == other.link;
  }

  @override
  int get hashCode => const ListEquality().hash([name, subname, link]);
}

PdfFileStruct createPdfFileStruct({
  String? name,
  String? subname,
  String? link,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PdfFileStruct(
      name: name,
      subname: subname,
      link: link,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PdfFileStruct? updatePdfFileStruct(
  PdfFileStruct? pdfFile, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pdfFile
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPdfFileStructData(
  Map<String, dynamic> firestoreData,
  PdfFileStruct? pdfFile,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pdfFile == null) {
    return;
  }
  if (pdfFile.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pdfFile.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pdfFileData = getPdfFileFirestoreData(pdfFile, forFieldValue);
  final nestedData = pdfFileData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pdfFile.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPdfFileFirestoreData(
  PdfFileStruct? pdfFile, [
  bool forFieldValue = false,
]) {
  if (pdfFile == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pdfFile.toMap());

  // Add any Firestore field values
  pdfFile.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPdfFileListFirestoreData(
  List<PdfFileStruct>? pdfFiles,
) =>
    pdfFiles?.map((e) => getPdfFileFirestoreData(e, true)).toList() ?? [];
