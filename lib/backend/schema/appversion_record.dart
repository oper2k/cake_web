import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppversionRecord extends FirestoreRecord {
  AppversionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  int? _name;
  int get name => _name ?? 0;
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = castToType<int>(snapshotData['name']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appversion');

  static Stream<AppversionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppversionRecord.fromSnapshot(s));

  static Future<AppversionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppversionRecord.fromSnapshot(s));

  static AppversionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppversionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppversionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppversionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppversionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppversionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppversionRecordData({
  int? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppversionRecordDocumentEquality implements Equality<AppversionRecord> {
  const AppversionRecordDocumentEquality();

  @override
  bool equals(AppversionRecord? e1, AppversionRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(AppversionRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is AppversionRecord;
}
