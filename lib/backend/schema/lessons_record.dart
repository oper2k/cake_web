import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonsRecord extends FirestoreRecord {
  LessonsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  // "rl_modules" field.
  DocumentReference? _rlModules;
  DocumentReference? get rlModules => _rlModules;
  bool hasRlModules() => _rlModules != null;

  // "subname" field.
  String? _subname;
  String get subname => _subname ?? '';
  bool hasSubname() => _subname != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "isOrganization" field.
  bool? _isOrganization;
  bool get isOrganization => _isOrganization ?? false;
  bool hasIsOrganization() => _isOrganization != null;

  // "additionalInfo" field.
  List<AdditionalInfoStruct>? _additionalInfo;
  List<AdditionalInfoStruct> get additionalInfo => _additionalInfo ?? const [];
  bool hasAdditionalInfo() => _additionalInfo != null;

  // "homeWorkName" field.
  List<String>? _homeWorkName;
  List<String> get homeWorkName => _homeWorkName ?? const [];
  bool hasHomeWorkName() => _homeWorkName != null;

  // "homeWorkImage" field.
  List<String>? _homeWorkImage;
  List<String> get homeWorkImage => _homeWorkImage ?? const [];
  bool hasHomeWorkImage() => _homeWorkImage != null;

  // "homeWorkText" field.
  String? _homeWorkText;
  String get homeWorkText => _homeWorkText ?? '';
  bool hasHomeWorkText() => _homeWorkText != null;

  // "additionalInfoButton" field.
  List<AdditionalInfoButtonStruct>? _additionalInfoButton;
  List<AdditionalInfoButtonStruct> get additionalInfoButton =>
      _additionalInfoButton ?? const [];
  bool hasAdditionalInfoButton() => _additionalInfoButton != null;

  // "additionalInfoString" field.
  String? _additionalInfoString;
  String get additionalInfoString => _additionalInfoString ?? '';
  bool hasAdditionalInfoString() => _additionalInfoString != null;

  // "showRules" field.
  bool? _showRules;
  bool get showRules => _showRules ?? false;
  bool hasShowRules() => _showRules != null;

  // "with_homework" field.
  bool? _withHomework;
  bool get withHomework => _withHomework ?? false;
  bool hasWithHomework() => _withHomework != null;

  // "with_photo_homework" field.
  bool? _withPhotoHomework;
  bool get withPhotoHomework => _withPhotoHomework ?? false;
  bool hasWithPhotoHomework() => _withPhotoHomework != null;

  // "rl_tariff" field.
  List<DocumentReference>? _rlTariff;
  List<DocumentReference> get rlTariff => _rlTariff ?? const [];
  bool hasRlTariff() => _rlTariff != null;

  // "open_date" field.
  DateTime? _openDate;
  DateTime? get openDate => _openDate;
  bool hasOpenDate() => _openDate != null;

  // "rl_usersPassHomework" field.
  List<DocumentReference>? _rlUsersPassHomework;
  List<DocumentReference> get rlUsersPassHomework =>
      _rlUsersPassHomework ?? const [];
  bool hasRlUsersPassHomework() => _rlUsersPassHomework != null;

  // "open_day" field.
  int? _openDay;
  int get openDay => _openDay ?? 0;
  bool hasOpenDay() => _openDay != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _index = castToType<int>(snapshotData['index']);
    _rlModules = snapshotData['rl_modules'] as DocumentReference?;
    _subname = snapshotData['subname'] as String?;
    _image = snapshotData['image'] as String?;
    _isOrganization = snapshotData['isOrganization'] as bool?;
    _additionalInfo = getStructList(
      snapshotData['additionalInfo'],
      AdditionalInfoStruct.fromMap,
    );
    _homeWorkName = getDataList(snapshotData['homeWorkName']);
    _homeWorkImage = getDataList(snapshotData['homeWorkImage']);
    _homeWorkText = snapshotData['homeWorkText'] as String?;
    _additionalInfoButton = getStructList(
      snapshotData['additionalInfoButton'],
      AdditionalInfoButtonStruct.fromMap,
    );
    _additionalInfoString = snapshotData['additionalInfoString'] as String?;
    _showRules = snapshotData['showRules'] as bool?;
    _withHomework = snapshotData['with_homework'] as bool?;
    _withPhotoHomework = snapshotData['with_photo_homework'] as bool?;
    _rlTariff = getDataList(snapshotData['rl_tariff']);
    _openDate = snapshotData['open_date'] as DateTime?;
    _rlUsersPassHomework = getDataList(snapshotData['rl_usersPassHomework']);
    _openDay = castToType<int>(snapshotData['open_day']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('lessons')
          : FirebaseFirestore.instance.collectionGroup('lessons');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('lessons').doc();

  static Stream<LessonsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LessonsRecord.fromSnapshot(s));

  static Future<LessonsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LessonsRecord.fromSnapshot(s));

  static LessonsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LessonsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LessonsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LessonsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LessonsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LessonsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLessonsRecordData({
  String? name,
  int? index,
  DocumentReference? rlModules,
  String? subname,
  String? image,
  bool? isOrganization,
  String? homeWorkText,
  String? additionalInfoString,
  bool? showRules,
  bool? withHomework,
  bool? withPhotoHomework,
  DateTime? openDate,
  int? openDay,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'index': index,
      'rl_modules': rlModules,
      'subname': subname,
      'image': image,
      'isOrganization': isOrganization,
      'homeWorkText': homeWorkText,
      'additionalInfoString': additionalInfoString,
      'showRules': showRules,
      'with_homework': withHomework,
      'with_photo_homework': withPhotoHomework,
      'open_date': openDate,
      'open_day': openDay,
    }.withoutNulls,
  );

  return firestoreData;
}

