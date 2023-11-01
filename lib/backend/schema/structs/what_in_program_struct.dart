// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WhatInProgramStruct extends FFFirebaseStruct {
  WhatInProgramStruct({
    String? image,
    String? index,
    String? name,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _image = image,
        _index = index,
        _name = name,
        _description = description,
        super(firestoreUtilData);

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  // "index" field.
  String? _index;
  String get index => _index ?? '';
  set index(String? val) => _index = val;
  bool hasIndex() => _index != null;

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

  static WhatInProgramStruct fromMap(Map<String, dynamic> data) =>
      WhatInProgramStruct(
        image: data['image'] as String?,
        index: data['index'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
      );

  static WhatInProgramStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? WhatInProgramStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'index': _index,
        'name': _name,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'index': serializeParam(
          _index,
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

  static WhatInProgramStruct fromSerializableMap(Map<String, dynamic> data) =>
      WhatInProgramStruct(
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        index: deserializeParam(
          data['index'],
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
  String toString() => 'WhatInProgramStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WhatInProgramStruct &&
        image == other.image &&
        index == other.index &&
        name == other.name &&
        description == other.description;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([image, index, name, description]);
}

WhatInProgramStruct createWhatInProgramStruct({
  String? image,
  String? index,
  String? name,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WhatInProgramStruct(
      image: image,
      index: index,
      name: name,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WhatInProgramStruct? updateWhatInProgramStruct(
  WhatInProgramStruct? whatInProgram, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    whatInProgram
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWhatInProgramStructData(
  Map<String, dynamic> firestoreData,
  WhatInProgramStruct? whatInProgram,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (whatInProgram == null) {
    return;
  }
  if (whatInProgram.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && whatInProgram.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final whatInProgramData =
      getWhatInProgramFirestoreData(whatInProgram, forFieldValue);
  final nestedData =
      whatInProgramData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = whatInProgram.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWhatInProgramFirestoreData(
  WhatInProgramStruct? whatInProgram, [
  bool forFieldValue = false,
]) {
  if (whatInProgram == null) {
    return {};
  }
  final firestoreData = mapToFirestore(whatInProgram.toMap());

  // Add any Firestore field values
  whatInProgram.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWhatInProgramListFirestoreData(
  List<WhatInProgramStruct>? whatInPrograms,
) =>
    whatInPrograms
        ?.map((e) => getWhatInProgramFirestoreData(e, true))
        .toList() ??
    [];
