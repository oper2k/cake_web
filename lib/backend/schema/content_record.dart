import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContentRecord extends FirestoreRecord {
  ContentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "userReview" field.
  UserReviewStruct? _userReview;
  UserReviewStruct get userReview => _userReview ?? UserReviewStruct();
  bool hasUserReview() => _userReview != null;

  // "sliderImage" field.
  List<String>? _sliderImage;
  List<String> get sliderImage => _sliderImage ?? const [];
  bool hasSliderImage() => _sliderImage != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "pdfFile" field.
  PdfFileStruct? _pdfFile;
  PdfFileStruct get pdfFile => _pdfFile ?? PdfFileStruct();
  bool hasPdfFile() => _pdfFile != null;

  // "courseForAdverts" field.
  CourseForAdvertsStruct? _courseForAdverts;
  CourseForAdvertsStruct get courseForAdverts =>
      _courseForAdverts ?? CourseForAdvertsStruct();
  bool hasCourseForAdverts() => _courseForAdverts != null;

  // "sliderVideo" field.
  List<String>? _sliderVideo;
  List<String> get sliderVideo => _sliderVideo ?? const [];
  bool hasSliderVideo() => _sliderVideo != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "pointText" field.
  List<String>? _pointText;
  List<String> get pointText => _pointText ?? const [];
  bool hasPointText() => _pointText != null;

  // "numberText" field.
  List<String>? _numberText;
  List<String> get numberText => _numberText ?? const [];
  bool hasNumberText() => _numberText != null;

  // "subTitle" field.
  String? _subTitle;
  String get subTitle => _subTitle ?? '';
  bool hasSubTitle() => _subTitle != null;

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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _index = castToType<int>(snapshotData['index']);
    _title = snapshotData['title'] as String?;
    _text = snapshotData['text'] as String?;
    _userReview = UserReviewStruct.maybeFromMap(snapshotData['userReview']);
    _sliderImage = getDataList(snapshotData['sliderImage']);
    _image = snapshotData['image'] as String?;
    _pdfFile = PdfFileStruct.maybeFromMap(snapshotData['pdfFile']);
    _courseForAdverts =
        CourseForAdvertsStruct.maybeFromMap(snapshotData['courseForAdverts']);
    _sliderVideo = getDataList(snapshotData['sliderVideo']);
    _video = snapshotData['video'] as String?;
    _pointText = getDataList(snapshotData['pointText']);
    _numberText = getDataList(snapshotData['numberText']);
    _subTitle = snapshotData['subTitle'] as String?;
    _isVertical = snapshotData['isVertical'] as bool?;
    _audio = AudioFileStruct.maybeFromMap(snapshotData['audio']);
    _sliderImageVertical = snapshotData['sliderImageVertical'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('content')
          : FirebaseFirestore.instance.collectionGroup('content');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('content').doc();

  static Stream<ContentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContentRecord.fromSnapshot(s));

  static Future<ContentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContentRecord.fromSnapshot(s));

  static ContentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContentRecordData({
  int? index,
  String? title,
  String? text,
  UserReviewStruct? userReview,
  String? image,
  PdfFileStruct? pdfFile,
  CourseForAdvertsStruct? courseForAdverts,
  String? video,
  String? subTitle,
  bool? isVertical,
  AudioFileStruct? audio,
  bool? sliderImageVertical,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'index': index,
      'title': title,
      'text': text,
      'userReview': UserReviewStruct().toMap(),
      'image': image,
      'pdfFile': PdfFileStruct().toMap(),
      'courseForAdverts': CourseForAdvertsStruct().toMap(),
      'video': video,
      'subTitle': subTitle,
      'isVertical': isVertical,
      'audio': AudioFileStruct().toMap(),
      'sliderImageVertical': sliderImageVertical,
    }.withoutNulls,
  );

  // Handle nested data for "userReview" field.
  addUserReviewStructData(firestoreData, userReview, 'userReview');

  // Handle nested data for "pdfFile" field.
  addPdfFileStructData(firestoreData, pdfFile, 'pdfFile');

  // Handle nested data for "courseForAdverts" field.
  addCourseForAdvertsStructData(
      firestoreData, courseForAdverts, 'courseForAdverts');

  // Handle nested data for "audio" field.
  addAudioFileStructData(firestoreData, audio, 'audio');

  return firestoreData;
}

class ContentRecordDocumentEquality implements Equality<ContentRecord> {
  const ContentRecordDocumentEquality();

  @override
  bool equals(ContentRecord? e1, ContentRecord? e2) {
    const listEquality = ListEquality();
    return e1?.index == e2?.index &&
        e1?.title == e2?.title &&
        e1?.text == e2?.text &&
        e1?.userReview == e2?.userReview &&
        listEquality.equals(e1?.sliderImage, e2?.sliderImage) &&
        e1?.image == e2?.image &&
        e1?.pdfFile == e2?.pdfFile &&
        e1?.courseForAdverts == e2?.courseForAdverts &&
        listEquality.equals(e1?.sliderVideo, e2?.sliderVideo) &&
        e1?.video == e2?.video &&
        listEquality.equals(e1?.pointText, e2?.pointText) &&
        listEquality.equals(e1?.numberText, e2?.numberText) &&
        e1?.subTitle == e2?.subTitle &&
        e1?.isVertical == e2?.isVertical &&
        e1?.audio == e2?.audio &&
        e1?.sliderImageVertical == e2?.sliderImageVertical;
  }

  @override
  int hash(ContentRecord? e) => const ListEquality().hash([
        e?.index,
        e?.title,
        e?.text,
        e?.userReview,
        e?.sliderImage,
        e?.image,
        e?.pdfFile,
        e?.courseForAdverts,
        e?.sliderVideo,
        e?.video,
        e?.pointText,
        e?.numberText,
        e?.subTitle,
        e?.isVertical,
        e?.audio,
        e?.sliderImageVertical
      ]);

  @override
  bool isValidKey(Object? o) => o is ContentRecord;
}
