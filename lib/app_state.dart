import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _showLastLessonOnHome =
          await secureStorage.getBool('ff_showLastLessonOnHome') ??
              _showLastLessonOnHome;
    });
    await _safeInitAsync(() async {
      _curatorChat = (await secureStorage.getString('ff_curatorChat'))?.ref ??
          _curatorChat;
    });
    await _safeInitAsync(() async {
      _BaseSearchHistory =
          await secureStorage.getStringList('ff_BaseSearchHistory') ??
              _BaseSearchHistory;
    });
    await _safeInitAsync(() async {
      _publicID = await secureStorage.getString('ff_publicID') ?? _publicID;
    });
    await _safeInitAsync(() async {
      _showOldCourses =
          await secureStorage.getBool('ff_showOldCourses') ?? _showOldCourses;
    });
    await _safeInitAsync(() async {
      _showInfoChat =
          await secureStorage.getInt('ff_showInfoChat') ?? _showInfoChat;
    });
    await _safeInitAsync(() async {
      _basketTariffs = (await secureStorage.getStringList('ff_basketTariffs'))
              ?.map((path) => path.ref)
              .toList() ??
          _basketTariffs;
    });
    await _safeInitAsync(() async {
      _showContinueCourse =
          await secureStorage.getInt('ff_showContinueCourse') ??
              _showContinueCourse;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  bool _showLastLessonOnHome = true;
  bool get showLastLessonOnHome => _showLastLessonOnHome;
  set showLastLessonOnHome(bool _value) {
    _showLastLessonOnHome = _value;
    secureStorage.setBool('ff_showLastLessonOnHome', _value);
  }

  void deleteShowLastLessonOnHome() {
    secureStorage.delete(key: 'ff_showLastLessonOnHome');
  }

  String _showExpandViewLessons = '';
  String get showExpandViewLessons => _showExpandViewLessons;
  set showExpandViewLessons(String _value) {
    _showExpandViewLessons = _value;
  }

  String _courseTypeForFilter = '';
  String get courseTypeForFilter => _courseTypeForFilter;
  set courseTypeForFilter(String _value) {
    _courseTypeForFilter = _value;
  }

  String _courseTagForFilter = '';
  String get courseTagForFilter => _courseTagForFilter;
  set courseTagForFilter(String _value) {
    _courseTagForFilter = _value;
  }

  bool _courseSortPriceForFilter = false;
  bool get courseSortPriceForFilter => _courseSortPriceForFilter;
  set courseSortPriceForFilter(bool _value) {
    _courseSortPriceForFilter = _value;
  }

  String _filterForKnowledgeBase = '';
  String get filterForKnowledgeBase => _filterForKnowledgeBase;
  set filterForKnowledgeBase(String _value) {
    _filterForKnowledgeBase = _value;
  }

  String _filterForTmpSubscribe = '';
  String get filterForTmpSubscribe => _filterForTmpSubscribe;
  set filterForTmpSubscribe(String _value) {
    _filterForTmpSubscribe = _value;
  }

  String _courseTeacherForFilter = '';
  String get courseTeacherForFilter => _courseTeacherForFilter;
  set courseTeacherForFilter(String _value) {
    _courseTeacherForFilter = _value;
  }

  DocumentReference? _curatorChat =
      FirebaseFirestore.instance.doc('/users/oper2k');
  DocumentReference? get curatorChat => _curatorChat;
  set curatorChat(DocumentReference? _value) {
    _curatorChat = _value;
    _value != null
        ? secureStorage.setString('ff_curatorChat', _value.path)
        : secureStorage.remove('ff_curatorChat');
  }

  void deleteCuratorChat() {
    secureStorage.delete(key: 'ff_curatorChat');
  }

  String _tmpField = '';
  String get tmpField => _tmpField;
  set tmpField(String _value) {
    _tmpField = _value;
  }

  List<String> _BaseSearchHistory = [];
  List<String> get BaseSearchHistory => _BaseSearchHistory;
  set BaseSearchHistory(List<String> _value) {
    _BaseSearchHistory = _value;
    secureStorage.setStringList('ff_BaseSearchHistory', _value);
  }

  void deleteBaseSearchHistory() {
    secureStorage.delete(key: 'ff_BaseSearchHistory');
  }

  void addToBaseSearchHistory(String _value) {
    _BaseSearchHistory.add(_value);
    secureStorage.setStringList('ff_BaseSearchHistory', _BaseSearchHistory);
  }

  void removeFromBaseSearchHistory(String _value) {
    _BaseSearchHistory.remove(_value);
    secureStorage.setStringList('ff_BaseSearchHistory', _BaseSearchHistory);
  }

  void removeAtIndexFromBaseSearchHistory(int _index) {
    _BaseSearchHistory.removeAt(_index);
    secureStorage.setStringList('ff_BaseSearchHistory', _BaseSearchHistory);
  }

  void updateBaseSearchHistoryAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _BaseSearchHistory[_index] = updateFn(_BaseSearchHistory[_index]);
    secureStorage.setStringList('ff_BaseSearchHistory', _BaseSearchHistory);
  }

  void insertAtIndexInBaseSearchHistory(int _index, String _value) {
    _BaseSearchHistory.insert(_index, _value);
    secureStorage.setStringList('ff_BaseSearchHistory', _BaseSearchHistory);
  }

  String _publicID = 'pk_aac7ed3ac5962f2c8ebe68ab62c60';
  String get publicID => _publicID;
  set publicID(String _value) {
    _publicID = _value;
    secureStorage.setString('ff_publicID', _value);
  }

  void deletePublicID() {
    secureStorage.delete(key: 'ff_publicID');
  }

  bool _showOldCourses = true;
  bool get showOldCourses => _showOldCourses;
  set showOldCourses(bool _value) {
    _showOldCourses = _value;
    secureStorage.setBool('ff_showOldCourses', _value);
  }

  void deleteShowOldCourses() {
    secureStorage.delete(key: 'ff_showOldCourses');
  }

  int _showInfoChat = 0;
  int get showInfoChat => _showInfoChat;
  set showInfoChat(int _value) {
    _showInfoChat = _value;
    secureStorage.setInt('ff_showInfoChat', _value);
  }

  void deleteShowInfoChat() {
    secureStorage.delete(key: 'ff_showInfoChat');
  }

  List<DocumentReference> _basketTariffs = [];
  List<DocumentReference> get basketTariffs => _basketTariffs;
  set basketTariffs(List<DocumentReference> _value) {
    _basketTariffs = _value;
    secureStorage.setStringList(
        'ff_basketTariffs', _value.map((x) => x.path).toList());
  }

  void deleteBasketTariffs() {
    secureStorage.delete(key: 'ff_basketTariffs');
  }

  void addToBasketTariffs(DocumentReference _value) {
    _basketTariffs.add(_value);
    secureStorage.setStringList(
        'ff_basketTariffs', _basketTariffs.map((x) => x.path).toList());
  }

  void removeFromBasketTariffs(DocumentReference _value) {
    _basketTariffs.remove(_value);
    secureStorage.setStringList(
        'ff_basketTariffs', _basketTariffs.map((x) => x.path).toList());
  }

  void removeAtIndexFromBasketTariffs(int _index) {
    _basketTariffs.removeAt(_index);
    secureStorage.setStringList(
        'ff_basketTariffs', _basketTariffs.map((x) => x.path).toList());
  }

  void updateBasketTariffsAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _basketTariffs[_index] = updateFn(_basketTariffs[_index]);
    secureStorage.setStringList(
        'ff_basketTariffs', _basketTariffs.map((x) => x.path).toList());
  }

  void insertAtIndexInBasketTariffs(int _index, DocumentReference _value) {
    _basketTariffs.insert(_index, _value);
    secureStorage.setStringList(
        'ff_basketTariffs', _basketTariffs.map((x) => x.path).toList());
  }

  bool _supportOn = false;
  bool get supportOn => _supportOn;
  set supportOn(bool _value) {
    _supportOn = _value;
  }

  int _showContinueCourse = 1;
  int get showContinueCourse => _showContinueCourse;
  set showContinueCourse(int _value) {
    _showContinueCourse = _value;
    secureStorage.setInt('ff_showContinueCourse', _value);
  }

  void deleteShowContinueCourse() {
    secureStorage.delete(key: 'ff_showContinueCourse');
  }

  bool _rulesOpen = false;
  bool get rulesOpen => _rulesOpen;
  set rulesOpen(bool _value) {
    _rulesOpen = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
