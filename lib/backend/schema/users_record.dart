import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "isDelete" field.
  String? _isDelete;
  String get isDelete => _isDelete ?? '';
  bool hasIsDelete() => _isDelete != null;

  // "insta" field.
  String? _insta;
  String get insta => _insta ?? '';
  bool hasInsta() => _insta != null;

  // "surname" field.
  String? _surname;
  String get surname => _surname ?? '';
  bool hasSurname() => _surname != null;

  // "birthdayDate" field.
  DateTime? _birthdayDate;
  DateTime? get birthdayDate => _birthdayDate;
  bool hasBirthdayDate() => _birthdayDate != null;

  // "rl_recentlyCourse" field.
  DocumentReference? _rlRecentlyCourse;
  DocumentReference? get rlRecentlyCourse => _rlRecentlyCourse;
  bool hasRlRecentlyCourse() => _rlRecentlyCourse != null;

  // "igreeRecieveEmail" field.
  bool? _igreeRecieveEmail;
  bool get igreeRecieveEmail => _igreeRecieveEmail ?? false;
  bool hasIgreeRecieveEmail() => _igreeRecieveEmail != null;

  // "rl_buy_tariffs" field.
  List<DocumentReference>? _rlBuyTariffs;
  List<DocumentReference> get rlBuyTariffs => _rlBuyTariffs ?? const [];
  bool hasRlBuyTariffs() => _rlBuyTariffs != null;

  // "rl_recentlyTariff" field.
  DocumentReference? _rlRecentlyTariff;
  DocumentReference? get rlRecentlyTariff => _rlRecentlyTariff;
  bool hasRlRecentlyTariff() => _rlRecentlyTariff != null;

  // "rl_finished_course_first_lesson" field.
  List<DocumentReference>? _rlFinishedCourseFirstLesson;
  List<DocumentReference> get rlFinishedCourseFirstLesson =>
      _rlFinishedCourseFirstLesson ?? const [];
  bool hasRlFinishedCourseFirstLesson() => _rlFinishedCourseFirstLesson != null;

  // "rl_bonus_lessons" field.
  List<DocumentReference>? _rlBonusLessons;
  List<DocumentReference> get rlBonusLessons => _rlBonusLessons ?? const [];
  bool hasRlBonusLessons() => _rlBonusLessons != null;

  // "rl_finished_lessons" field.
  List<DocumentReference>? _rlFinishedLessons;
  List<DocumentReference> get rlFinishedLessons =>
      _rlFinishedLessons ?? const [];
  bool hasRlFinishedLessons() => _rlFinishedLessons != null;

  // "rl_finished_module" field.
  List<DocumentReference>? _rlFinishedModule;
  List<DocumentReference> get rlFinishedModule => _rlFinishedModule ?? const [];
  bool hasRlFinishedModule() => _rlFinishedModule != null;

  // "rl_start_module" field.
  List<DocumentReference>? _rlStartModule;
  List<DocumentReference> get rlStartModule => _rlStartModule ?? const [];
  bool hasRlStartModule() => _rlStartModule != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _isAdmin = snapshotData['isAdmin'] as bool?;
    _isDelete = snapshotData['isDelete'] as String?;
    _insta = snapshotData['insta'] as String?;
    _surname = snapshotData['surname'] as String?;
    _birthdayDate = snapshotData['birthdayDate'] as DateTime?;
    _rlRecentlyCourse = snapshotData['rl_recentlyCourse'] as DocumentReference?;
    _igreeRecieveEmail = snapshotData['igreeRecieveEmail'] as bool?;
    _rlBuyTariffs = getDataList(snapshotData['rl_buy_tariffs']);
    _rlRecentlyTariff = snapshotData['rl_recentlyTariff'] as DocumentReference?;
    _rlFinishedCourseFirstLesson =
        getDataList(snapshotData['rl_finished_course_first_lesson']);
    _rlBonusLessons = getDataList(snapshotData['rl_bonus_lessons']);
    _rlFinishedLessons = getDataList(snapshotData['rl_finished_lessons']);
    _rlFinishedModule = getDataList(snapshotData['rl_finished_module']);
    _rlStartModule = getDataList(snapshotData['rl_start_module']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? isAdmin,
  String? isDelete,
  String? insta,
  String? surname,
  DateTime? birthdayDate,
  DocumentReference? rlRecentlyCourse,
  bool? igreeRecieveEmail,
  DocumentReference? rlRecentlyTariff,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'isAdmin': isAdmin,
      'isDelete': isDelete,
      'insta': insta,
      'surname': surname,
      'birthdayDate': birthdayDate,
      'rl_recentlyCourse': rlRecentlyCourse,
      'igreeRecieveEmail': igreeRecieveEmail,
      'rl_recentlyTariff': rlRecentlyTariff,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.isDelete == e2?.isDelete &&
        e1?.insta == e2?.insta &&
        e1?.surname == e2?.surname &&
        e1?.birthdayDate == e2?.birthdayDate &&
        e1?.rlRecentlyCourse == e2?.rlRecentlyCourse &&
        e1?.igreeRecieveEmail == e2?.igreeRecieveEmail &&
        listEquality.equals(e1?.rlBuyTariffs, e2?.rlBuyTariffs) &&
        e1?.rlRecentlyTariff == e2?.rlRecentlyTariff &&
        listEquality.equals(
            e1?.rlFinishedCourseFirstLesson, e2?.rlFinishedCourseFirstLesson) &&
        listEquality.equals(e1?.rlBonusLessons, e2?.rlBonusLessons) &&
        listEquality.equals(e1?.rlFinishedLessons, e2?.rlFinishedLessons) &&
        listEquality.equals(e1?.rlFinishedModule, e2?.rlFinishedModule) &&
        listEquality.equals(e1?.rlStartModule, e2?.rlStartModule);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.isAdmin,
        e?.isDelete,
        e?.insta,
        e?.surname,
        e?.birthdayDate,
        e?.rlRecentlyCourse,
        e?.igreeRecieveEmail,
        e?.rlBuyTariffs,
        e?.rlRecentlyTariff,
        e?.rlFinishedCourseFirstLesson,
        e?.rlBonusLessons,
        e?.rlFinishedLessons,
        e?.rlFinishedModule,
        e?.rlStartModule
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
