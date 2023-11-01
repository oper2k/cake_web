// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdditionalInfoButtonStruct extends FFFirebaseStruct {
  AdditionalInfoButtonStruct({
    String? title,
    String? text,
    String? nameTelegaButton,
    String? linkTelegaButton,
    String? nameWhatsappButton,
    String? linkWhatsappButton,
    String? additionalInfoTitle,
    String? additionalInfoText,
    String? additionalInfoLink,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _text = text,
        _nameTelegaButton = nameTelegaButton,
        _linkTelegaButton = linkTelegaButton,
        _nameWhatsappButton = nameWhatsappButton,
        _linkWhatsappButton = linkWhatsappButton,
        _additionalInfoTitle = additionalInfoTitle,
        _additionalInfoText = additionalInfoText,
        _additionalInfoLink = additionalInfoLink,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;
  bool hasText() => _text != null;

  // "nameTelegaButton" field.
  String? _nameTelegaButton;
  String get nameTelegaButton => _nameTelegaButton ?? '';
  set nameTelegaButton(String? val) => _nameTelegaButton = val;
  bool hasNameTelegaButton() => _nameTelegaButton != null;

  // "linkTelegaButton" field.
  String? _linkTelegaButton;
  String get linkTelegaButton => _linkTelegaButton ?? '';
  set linkTelegaButton(String? val) => _linkTelegaButton = val;
  bool hasLinkTelegaButton() => _linkTelegaButton != null;

  // "nameWhatsappButton" field.
  String? _nameWhatsappButton;
  String get nameWhatsappButton => _nameWhatsappButton ?? '';
  set nameWhatsappButton(String? val) => _nameWhatsappButton = val;
  bool hasNameWhatsappButton() => _nameWhatsappButton != null;

  // "linkWhatsappButton" field.
  String? _linkWhatsappButton;
  String get linkWhatsappButton => _linkWhatsappButton ?? '';
  set linkWhatsappButton(String? val) => _linkWhatsappButton = val;
  bool hasLinkWhatsappButton() => _linkWhatsappButton != null;

  // "additionalInfoTitle" field.
  String? _additionalInfoTitle;
  String get additionalInfoTitle => _additionalInfoTitle ?? '';
  set additionalInfoTitle(String? val) => _additionalInfoTitle = val;
  bool hasAdditionalInfoTitle() => _additionalInfoTitle != null;

  // "additionalInfoText" field.
  String? _additionalInfoText;
  String get additionalInfoText => _additionalInfoText ?? '';
  set additionalInfoText(String? val) => _additionalInfoText = val;
  bool hasAdditionalInfoText() => _additionalInfoText != null;

  // "additionalInfoLink" field.
  String? _additionalInfoLink;
  String get additionalInfoLink => _additionalInfoLink ?? '';
  set additionalInfoLink(String? val) => _additionalInfoLink = val;
  bool hasAdditionalInfoLink() => _additionalInfoLink != null;

  static AdditionalInfoButtonStruct fromMap(Map<String, dynamic> data) =>
      AdditionalInfoButtonStruct(
        title: data['title'] as String?,
        text: data['text'] as String?,
        nameTelegaButton: data['nameTelegaButton'] as String?,
        linkTelegaButton: data['linkTelegaButton'] as String?,
        nameWhatsappButton: data['nameWhatsappButton'] as String?,
        linkWhatsappButton: data['linkWhatsappButton'] as String?,
        additionalInfoTitle: data['additionalInfoTitle'] as String?,
        additionalInfoText: data['additionalInfoText'] as String?,
        additionalInfoLink: data['additionalInfoLink'] as String?,
      );

  static AdditionalInfoButtonStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? AdditionalInfoButtonStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'text': _text,
        'nameTelegaButton': _nameTelegaButton,
        'linkTelegaButton': _linkTelegaButton,
        'nameWhatsappButton': _nameWhatsappButton,
        'linkWhatsappButton': _linkWhatsappButton,
        'additionalInfoTitle': _additionalInfoTitle,
        'additionalInfoText': _additionalInfoText,
        'additionalInfoLink': _additionalInfoLink,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'nameTelegaButton': serializeParam(
          _nameTelegaButton,
          ParamType.String,
        ),
        'linkTelegaButton': serializeParam(
          _linkTelegaButton,
          ParamType.String,
        ),
        'nameWhatsappButton': serializeParam(
          _nameWhatsappButton,
          ParamType.String,
        ),
        'linkWhatsappButton': serializeParam(
          _linkWhatsappButton,
          ParamType.String,
        ),
        'additionalInfoTitle': serializeParam(
          _additionalInfoTitle,
          ParamType.String,
        ),
        'additionalInfoText': serializeParam(
          _additionalInfoText,
          ParamType.String,
        ),
        'additionalInfoLink': serializeParam(
          _additionalInfoLink,
          ParamType.String,
        ),
      }.withoutNulls;

  static AdditionalInfoButtonStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AdditionalInfoButtonStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        nameTelegaButton: deserializeParam(
          data['nameTelegaButton'],
          ParamType.String,
          false,
        ),
        linkTelegaButton: deserializeParam(
          data['linkTelegaButton'],
          ParamType.String,
          false,
        ),
        nameWhatsappButton: deserializeParam(
          data['nameWhatsappButton'],
          ParamType.String,
          false,
        ),
        linkWhatsappButton: deserializeParam(
          data['linkWhatsappButton'],
          ParamType.String,
          false,
        ),
        additionalInfoTitle: deserializeParam(
          data['additionalInfoTitle'],
          ParamType.String,
          false,
        ),
        additionalInfoText: deserializeParam(
          data['additionalInfoText'],
          ParamType.String,
          false,
        ),
        additionalInfoLink: deserializeParam(
          data['additionalInfoLink'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AdditionalInfoButtonStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AdditionalInfoButtonStruct &&
        title == other.title &&
        text == other.text &&
        nameTelegaButton == other.nameTelegaButton &&
        linkTelegaButton == other.linkTelegaButton &&
        nameWhatsappButton == other.nameWhatsappButton &&
        linkWhatsappButton == other.linkWhatsappButton &&
        additionalInfoTitle == other.additionalInfoTitle &&
        additionalInfoText == other.additionalInfoText &&
        additionalInfoLink == other.additionalInfoLink;
  }

  @override
  int get hashCode => const ListEquality().hash([
        title,
        text,
        nameTelegaButton,
        linkTelegaButton,
        nameWhatsappButton,
        linkWhatsappButton,
        additionalInfoTitle,
        additionalInfoText,
        additionalInfoLink
      ]);
}

AdditionalInfoButtonStruct createAdditionalInfoButtonStruct({
  String? title,
  String? text,
  String? nameTelegaButton,
  String? linkTelegaButton,
  String? nameWhatsappButton,
  String? linkWhatsappButton,
  String? additionalInfoTitle,
  String? additionalInfoText,
  String? additionalInfoLink,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AdditionalInfoButtonStruct(
      title: title,
      text: text,
      nameTelegaButton: nameTelegaButton,
      linkTelegaButton: linkTelegaButton,
      nameWhatsappButton: nameWhatsappButton,
      linkWhatsappButton: linkWhatsappButton,
      additionalInfoTitle: additionalInfoTitle,
      additionalInfoText: additionalInfoText,
      additionalInfoLink: additionalInfoLink,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AdditionalInfoButtonStruct? updateAdditionalInfoButtonStruct(
  AdditionalInfoButtonStruct? additionalInfoButton, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    additionalInfoButton
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAdditionalInfoButtonStructData(
  Map<String, dynamic> firestoreData,
  AdditionalInfoButtonStruct? additionalInfoButton,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (additionalInfoButton == null) {
    return;
  }
  if (additionalInfoButton.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && additionalInfoButton.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final additionalInfoButtonData =
      getAdditionalInfoButtonFirestoreData(additionalInfoButton, forFieldValue);
  final nestedData =
      additionalInfoButtonData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      additionalInfoButton.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAdditionalInfoButtonFirestoreData(
  AdditionalInfoButtonStruct? additionalInfoButton, [
  bool forFieldValue = false,
]) {
  if (additionalInfoButton == null) {
    return {};
  }
  final firestoreData = mapToFirestore(additionalInfoButton.toMap());

  // Add any Firestore field values
  additionalInfoButton.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAdditionalInfoButtonListFirestoreData(
  List<AdditionalInfoButtonStruct>? additionalInfoButtons,
) =>
    additionalInfoButtons
        ?.map((e) => getAdditionalInfoButtonFirestoreData(e, true))
        .toList() ??
    [];
