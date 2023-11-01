import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoursesRecord extends FirestoreRecord {
  CoursesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "dateStartString" field.
  String? _dateStartString;
  String get dateStartString => _dateStartString ?? '';
  bool hasDateStartString() => _dateStartString != null;

  // "lengthString" field.
  String? _lengthString;
  String get lengthString => _lengthString ?? '';
  bool hasLengthString() => _lengthString != null;

  // "countLessonsString" field.
  String? _countLessonsString;
  String get countLessonsString => _countLessonsString ?? '';
  bool hasCountLessonsString() => _countLessonsString != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  bool hasTag() => _tag != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "is_withModules" field.
  bool? _isWithModules;
  bool get isWithModules => _isWithModules ?? false;
  bool hasIsWithModules() => _isWithModules != null;

  // "galleryImage" field.
  List<String>? _galleryImage;
  List<String> get galleryImage => _galleryImage ?? const [];
  bool hasGalleryImage() => _galleryImage != null;

  // "isFree" field.
  bool? _isFree;
  bool get isFree => _isFree ?? false;
  bool hasIsFree() => _isFree != null;

  // "additionalInfo" field.
  List<CourseAdditionalInfoStruct>? _additionalInfo;
  List<CourseAdditionalInfoStruct> get additionalInfo =>
      _additionalInfo ?? const [];
  bool hasAdditionalInfo() => _additionalInfo != null;

  // "infoFromTeacher" field.
  String? _infoFromTeacher;
  String get infoFromTeacher => _infoFromTeacher ?? '';
  bool hasInfoFromTeacher() => _infoFromTeacher != null;

  // "show" field.
  bool? _show;
  bool get show => _show ?? false;
  bool hasShow() => _show != null;

  // "forWhoCourse" field.
  List<CourseForWhoCourseStruct>? _forWhoCourse;
  List<CourseForWhoCourseStruct> get forWhoCourse => _forWhoCourse ?? const [];
  bool hasForWhoCourse() => _forWhoCourse != null;

  // "whatInProgramString" field.
  String? _whatInProgramString;
  String get whatInProgramString => _whatInProgramString ?? '';
  bool hasWhatInProgramString() => _whatInProgramString != null;

  // "whatInProgram" field.
  List<WhatInProgramStruct>? _whatInProgram;
  List<WhatInProgramStruct> get whatInProgram => _whatInProgram ?? const [];
  bool hasWhatInProgram() => _whatInProgram != null;

  // "lessonsWithoutImage" field.
  List<LessonsWitoutImageStruct>? _lessonsWithoutImage;
  List<LessonsWitoutImageStruct> get lessonsWithoutImage =>
      _lessonsWithoutImage ?? const [];
  bool hasLessonsWithoutImage() => _lessonsWithoutImage != null;

  // "advantages" field.
  List<String>? _advantages;
  List<String> get advantages => _advantages ?? const [];
  bool hasAdvantages() => _advantages != null;

  // "additionalMaterials" field.
  List<AdditionalMaterialStruct>? _additionalMaterials;
  List<AdditionalMaterialStruct> get additionalMaterials =>
      _additionalMaterials ?? const [];
  bool hasAdditionalMaterials() => _additionalMaterials != null;

  // "courseMore" field.
  List<CourseMoreStruct>? _courseMore;
  List<CourseMoreStruct> get courseMore => _courseMore ?? const [];
  bool hasCourseMore() => _courseMore != null;

  // "textCost" field.
  String? _textCost;
  String get textCost => _textCost ?? '';
  bool hasTextCost() => _textCost != null;

  // "whatNeed" field.
  List<String>? _whatNeed;
  List<String> get whatNeed => _whatNeed ?? const [];
  bool hasWhatNeed() => _whatNeed != null;

  // "review" field.
  List<CourseReviewStruct>? _review;
  List<CourseReviewStruct> get review => _review ?? const [];
  bool hasReview() => _review != null;

  // "teacher_string" field.
  String? _teacherString;
  String get teacherString => _teacherString ?? '';
  bool hasTeacherString() => _teacherString != null;

  // "textPoint" field.
  List<String>? _textPoint;
  List<String> get textPoint => _textPoint ?? const [];
  bool hasTextPoint() => _textPoint != null;

  // "bonuses" field.
  List<CourseBonusesStruct>? _bonuses;
  List<CourseBonusesStruct> get bonuses => _bonuses ?? const [];
  bool hasBonuses() => _bonuses != null;

  // "review_images" field.
  List<String>? _reviewImages;
  List<String> get reviewImages => _reviewImages ?? const [];
  bool hasReviewImages() => _reviewImages != null;

  // "teacher_list" field.
  List<String>? _teacherList;
  List<String> get teacherList => _teacherList ?? const [];
  bool hasTeacherList() => _teacherList != null;

  // "text_for_review" field.
  String? _textForReview;
  String get textForReview => _textForReview ?? '';
  bool hasTextForReview() => _textForReview != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "buy_today" field.
  BuyTodayStruct? _buyToday;
  BuyTodayStruct get buyToday => _buyToday ?? BuyTodayStruct();
  bool hasBuyToday() => _buyToday != null;

  // "what_you_learn" field.
  List<String>? _whatYouLearn;
  List<String> get whatYouLearn => _whatYouLearn ?? const [];
  bool hasWhatYouLearn() => _whatYouLearn != null;

  // "link_for_sale" field.
  String? _linkForSale;
  String get linkForSale => _linkForSale ?? '';
  bool hasLinkForSale() => _linkForSale != null;

  // "old_price" field.
  String? _oldPrice;
  String get oldPrice => _oldPrice ?? '';
  bool hasOldPrice() => _oldPrice != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _image = snapshotData['image'] as String?;
    _description = snapshotData['description'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _dateStartString = snapshotData['dateStartString'] as String?;
    _lengthString = snapshotData['lengthString'] as String?;
    _countLessonsString = snapshotData['countLessonsString'] as String?;
    _tag = snapshotData['tag'] as String?;
    _type = snapshotData['type'] as String?;
    _isWithModules = snapshotData['is_withModules'] as bool?;
    _galleryImage = getDataList(snapshotData['galleryImage']);
    _isFree = snapshotData['isFree'] as bool?;
    _additionalInfo = getStructList(
      snapshotData['additionalInfo'],
      CourseAdditionalInfoStruct.fromMap,
    );
    _infoFromTeacher = snapshotData['infoFromTeacher'] as String?;
    _show = snapshotData['show'] as bool?;
    _forWhoCourse = getStructList(
      snapshotData['forWhoCourse'],
      CourseForWhoCourseStruct.fromMap,
    );
    _whatInProgramString = snapshotData['whatInProgramString'] as String?;
    _whatInProgram = getStructList(
      snapshotData['whatInProgram'],
      WhatInProgramStruct.fromMap,
    );
    _lessonsWithoutImage = getStructList(
      snapshotData['lessonsWithoutImage'],
      LessonsWitoutImageStruct.fromMap,
    );
    _advantages = getDataList(snapshotData['advantages']);
    _additionalMaterials = getStructList(
      snapshotData['additionalMaterials'],
      AdditionalMaterialStruct.fromMap,
    );
    _courseMore = getStructList(
      snapshotData['courseMore'],
      CourseMoreStruct.fromMap,
    );
    _textCost = snapshotData['textCost'] as String?;
    _whatNeed = getDataList(snapshotData['whatNeed']);
    _review = getStructList(
      snapshotData['review'],
      CourseReviewStruct.fromMap,
    );
    _teacherString = snapshotData['teacher_string'] as String?;
    _textPoint = getDataList(snapshotData['textPoint']);
    _bonuses = getStructList(
      snapshotData['bonuses'],
      CourseBonusesStruct.fromMap,
    );
    _reviewImages = getDataList(snapshotData['review_images']);
    _teacherList = getDataList(snapshotData['teacher_list']);
    _textForReview = snapshotData['text_for_review'] as String?;
    _price = castToType<int>(snapshotData['price']);
    _buyToday = BuyTodayStruct.maybeFromMap(snapshotData['buy_today']);
    _whatYouLearn = getDataList(snapshotData['what_you_learn']);
    _linkForSale = snapshotData['link_for_sale'] as String?;
    _oldPrice = snapshotData['old_price'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('courses');

  static Stream<CoursesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoursesRecord.fromSnapshot(s));

  static Future<CoursesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoursesRecord.fromSnapshot(s));

  static CoursesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoursesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoursesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoursesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoursesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoursesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoursesRecordData({
  String? name,
  String? image,
  String? description,
  DateTime? date,
  String? dateStartString,
  String? lengthString,
  String? countLessonsString,
  String? tag,
  String? type,
  bool? isWithModules,
  bool? isFree,
  String? infoFromTeacher,
  bool? show,
  String? whatInProgramString,
  String? textCost,
  String? teacherString,
  String? textForReview,
  int? price,
  BuyTodayStruct? buyToday,
  String? linkForSale,
  String? oldPrice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image': image,
      'description': description,
      'date': date,
      'dateStartString': dateStartString,
      'lengthString': lengthString,
      'countLessonsString': countLessonsString,
      'tag': tag,
      'type': type,
      'is_withModules': isWithModules,
      'isFree': isFree,
      'infoFromTeacher': infoFromTeacher,
      'show': show,
      'whatInProgramString': whatInProgramString,
      'textCost': textCost,
      'teacher_string': teacherString,
      'text_for_review': textForReview,
      'price': price,
      'buy_today': BuyTodayStruct().toMap(),
      'link_for_sale': linkForSale,
      'old_price': oldPrice,
    }.withoutNulls,
  );

  // Handle nested data for "buy_today" field.
  addBuyTodayStructData(firestoreData, buyToday, 'buy_today');

  return firestoreData;
}

