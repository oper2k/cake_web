import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KnowledgeBaseTypeRecord extends FirestoreRecord {
  KnowledgeBaseTypeRecord._(
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
      FirebaseFirestore.instance.collection('knowledgeBaseType');

  static Stream<KnowledgeBaseTypeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KnowledgeBaseTypeRecord.fromSnapshot(s));

  static Future<KnowledgeBaseTypeRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => KnowledgeBaseTypeRecord.fromSnapshot(s));

  static KnowledgeBaseTypeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      KnowledgeBaseTypeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KnowledgeBaseTypeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KnowledgeBaseTypeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KnowledgeBaseTypeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KnowledgeBaseTypeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKnowledgeBaseTypeRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class KnowledgeBaseTypeRecordDocumentEquality
    implements Equality<KnowledgeBaseTypeRecord> {
  const KnowledgeBaseTypeRecordDocumentEquality();

  @override
  bool equals(KnowledgeBaseTypeRecord? e1, KnowledgeBaseTypeRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(KnowledgeBaseTypeRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is KnowledgeBaseTypeRecord;
}
