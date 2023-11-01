import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourseTagRecord extends FirestoreRecord {
  CourseTagRecord._(
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

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('courseTag');

  static Stream<CourseTagRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CourseTagRecord.fromSnapshot(s));

  static Future<CourseTagRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CourseTagRecord.fromSnapshot(s));

  static CourseTagRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CourseTagRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CourseTagRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CourseTagRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CourseTagRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CourseTagRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCourseTagRecordData({
  String? name,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class CourseTagRecordDocumentEquality implements Equality<CourseTagRecord> {
  const CourseTagRecordDocumentEquality();

  @override
  bool equals(CourseTagRecord? e1, CourseTagRecord? e2) {
    return e1?.name == e2?.name && e1?.image == e2?.image;
  }

  @override
  int hash(CourseTagRecord? e) =>
      const ListEquality().hash([e?.name, e?.image]);

  @override
  bool isValidKey(Object? o) => o is CourseTagRecord;
}
