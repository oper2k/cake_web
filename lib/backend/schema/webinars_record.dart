import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WebinarsRecord extends FirestoreRecord {
  WebinarsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "smallName" field.
  String? _smallName;
  String get smallName => _smallName ?? '';
  bool hasSmallName() => _smallName != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _smallName = snapshotData['smallName'] as String?;
    _image = snapshotData['image'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _link = snapshotData['link'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('webinars');

  static Stream<WebinarsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WebinarsRecord.fromSnapshot(s));

  static Future<WebinarsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WebinarsRecord.fromSnapshot(s));

  static WebinarsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WebinarsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WebinarsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WebinarsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WebinarsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WebinarsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWebinarsRecordData({
  String? name,
  String? smallName,
  String? image,
  DateTime? date,
  String? link,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'smallName': smallName,
      'image': image,
      'date': date,
      'link': link,
    }.withoutNulls,
  );

  return firestoreData;
}

class WebinarsRecordDocumentEquality implements Equality<WebinarsRecord> {
  const WebinarsRecordDocumentEquality();

  @override
  bool equals(WebinarsRecord? e1, WebinarsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.smallName == e2?.smallName &&
        e1?.image == e2?.image &&
        e1?.date == e2?.date &&
        e1?.link == e2?.link;
  }

  @override
  int hash(WebinarsRecord? e) => const ListEquality()
      .hash([e?.name, e?.smallName, e?.image, e?.date, e?.link]);

  @override
  bool isValidKey(Object? o) => o is WebinarsRecord;
}