class CoursesRecordDocumentEquality implements Equality<CoursesRecord> {
  const CoursesRecordDocumentEquality();

  @override
  bool equals(CoursesRecord? e1, CoursesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.image == e2?.image &&
        e1?.description == e2?.description &&
        e1?.date == e2?.date &&
        e1?.dateStartString == e2?.dateStartString &&
        e1?.lengthString == e2?.lengthString &&
        e1?.countLessonsString == e2?.countLessonsString &&
        e1?.tag == e2?.tag &&
        e1?.type == e2?.type &&
        e1?.isWithModules == e2?.isWithModules &&
        listEquality.equals(e1?.galleryImage, e2?.galleryImage) &&
        e1?.isFree == e2?.isFree &&
        listEquality.equals(e1?.additionalInfo, e2?.additionalInfo) &&
        e1?.infoFromTeacher == e2?.infoFromTeacher &&
        e1?.show == e2?.show &&
        listEquality.equals(e1?.forWhoCourse, e2?.forWhoCourse) &&
        e1?.whatInProgramString == e2?.whatInProgramString &&
        listEquality.equals(e1?.whatInProgram, e2?.whatInProgram) &&
        listEquality.equals(e1?.lessonsWithoutImage, e2?.lessonsWithoutImage) &&
        listEquality.equals(e1?.advantages, e2?.advantages) &&
        listEquality.equals(e1?.additionalMaterials, e2?.additionalMaterials) &&
        listEquality.equals(e1?.courseMore, e2?.courseMore) &&
        e1?.textCost == e2?.textCost &&
        listEquality.equals(e1?.whatNeed, e2?.whatNeed) &&
        listEquality.equals(e1?.review, e2?.review) &&
        e1?.teacherString == e2?.teacherString &&
        listEquality.equals(e1?.textPoint, e2?.textPoint) &&
        listEquality.equals(e1?.bonuses, e2?.bonuses) &&
        listEquality.equals(e1?.reviewImages, e2?.reviewImages) &&
        listEquality.equals(e1?.teacherList, e2?.teacherList) &&
        e1?.textForReview == e2?.textForReview &&
        e1?.price == e2?.price &&
        e1?.buyToday == e2?.buyToday &&
        listEquality.equals(e1?.whatYouLearn, e2?.whatYouLearn) &&
        e1?.linkForSale == e2?.linkForSale &&
        e1?.oldPrice == e2?.oldPrice;
  }

  @override
  int hash(CoursesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.image,
        e?.description,
        e?.date,
        e?.dateStartString,
        e?.lengthString,
        e?.countLessonsString,
        e?.tag,
        e?.type,
        e?.isWithModules,
        e?.galleryImage,
        e?.isFree,
        e?.additionalInfo,
        e?.infoFromTeacher,
        e?.show,
        e?.forWhoCourse,
        e?.whatInProgramString,
        e?.whatInProgram,
        e?.lessonsWithoutImage,
        e?.advantages,
        e?.additionalMaterials,
        e?.courseMore,
        e?.textCost,
        e?.whatNeed,
        e?.review,
        e?.teacherString,
        e?.textPoint,
        e?.bonuses,
        e?.reviewImages,
        e?.teacherList,
        e?.textForReview,
        e?.price,
        e?.buyToday,
        e?.whatYouLearn,
        e?.linkForSale,
        e?.oldPrice
      ]);

  @override
  bool isValidKey(Object? o) => o is CoursesRecord;
}
