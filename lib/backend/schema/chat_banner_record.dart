import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatBannerRecord extends FirestoreRecord {
  ChatBannerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "rl_tariffs" field.
  List<DocumentReference>? _rlTariffs;
  List<DocumentReference> get rlTariffs => _rlTariffs ?? const [];
  bool hasRlTariffs() => _rlTariffs != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _rlTariffs = getDataList(snapshotData['rl_tariffs']);
    _title = snapshotData['title'] as String?;
    _text = snapshotData['text'] as String?;
    _link = snapshotData['link'] as String?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chatBanner');

  static Stream<ChatBannerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatBannerRecord.fromSnapshot(s));

  static Future<ChatBannerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatBannerRecord.fromSnapshot(s));

  static ChatBannerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatBannerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatBannerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatBannerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatBannerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatBannerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatBannerRecordData({
  String? title,
  String? text,
  String? link,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'text': text,
      'link': link,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatBannerRecordDocumentEquality implements Equality<ChatBannerRecord> {
  const ChatBannerRecordDocumentEquality();

  @override
  bool equals(ChatBannerRecord? e1, ChatBannerRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.rlTariffs, e2?.rlTariffs) &&
        e1?.title == e2?.title &&
        e1?.text == e2?.text &&
        e1?.link == e2?.link &&
        e1?.image == e2?.image;
  }

  @override
  int hash(ChatBannerRecord? e) => const ListEquality()
      .hash([e?.rlTariffs, e?.title, e?.text, e?.link, e?.image]);

  @override
  bool isValidKey(Object? o) => o is ChatBannerRecord;
}
