// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BuyTodayStruct extends FFFirebaseStruct {
  BuyTodayStruct({
    String? title,
    String? description,
    String? image,
    String? buttonName,
    String? link,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _description = description,
        _image = image,
        _buttonName = buttonName,
        _link = link,
        super(firestoreUtilData);

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

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  // "button_name" field.
  String? _buttonName;
  String get buttonName => _buttonName ?? '';
  set buttonName(String? val) => _buttonName = val;
  bool hasButtonName() => _buttonName != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;
  bool hasLink() => _link != null;

  static BuyTodayStruct fromMap(Map<String, dynamic> data) => BuyTodayStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
        image: data['image'] as String?,
        buttonName: data['button_name'] as String?,
        link: data['link'] as String?,
      );

  static BuyTodayStruct? maybeFromMap(dynamic data) =>
      data is Map ? BuyTodayStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
        'image': _image,
        'button_name': _buttonName,
        'link': _link,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'button_name': serializeParam(
          _buttonName,
          ParamType.String,
        ),
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
      }.withoutNulls;

  static BuyTodayStruct fromSerializableMap(Map<String, dynamic> data) =>
      BuyTodayStruct(
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
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        buttonName: deserializeParam(
          data['button_name'],
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
  String toString() => 'BuyTodayStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BuyTodayStruct &&
        title == other.title &&
        description == other.description &&
        image == other.image &&
        buttonName == other.buttonName &&
        link == other.link;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([title, description, image, buttonName, link]);
}

BuyTodayStruct createBuyTodayStruct({
  String? title,
  String? description,
  String? image,
  String? buttonName,
  String? link,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BuyTodayStruct(
      title: title,
      description: description,
      image: image,
      buttonName: buttonName,
      link: link,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BuyTodayStruct? updateBuyTodayStruct(
  BuyTodayStruct? buyToday, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    buyToday
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBuyTodayStructData(
  Map<String, dynamic> firestoreData,
  BuyTodayStruct? buyToday,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (buyToday == null) {
    return;
  }
  if (buyToday.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && buyToday.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final buyTodayData = getBuyTodayFirestoreData(buyToday, forFieldValue);
  final nestedData = buyTodayData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = buyToday.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBuyTodayFirestoreData(
  BuyTodayStruct? buyToday, [
  bool forFieldValue = false,
]) {
  if (buyToday == null) {
    return {};
  }
  final firestoreData = mapToFirestore(buyToday.toMap());

  // Add any Firestore field values
  buyToday.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBuyTodayListFirestoreData(
  List<BuyTodayStruct>? buyTodays,
) =>
    buyTodays?.map((e) => getBuyTodayFirestoreData(e, true)).toList() ?? [];
