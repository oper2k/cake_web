import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ModulesRecord extends FirestoreRecord {
  ModulesRecord._(
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

  // "rl_tariff" field.
  List<DocumentReference>? _rlTariff;
  List<DocumentReference> get rlTariff => _rlTariff ?? const [];
  bool hasRlTariff() => _rlTariff != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _index = castToType<int>(snapshotData['index']);
    _rlTariff = getDataList(snapshotData['rl_tariff']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('modules')
          : FirebaseFirestore.instance.collectionGroup('modules');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('modules').doc();

  static Stream<ModulesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ModulesRecord.fromSnapshot(s));

  static Future<ModulesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ModulesRecord.fromSnapshot(s));

  static ModulesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ModulesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ModulesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ModulesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ModulesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ModulesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createModulesRecordData({
  String? name,
  int? index,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'index': index,
    }.withoutNulls,
  );

  return firestoreData;
}

class ModulesRecordDocumentEquality implements Equality<ModulesRecord> {
  const ModulesRecordDocumentEquality();

  @override
  bool equals(ModulesRecord? e1, ModulesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.index == e2?.index &&
        listEquality.equals(e1?.rlTariff, e2?.rlTariff);
  }

  @override
  int hash(ModulesRecord? e) =>
      const ListEquality().hash([e?.name, e?.index, e?.rlTariff]);

  @override
  bool isValidKey(Object? o) => o is ModulesRecord;
}
