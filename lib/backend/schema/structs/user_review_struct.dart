// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserReviewStruct extends FFFirebaseStruct {
  UserReviewStruct({
    String? text,
    String? userPhoto,
    String? userName,
    String? userSubname,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _text = text,
        _userPhoto = userPhoto,
        _userName = userName,
        _userSubname = userSubname,
        super(firestoreUtilData);

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;
  bool hasText() => _text != null;

  // "userPhoto" field.
  String? _userPhoto;
  String get userPhoto => _userPhoto ?? '';
  set userPhoto(String? val) => _userPhoto = val;
  bool hasUserPhoto() => _userPhoto != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;
  bool hasUserName() => _userName != null;

  // "userSubname" field.
  String? _userSubname;
  String get userSubname => _userSubname ?? '';
  set userSubname(String? val) => _userSubname = val;
  bool hasUserSubname() => _userSubname != null;

  static UserReviewStruct fromMap(Map<String, dynamic> data) =>
      UserReviewStruct(
        text: data['text'] as String?,
        userPhoto: data['userPhoto'] as String?,
        userName: data['userName'] as String?,
        userSubname: data['userSubname'] as String?,
      );

  static UserReviewStruct? maybeFromMap(dynamic data) => data is Map
      ? UserReviewStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'userPhoto': _userPhoto,
        'userName': _userName,
        'userSubname': _userSubname,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'userPhoto': serializeParam(
          _userPhoto,
          ParamType.String,
        ),
        'userName': serializeParam(
          _userName,
          ParamType.String,
        ),
        'userSubname': serializeParam(
          _userSubname,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserReviewStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserReviewStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        userPhoto: deserializeParam(
          data['userPhoto'],
          ParamType.String,
          false,
        ),
        userName: deserializeParam(
          data['userName'],
          ParamType.String,
          false,
        ),
        userSubname: deserializeParam(
          data['userSubname'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserReviewStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserReviewStruct &&
        text == other.text &&
        userPhoto == other.userPhoto &&
        userName == other.userName &&
        userSubname == other.userSubname;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([text, userPhoto, userName, userSubname]);
}

UserReviewStruct createUserReviewStruct({
  String? text,
  String? userPhoto,
  String? userName,
  String? userSubname,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserReviewStruct(
      text: text,
      userPhoto: userPhoto,
      userName: userName,
      userSubname: userSubname,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserReviewStruct? updateUserReviewStruct(
  UserReviewStruct? userReview, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userReview
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserReviewStructData(
  Map<String, dynamic> firestoreData,
  UserReviewStruct? userReview,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userReview == null) {
    return;
  }
  if (userReview.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userReview.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userReviewData = getUserReviewFirestoreData(userReview, forFieldValue);
  final nestedData = userReviewData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userReview.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserReviewFirestoreData(
  UserReviewStruct? userReview, [
  bool forFieldValue = false,
]) {
  if (userReview == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userReview.toMap());

  // Add any Firestore field values
  userReview.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserReviewListFirestoreData(
  List<UserReviewStruct>? userReviews,
) =>
    userReviews?.map((e) => getUserReviewFirestoreData(e, true)).toList() ?? [];
