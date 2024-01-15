import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KnowledgeBaseRecord extends FirestoreRecord {
  KnowledgeBaseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "isFree" field.
  bool? _isFree;
  bool get isFree => _isFree ?? false;
  bool hasIsFree() => _isFree != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "rl_courseTeacher" field.
  DocumentReference? _rlCourseTeacher;
  DocumentReference? get rlCourseTeacher => _rlCourseTeacher;
  bool hasRlCourseTeacher() => _rlCourseTeacher != null;

  // "isTrial" field.
  bool? _isTrial;
  bool get isTrial => _isTrial ?? false;
  bool hasIsTrial() => _isTrial != null;

  // "rl_favoriteUser" field.
  List<DocumentReference>? _rlFavoriteUser;
  List<DocumentReference> get rlFavoriteUser => _rlFavoriteUser ?? const [];
  bool hasRlFavoriteUser() => _rlFavoriteUser != null;

  // "authorSubtitle" field.
  String? _authorSubtitle;
  String get authorSubtitle => _authorSubtitle ?? '';
  bool hasAuthorSubtitle() => _authorSubtitle != null;

  // "show" field.
  bool? _show;
  bool get show => _show ?? false;
  bool hasShow() => _show != null;

  // "additionalInfo" field.
  List<AdditionalInfoStruct>? _additionalInfo;
  List<AdditionalInfoStruct> get additionalInfo => _additionalInfo ?? const [];
  bool hasAdditionalInfo() => _additionalInfo != null;

  // "views" field.
  int? _views;
  int get views => _views ?? 0;
  bool hasViews() => _views != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _type = snapshotData['type'] as String?;
    _image = snapshotData['image'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _isFree = snapshotData['isFree'] as bool?;
    _description = snapshotData['description'] as String?;
    _rlCourseTeacher = snapshotData['rl_courseTeacher'] as DocumentReference?;
    _isTrial = snapshotData['isTrial'] as bool?;
    _rlFavoriteUser = getDataList(snapshotData['rl_favoriteUser']);
    _authorSubtitle = snapshotData['authorSubtitle'] as String?;
    _show = snapshotData['show'] as bool?;
    _additionalInfo = getStructList(
      snapshotData['additionalInfo'],
      AdditionalInfoStruct.fromMap,
    );
    _views = castToType<int>(snapshotData['views']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('knowledgeBase');

  static Stream<KnowledgeBaseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KnowledgeBaseRecord.fromSnapshot(s));

  static Future<KnowledgeBaseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => KnowledgeBaseRecord.fromSnapshot(s));

  static KnowledgeBaseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      KnowledgeBaseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KnowledgeBaseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KnowledgeBaseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KnowledgeBaseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KnowledgeBaseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKnowledgeBaseRecordData({
  String? name,
  String? type,
  String? image,
  DateTime? date,
  bool? isFree,
  String? description,
  DocumentReference? rlCourseTeacher,
  bool? isTrial,
  String? authorSubtitle,
  bool? show,
  int? views,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'type': type,
      'image': image,
      'date': date,
      'isFree': isFree,
      'description': description,
      'rl_courseTeacher': rlCourseTeacher,
      'isTrial': isTrial,
      'authorSubtitle': authorSubtitle,
      'show': show,
      'views': views,
    }.withoutNulls,
  );

  return firestoreData;
}

class KnowledgeBaseRecordDocumentEquality
    implements Equality<KnowledgeBaseRecord> {
  const KnowledgeBaseRecordDocumentEquality();

  @override
  bool equals(KnowledgeBaseRecord? e1, KnowledgeBaseRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.type == e2?.type &&
        e1?.image == e2?.image &&
        e1?.date == e2?.date &&
        e1?.isFree == e2?.isFree &&
        e1?.description == e2?.description &&
        e1?.rlCourseTeacher == e2?.rlCourseTeacher &&
        e1?.isTrial == e2?.isTrial &&
        listEquality.equals(e1?.rlFavoriteUser, e2?.rlFavoriteUser) &&
        e1?.authorSubtitle == e2?.authorSubtitle &&
        e1?.show == e2?.show &&
        listEquality.equals(e1?.additionalInfo, e2?.additionalInfo) &&
        e1?.views == e2?.views;
  }

  @override
  int hash(KnowledgeBaseRecord? e) => const ListEquality().hash([
        e?.name,
        e?.type,
        e?.image,
        e?.date,
        e?.isFree,
        e?.description,
        e?.rlCourseTeacher,
        e?.isTrial,
        e?.rlFavoriteUser,
        e?.authorSubtitle,
        e?.show,
        e?.additionalInfo,
        e?.views
      ]);

  @override
  bool isValidKey(Object? o) => o is KnowledgeBaseRecord;
}
