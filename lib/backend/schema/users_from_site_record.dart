import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersFromSiteRecord extends FirestoreRecord {
  UsersFromSiteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "tariff" field.
  DocumentReference? _tariff;
  DocumentReference? get tariff => _tariff;
  bool hasTariff() => _tariff != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _tariff = snapshotData['tariff'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users_from_site');

  static Stream<UsersFromSiteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersFromSiteRecord.fromSnapshot(s));

  static Future<UsersFromSiteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersFromSiteRecord.fromSnapshot(s));

  static UsersFromSiteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsersFromSiteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersFromSiteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersFromSiteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersFromSiteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersFromSiteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersFromSiteRecordData({
  String? email,
  DocumentReference? tariff,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'tariff': tariff,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersFromSiteRecordDocumentEquality
    implements Equality<UsersFromSiteRecord> {
  const UsersFromSiteRecordDocumentEquality();

  @override
  bool equals(UsersFromSiteRecord? e1, UsersFromSiteRecord? e2) {
    return e1?.email == e2?.email && e1?.tariff == e2?.tariff;
  }

  @override
  int hash(UsersFromSiteRecord? e) =>
      const ListEquality().hash([e?.email, e?.tariff]);

  @override
  bool isValidKey(Object? o) => o is UsersFromSiteRecord;
}
