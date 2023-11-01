import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "last_message" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "last_message_time" field.
  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _lastMessageTime;
  bool hasLastMessageTime() => _lastMessageTime != null;

  // "last_message_sent_by" field.
  DocumentReference? _lastMessageSentBy;
  DocumentReference? get lastMessageSentBy => _lastMessageSentBy;
  bool hasLastMessageSentBy() => _lastMessageSentBy != null;

  // "last_message_seen_by" field.
  List<DocumentReference>? _lastMessageSeenBy;
  List<DocumentReference> get lastMessageSeenBy =>
      _lastMessageSeenBy ?? const [];
  bool hasLastMessageSeenBy() => _lastMessageSeenBy != null;

  // "user_client" field.
  DocumentReference? _userClient;
  DocumentReference? get userClient => _userClient;
  bool hasUserClient() => _userClient != null;

  // "user_curator" field.
  DocumentReference? _userCurator;
  DocumentReference? get userCurator => _userCurator;
  bool hasUserCurator() => _userCurator != null;

  // "rl_lesson" field.
  DocumentReference? _rlLesson;
  DocumentReference? get rlLesson => _rlLesson;
  bool hasRlLesson() => _rlLesson != null;

  // "isFinished" field.
  bool? _isFinished;
  bool get isFinished => _isFinished ?? false;
  bool hasIsFinished() => _isFinished != null;

  // "count_lessons" field.
  int? _countLessons;
  int get countLessons => _countLessons ?? 0;
  bool hasCountLessons() => _countLessons != null;

  // "index_lesson" field.
  int? _indexLesson;
  int get indexLesson => _indexLesson ?? 0;
  bool hasIndexLesson() => _indexLesson != null;

  void _initializeFields() {
    _lastMessage = snapshotData['last_message'] as String?;
    _lastMessageTime = snapshotData['last_message_time'] as DateTime?;
    _lastMessageSentBy =
        snapshotData['last_message_sent_by'] as DocumentReference?;
    _lastMessageSeenBy = getDataList(snapshotData['last_message_seen_by']);
    _userClient = snapshotData['user_client'] as DocumentReference?;
    _userCurator = snapshotData['user_curator'] as DocumentReference?;
    _rlLesson = snapshotData['rl_lesson'] as DocumentReference?;
    _isFinished = snapshotData['isFinished'] as bool?;
    _countLessons = castToType<int>(snapshotData['count_lessons']);
    _indexLesson = castToType<int>(snapshotData['index_lesson']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  String? lastMessage,
  DateTime? lastMessageTime,
  DocumentReference? lastMessageSentBy,
  DocumentReference? userClient,
  DocumentReference? userCurator,
  DocumentReference? rlLesson,
  bool? isFinished,
  int? countLessons,
  int? indexLesson,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'last_message': lastMessage,
      'last_message_time': lastMessageTime,
      'last_message_sent_by': lastMessageSentBy,
      'user_client': userClient,
      'user_curator': userCurator,
      'rl_lesson': rlLesson,
      'isFinished': isFinished,
      'count_lessons': countLessons,
      'index_lesson': indexLesson,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.lastMessage == e2?.lastMessage &&
        e1?.lastMessageTime == e2?.lastMessageTime &&
        e1?.lastMessageSentBy == e2?.lastMessageSentBy &&
        listEquality.equals(e1?.lastMessageSeenBy, e2?.lastMessageSeenBy) &&
        e1?.userClient == e2?.userClient &&
        e1?.userCurator == e2?.userCurator &&
        e1?.rlLesson == e2?.rlLesson &&
        e1?.isFinished == e2?.isFinished &&
        e1?.countLessons == e2?.countLessons &&
        e1?.indexLesson == e2?.indexLesson;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.lastMessage,
        e?.lastMessageTime,
        e?.lastMessageSentBy,
        e?.lastMessageSeenBy,
        e?.userClient,
        e?.userCurator,
        e?.rlLesson,
        e?.isFinished,
        e?.countLessons,
        e?.indexLesson
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
