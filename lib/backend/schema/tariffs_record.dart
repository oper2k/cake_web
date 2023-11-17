import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TariffsRecord extends FirestoreRecord {
  TariffsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "id_for_apple" field.
  String? _idForApple;
  String get idForApple => _idForApple ?? '';
  bool hasIdForApple() => _idForApple != null;

  // "rl_course" field.
  DocumentReference? _rlCourse;
  DocumentReference? get rlCourse => _rlCourse;
  bool hasRlCourse() => _rlCourse != null;

  // "description" field.
  List<String>? _description;
  List<String> get description => _description ?? const [];
  bool hasDescription() => _description != null;

  // "old_price" field.
  String? _oldPrice;
  String get oldPrice => _oldPrice ?? '';
  bool hasOldPrice() => _oldPrice != null;

  // "show_green_text" field.
  bool? _showGreenText;
  bool get showGreenText => _showGreenText ?? false;
  bool hasShowGreenText() => _showGreenText != null;

  // "show" field.
  bool? _show;
  bool get show => _show ?? false;
  bool hasShow() => _show != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "description_crossed" field.
  List<String>? _descriptionCrossed;
  List<String> get descriptionCrossed => _descriptionCrossed ?? const [];
  bool hasDescriptionCrossed() => _descriptionCrossed != null;

  // "green_text" field.
  String? _greenText;
  String get greenText => _greenText ?? '';
  bool hasGreenText() => _greenText != null;

  // "getresponse_id" field.
  String? _getresponseId;
  String get getresponseId => _getresponseId ?? '';
  bool hasGetresponseId() => _getresponseId != null;

  // "token_id" field.
  String? _tokenId;
  String get tokenId => _tokenId ?? '';
  bool hasTokenId() => _tokenId != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _idForApple = snapshotData['id_for_apple'] as String?;
    _rlCourse = snapshotData['rl_course'] as DocumentReference?;
    _description = getDataList(snapshotData['description']);
    _oldPrice = snapshotData['old_price'] as String?;
    _showGreenText = snapshotData['show_green_text'] as bool?;
    _show = snapshotData['show'] as bool?;
    _price = castToType<int>(snapshotData['price']);
    _descriptionCrossed = getDataList(snapshotData['description_crossed']);
    _greenText = snapshotData['green_text'] as String?;
    _getresponseId = snapshotData['getresponse_id'] as String?;
    _tokenId = snapshotData['token_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tariffs');

  static Stream<TariffsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TariffsRecord.fromSnapshot(s));

  static Future<TariffsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TariffsRecord.fromSnapshot(s));

  static TariffsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TariffsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TariffsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TariffsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TariffsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TariffsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTariffsRecordData({
  String? name,
  String? idForApple,
  DocumentReference? rlCourse,
  String? oldPrice,
  bool? showGreenText,
  bool? show,
  int? price,
  String? greenText,
  String? getresponseId,
  String? tokenId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'id_for_apple': idForApple,
      'rl_course': rlCourse,
      'old_price': oldPrice,
      'show_green_text': showGreenText,
      'show': show,
      'price': price,
      'green_text': greenText,
      'getresponse_id': getresponseId,
      'token_id': tokenId,
    }.withoutNulls,
  );

  return firestoreData;
}

class TariffsRecordDocumentEquality implements Equality<TariffsRecord> {
  const TariffsRecordDocumentEquality();

  @override
  bool equals(TariffsRecord? e1, TariffsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.idForApple == e2?.idForApple &&
        e1?.rlCourse == e2?.rlCourse &&
        listEquality.equals(e1?.description, e2?.description) &&
        e1?.oldPrice == e2?.oldPrice &&
        e1?.showGreenText == e2?.showGreenText &&
        e1?.show == e2?.show &&
        e1?.price == e2?.price &&
        listEquality.equals(e1?.descriptionCrossed, e2?.descriptionCrossed) &&
        e1?.greenText == e2?.greenText &&
        e1?.getresponseId == e2?.getresponseId &&
        e1?.tokenId == e2?.tokenId;
  }

  @override
  int hash(TariffsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.idForApple,
        e?.rlCourse,
        e?.description,
        e?.oldPrice,
        e?.showGreenText,
        e?.show,
        e?.price,
        e?.descriptionCrossed,
        e?.greenText,
        e?.getresponseId,
        e?.tokenId
      ]);

  @override
  bool isValidKey(Object? o) => o is TariffsRecord;
}
