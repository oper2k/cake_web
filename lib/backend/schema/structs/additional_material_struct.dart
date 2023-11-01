// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdditionalMaterialStruct extends FFFirebaseStruct {
  AdditionalMaterialStruct({
    String? image,
    String? title,
    String? description,
    Color? color,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _image = image,
        _title = title,
        _description = description,
        _color = color,
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

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;
  bool hasColor() => _color != null;

  static AdditionalMaterialStruct fromMap(Map<String, dynamic> data) =>
      AdditionalMaterialStruct(
        image: data['image'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        color: getSchemaColor(data['color']),
      );

  static AdditionalMaterialStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? AdditionalMaterialStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'title': _title,
        'description': _description,
        'color': _color,
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
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
      }.withoutNulls;

  static AdditionalMaterialStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AdditionalMaterialStruct(
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
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'AdditionalMaterialStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AdditionalMaterialStruct &&
        image == other.image &&
        title == other.title &&
        description == other.description &&
        color == other.color;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([image, title, description, color]);
}

AdditionalMaterialStruct createAdditionalMaterialStruct({
  String? image,
  String? title,
  String? description,
  Color? color,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AdditionalMaterialStruct(
      image: image,
      title: title,
      description: description,
      color: color,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AdditionalMaterialStruct? updateAdditionalMaterialStruct(
  AdditionalMaterialStruct? additionalMaterial, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    additionalMaterial
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAdditionalMaterialStructData(
  Map<String, dynamic> firestoreData,
  AdditionalMaterialStruct? additionalMaterial,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (additionalMaterial == null) {
    return;
  }
  if (additionalMaterial.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && additionalMaterial.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final additionalMaterialData =
      getAdditionalMaterialFirestoreData(additionalMaterial, forFieldValue);
  final nestedData =
      additionalMaterialData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      additionalMaterial.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAdditionalMaterialFirestoreData(
  AdditionalMaterialStruct? additionalMaterial, [
  bool forFieldValue = false,
]) {
  if (additionalMaterial == null) {
    return {};
  }
  final firestoreData = mapToFirestore(additionalMaterial.toMap());

  // Add any Firestore field values
  additionalMaterial.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAdditionalMaterialListFirestoreData(
  List<AdditionalMaterialStruct>? additionalMaterials,
) =>
    additionalMaterials
        ?.map((e) => getAdditionalMaterialFirestoreData(e, true))
        .toList() ??
    [];