class LessonsRecordDocumentEquality implements Equality<LessonsRecord> {
  const LessonsRecordDocumentEquality();

  @override
  bool equals(LessonsRecord? e1, LessonsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.index == e2?.index &&
        e1?.rlModules == e2?.rlModules &&
        e1?.subname == e2?.subname &&
        e1?.image == e2?.image &&
        e1?.isOrganization == e2?.isOrganization &&
        listEquality.equals(e1?.additionalInfo, e2?.additionalInfo) &&
        listEquality.equals(e1?.homeWorkName, e2?.homeWorkName) &&
        listEquality.equals(e1?.homeWorkImage, e2?.homeWorkImage) &&
        e1?.homeWorkText == e2?.homeWorkText &&
        listEquality.equals(
            e1?.additionalInfoButton, e2?.additionalInfoButton) &&
        e1?.additionalInfoString == e2?.additionalInfoString &&
        e1?.showRules == e2?.showRules &&
        e1?.withHomework == e2?.withHomework &&
        e1?.withPhotoHomework == e2?.withPhotoHomework &&
        listEquality.equals(e1?.rlTariff, e2?.rlTariff) &&
        e1?.openDate == e2?.openDate &&
        listEquality.equals(e1?.rlUsersPassHomework, e2?.rlUsersPassHomework) &&
        e1?.openDay == e2?.openDay;
  }

  @override
  int hash(LessonsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.index,
        e?.rlModules,
        e?.subname,
        e?.image,
        e?.isOrganization,
        e?.additionalInfo,
        e?.homeWorkName,
        e?.homeWorkImage,
        e?.homeWorkText,
        e?.additionalInfoButton,
        e?.additionalInfoString,
        e?.showRules,
        e?.withHomework,
        e?.withPhotoHomework,
        e?.rlTariff,
        e?.openDate,
        e?.rlUsersPassHomework,
        e?.openDay
      ]);

  @override
  bool isValidKey(Object? o) => o is LessonsRecord;
}
