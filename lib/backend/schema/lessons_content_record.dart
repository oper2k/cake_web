import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonsContentRecord extends FirestoreRecord {
  LessonsContentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "rl_lessons" field.
  DocumentReference? _rlLessons;
  DocumentReference? get rlLessons => _rlLessons;
  bool hasRlLessons() => _rlLessons != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "imageL" field.
  List<String>? _imageL;
  List<String> get imageL => _imageL ?? const [];
  bool hasImageL() => _imageL != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "pdf" field.
  PdfFileStruct? _pdf;
  PdfFileStruct get pdf => _pdf ?? PdfFileStruct();
  bool hasPdf() => _pdf != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "socialButton" field.
  TelegaStruct? _socialButton;
  TelegaStruct get socialButton => _socialButton ?? TelegaStruct();
  bool hasSocialButton() => _socialButton != null;

  // "video_string" field.
  String? _videoString;
  String get videoString => _videoString ?? '';
  bool hasVideoString() => _videoString != null;

  // "pointText" field.
  List<String>? _pointText;
  List<String> get pointText => _pointText ?? const [];
  bool hasPointText() => _pointText != null;

  // "numberText" field.
  List<String>? _numberText;
  List<String> get numberText => _numberText ?? const [];
  bool hasNumberText() => _numberText != null;

  // "subtitle" field.
  String? _subtitle;
  String get subtitle => _subtitle ?? '';
  bool hasSubtitle() => _subtitle != null;

  // "isVertical" field.
  bool? _isVertical;
  bool get isVertical => _isVertical ?? false;
  bool hasIsVertical() => _isVertical != null;

  // "audio" field.
  AudioFileStruct? _audio;
  AudioFileStruct get audio => _audio ?? AudioFileStruct();
  bool hasAudio() => _audio != null;

  // "sliderImageVertical" field.
  bool? _sliderImageVertical;
  bool get sliderImageVertical => _sliderImageVertical ?? false;
  bool hasSliderImageVertical() => _sliderImageVertical != null;

  // "buy_today" field.
  BuyTodayStruct? _buyToday;
  BuyTodayStruct get buyToday => _buyToday ?? BuyTodayStruct();
  bool hasBuyToday() => _buyToday != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _rlLessons = snapshotData['rl_lessons'] as DocumentReference?;
    _index = castToType<int>(snapshotData['index']);
    _text = snapshotData['text'] as String?;
    _imageL = getDataList(snapshotData['imageL']);
    _title = snapshotData['title'] as String?;
    _pdf = PdfFileStruct.maybeFromMap(snapshotData['pdf']);
    _video = snapshotData['video'] as String?;
    _socialButton = TelegaStruct.maybeFromMap(snapshotData['socialButton']);
    _videoString = snapshotData['video_string'] as String?;
    _pointText = getDataList(snapshotData['pointText']);
    _numberText = getDataList(snapshotData['numberText']);
    _subtitle = snapshotData['subtitle'] as String?;
    _isVertical = snapshotData['isVertical'] as bool?;
    _audio = AudioFileStruct.maybeFromMap(snapshotData['audio']);
    _sliderImageVertical = snapshotData['sliderImageVertical'] as bool?;
    _buyToday = BuyTodayStruct.maybeFromMap(snapshotData['buy_today']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('lessons_content')
          : FirebaseFirestore.instance.collectionGroup('lessons_content');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('lessons_content').doc();

  static Stream<LessonsContentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LessonsContentRecord.fromSnapshot(s));

  static Future<LessonsContentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LessonsContentRecord.fromSnapshot(s));

  static LessonsContentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LessonsContentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LessonsContentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LessonsContentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LessonsContentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LessonsContentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLessonsContentRecordData({
  DocumentReference? rlLessons,
  int? index,
  String? text,
  String? title,
  PdfFileStruct? pdf,
  String? video,
  TelegaStruct? socialButton,
  String? videoString,
  String? subtitle,
  bool? isVertical,
  AudioFileStruct? audio,
  bool? sliderImageVertical,
  BuyTodayStruct? buyToday,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rl_lessons': rlLessons,
      'index': index,
      'text': text,
      'title': title,
      'pdf': PdfFileStruct().toMap(),
      'video': video,
      'socialButton': TelegaStruct().toMap(),
      'video_string': videoString,
      'subtitle': subtitle,
      'isVertical': isVertical,
      'audio': AudioFileStruct().toMap(),
      'sliderImageVertical': sliderImageVertical,
      'buy_today': BuyTodayStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "pdf" field.
  addPdfFileStructData(firestoreData, pdf, 'pdf');

  // Handle nested data for "socialButton" field.
  addTelegaStructData(firestoreData, socialButton, 'socialButton');

  // Handle nested data for "audio" field.
  addAudioFileStructData(firestoreData, audio, 'audio');

  // Handle nested data for "buy_today" field.
  addBuyTodayStructData(firestoreData, buyToday, 'buy_today');

  return firestoreData;
}

class LessonsContentRecordDocumentEquality
    implements Equality<LessonsContentRecord> {
  const LessonsContentRecordDocumentEquality();

  @override
  bool equals(LessonsContentRecord? e1, LessonsContentRecord? e2) {
    const listEquality = ListEquality();
    return e1?.rlLessons == e2?.rlLessons &&
        e1?.index == e2?.index &&
        e1?.text == e2?.text &&
        listEquality.equals(e1?.imageL, e2?.imageL) &&
        e1?.title == e2?.title &&
        e1?.pdf == e2?.pdf &&
        e1?.video == e2?.video &&
        e1?.socialButton == e2?.socialButton &&
        e1?.videoString == e2?.videoString &&
        listEquality.equals(e1?.pointText, e2?.pointText) &&
        listEquality.equals(e1?.numberText, e2?.numberText) &&
        e1?.subtitle == e2?.subtitle &&
        e1?.isVertical == e2?.isVertical &&
        e1?.audio == e2?.audio &&
        e1?.sliderImageVertical == e2?.sliderImageVertical &&
        e1?.buyToday == e2?.buyToday;
  }

  @override
  int hash(LessonsContentRecord? e) => const ListEquality().hash([
        e?.rlLessons,
        e?.index,
        e?.text,
        e?.imageL,
        e?.title,
        e?.pdf,
        e?.video,
        e?.socialButton,
        e?.videoString,
        e?.pointText,
        e?.numberText,
        e?.subtitle,
        e?.isVertical,
        e?.audio,
        e?.sliderImageVertical,
        e?.buyToday
      ]);

  @override
  bool isValidKey(Object? o) => o is LessonsContentRecord;
}
