import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).primaryBackground,
          child: Center(
            child: Image.asset(
              'assets/images/cake_school_logo_black.png',
              width: 140.0,
              height: 140.0,
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Basket': (data) async => ParameterData(
        allParams: {
          'currentPage': getParameter<int>(data, 'currentPage'),
        },
      ),
  'Log_In': ParameterData.none(),
  'Profile': ParameterData.none(),
  'Pass_Restore': ParameterData.none(),
  'Msg_Snt': ParameterData.none(),
  'Sign_in': ParameterData.none(),
  'Boarding2': ParameterData.none(),
  'Boarding1': ParameterData.none(),
  'Balance_Mobile': ParameterData.none(),
  'Sert_Mobile': ParameterData.none(),
  'Profile_Edit': (data) async => ParameterData(
        allParams: {
          'initialTabIndex': getParameter<int>(data, 'initialTabIndex'),
        },
      ),
  'Ordering': ParameterData.none(),
  'Choose_Payment': ParameterData.none(),
  'Courses_Old': ParameterData.none(),
  'Payment_Card': ParameterData.none(),
  'Modules': (data) async => ParameterData(
        allParams: {
          'currentCourse': await getDocumentParameter<CoursesRecord>(
              data, 'currentCourse', CoursesRecord.fromSnapshot),
          'tariffRef': getParameter<DocumentReference>(data, 'tariffRef'),
        },
      ),
  'Complete': (data) async => ParameterData(
        allParams: {},
      ),
  'Present': ParameterData.none(),
  'HomeworkAdded': (data) async => ParameterData(
        allParams: {
          'photoOnly': getParameter<bool>(data, 'photoOnly'),
          'currentChat': await getDocumentParameter<ChatsRecord>(
              data, 'currentChat', ChatsRecord.fromSnapshot),
          'currentTariff':
              getParameter<DocumentReference>(data, 'currentTariff'),
        },
      ),
  'Lessonold': ParameterData.none(),
  'Homework_Confirmed_Mobile': (data) async => ParameterData(
        allParams: {
          'currentLesson': await getDocumentParameter<LessonsRecord>(
              data, 'currentLesson', LessonsRecord.fromSnapshot),
          'countLesson': getParameter<int>(data, 'countLesson'),
          'lessonIndx': getParameter<int>(data, 'lessonIndx'),
          'currentTariff':
              getParameter<DocumentReference>(data, 'currentTariff'),
        },
      ),
  'Lesson': (data) async => ParameterData(
        allParams: {
          'currentLesson': await getDocumentParameter<LessonsRecord>(
              data, 'currentLesson', LessonsRecord.fromSnapshot),
          'lessonIndex': getParameter<int>(data, 'lessonIndex'),
          'countLessons': getParameter<int>(data, 'countLessons'),
          'tariff': getParameter<DocumentReference>(data, 'tariff'),
        },
      ),
  'Homework': (data) async => ParameterData(
        allParams: {
          'lesson': await getDocumentParameter<LessonsRecord>(
              data, 'lesson', LessonsRecord.fromSnapshot),
          'allLessCount': getParameter<int>(data, 'allLessCount'),
          'indexInList': getParameter<int>(data, 'indexInList'),
          'courseFree': getParameter<bool>(data, 'courseFree'),
          'tariff': getParameter<DocumentReference>(data, 'tariff'),
        },
      ),
  'Gallerry': (data) async => ParameterData(
        allParams: {
          'currentIndex': getParameter<int>(data, 'currentIndex'),
          'tariff': getParameter<DocumentReference>(data, 'tariff'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
