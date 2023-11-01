import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourseTeacherRecord extends FirestoreRecord {
  CourseTeacherRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "subTitle" field.
  String? _subTitle;
  String get subTitle => _subTitle ?? '';
  bool hasSubTitle() => _subTitle != null;

  // "about" field.
  String? _about;
  String get about => _about ?? '';
  bool hasAbout() => _about != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _image = snapshotData['image'] as String?;
    _subTitle = snapshotData['subTitle'] as String?;
    _about = snapshotData['about'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('courseTeacher');

  static Stream<CourseTeacherRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CourseTeacherRecord.fromSnapshot(s));

  static Future<CourseTeacherRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CourseTeacherRecord.fromSnapshot(s));

  static CourseTeacherRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CourseTeacherRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CourseTeacherRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CourseTeacherRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CourseTeacherRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CourseTeacherRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCourseTeacherRecordData({
  String? name,
  String? image,
  String? subTitle,
  String? about,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image': image,
      'subTitle': subTitle,
      'about': about,
    }.withoutNulls,
  );

  return firestoreData;
}

class CourseTeacherRecordDocumentEquality
    implements Equality<CourseTeacherRecord> {
  const CourseTeacherRecordDocumentEquality();

  @override
  bool equals(CourseTeacherRecord? e1, CourseTeacherRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.image == e2?.image &&
        e1?.subTitle == e2?.subTitle &&
        e1?.about == e2?.about;
  }

  @override
  int hash(CourseTeacherRecord? e) =>
      const ListEquality().hash([e?.name, e?.image, e?.subTitle, e?.about]);

  @override
  bool isValidKey(Object? o) => o is CourseTeacherRecord;
}
