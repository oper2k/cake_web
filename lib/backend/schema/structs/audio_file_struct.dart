// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AudioFileStruct extends FFFirebaseStruct {
  AudioFileStruct({
    String? name,
    String? link,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _link = link,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;
  bool hasLink() => _link != null;

  static AudioFileStruct fromMap(Map<String, dynamic> data) => AudioFileStruct(
        name: data['name'] as String?,
        link: data['link'] as String?,
      );

  static AudioFileStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AudioFileStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'link': _link,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
      }.withoutNulls;

  static AudioFileStruct fromSerializableMap(Map<String, dynamic> data) =>
      AudioFileStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AudioFileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AudioFileStruct && name == other.name && link == other.link;
  }

  @override
  int get hashCode => const ListEquality().hash([name, link]);
}

AudioFileStruct createAudioFileStruct({
  String? name,
  String? link,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AudioFileStruct(
      name: name,
      link: link,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AudioFileStruct? updateAudioFileStruct(
  AudioFileStruct? audioFile, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    audioFile
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAudioFileStructData(
  Map<String, dynamic> firestoreData,
  AudioFileStruct? audioFile,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (audioFile == null) {
    return;
  }
  if (audioFile.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && audioFile.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final audioFileData = getAudioFileFirestoreData(audioFile, forFieldValue);
  final nestedData = audioFileData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = audioFile.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAudioFileFirestoreData(
  AudioFileStruct? audioFile, [
  bool forFieldValue = false,
]) {
  if (audioFile == null) {
    return {};
  }
  final firestoreData = mapToFirestore(audioFile.toMap());

  // Add any Firestore field values
  audioFile.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAudioFileListFirestoreData(
  List<AudioFileStruct>? audioFiles,
) =>
    audioFiles?.map((e) => getAudioFileFirestoreData(e, true)).toList() ?? [];
