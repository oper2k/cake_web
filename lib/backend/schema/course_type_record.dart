import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourseTypeRecord extends FirestoreRecord {
  CourseTypeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('courseType');

  static Stream<CourseTypeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CourseTypeRecord.fromSnapshot(s));

  static Future<CourseTypeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CourseTypeRecord.fromSnapshot(s));

  static CourseTypeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CourseTypeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CourseTypeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CourseTypeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CourseTypeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CourseTypeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCourseTypeRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class CourseTypeRecordDocumentEquality implements Equality<CourseTypeRecord> {
  const CourseTypeRecordDocumentEquality();

  @override
  bool equals(CourseTypeRecord? e1, CourseTypeRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(CourseTypeRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is CourseTypeRecord;
}
