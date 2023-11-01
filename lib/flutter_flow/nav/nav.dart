import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? CoursesWidget() : LogInWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? CoursesWidget() : LogInWidget(),
        ),
        FFRoute(
          name: 'Basket',
          path: '/basket',
          builder: (context, params) => BasketWidget(
            currentPage: params.getParam('currentPage', ParamType.int),
            basketTariffs: params.getParam<DocumentReference>('basketTariffs',
                ParamType.DocumentReference, true, ['tariffs']),
          ),
        ),
        FFRoute(
          name: 'Log_In',
          path: '/logIn',
          builder: (context, params) => LogInWidget(),
        ),
        FFRoute(
          name: 'Profile',
          path: '/profile',
          requireAuth: true,
          builder: (context, params) => ProfileWidget(),
        ),
        FFRoute(
          name: 'Pass_Restore',
          path: '/passRestore',
          builder: (context, params) => PassRestoreWidget(),
        ),
        FFRoute(
          name: 'Msg_Snt',
          path: '/msgSnt',
          builder: (context, params) => MsgSntWidget(),
        ),
        FFRoute(
          name: 'Sign_in',
          path: '/signIn',
          builder: (context, params) => SignInWidget(),
        ),
        FFRoute(
          name: 'Boarding2',
          path: '/boarding2',
          builder: (context, params) => Boarding2Widget(),
        ),
        FFRoute(
          name: 'Boarding1',
          path: '/boarding1',
          builder: (context, params) => Boarding1Widget(),
        ),
        FFRoute(
          name: 'Balance_Mobile',
          path: '/balanceMobile',
          builder: (context, params) => BalanceMobileWidget(),
        ),
        FFRoute(
          name: 'Sert_Mobile',
          path: '/sertMobile',
          builder: (context, params) => SertMobileWidget(),
        ),
        FFRoute(
          name: 'Profile_Edit',
          path: '/profileEdit',
          requireAuth: true,
          builder: (context, params) => ProfileEditWidget(
            initialTabIndex: params.getParam('initialTabIndex', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'Ordering',
          path: '/ordering',
          builder: (context, params) => OrderingWidget(),
        ),
        FFRoute(
          name: 'Choose_Payment',
          path: '/choosePayment',
          builder: (context, params) => ChoosePaymentWidget(),
        ),
        FFRoute(
          name: 'My_Courses',
          path: '/myCourses',
          builder: (context, params) => MyCoursesWidget(),
        ),
        FFRoute(
          name: 'Payment_Card',
          path: '/paymentCard',
          builder: (context, params) => PaymentCardWidget(),
        ),
        FFRoute(
          name: 'Card_Pay',
          path: '/cardPay',
          requireAuth: true,
          builder: (context, params) => CardPayWidget(
            fullPrice: params.getParam('fullPrice', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'Modules',
          path: '/modules',
          requireAuth: true,
          asyncParams: {
            'currentCourse': getDoc(['courses'], CoursesRecord.fromSnapshot),
          },
          builder: (context, params) => ModulesWidget(
            currentCourse: params.getParam('currentCourse', ParamType.Document),
            tariffRef: params.getParam(
                'tariffRef', ParamType.DocumentReference, false, ['tariffs']),
          ),
        ),
        FFRoute(
          name: 'Complete',
          path: '/complete',
          requireAuth: true,
          builder: (context, params) => CompleteWidget(),
        ),
        FFRoute(
          name: 'Present',
          path: '/present',
          builder: (context, params) => PresentWidget(),
        ),
        FFRoute(
          name: 'HomeworkAdded',
          path: '/homeworkAdded',
          requireAuth: true,
          asyncParams: {
            'currentChat': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => HomeworkAddedWidget(
            photoOnly: params.getParam('photoOnly', ParamType.bool),
            currentChat: params.getParam('currentChat', ParamType.Document),
            courseFree: params.getParam('courseFree', ParamType.bool),
            currentTariff: params.getParam('currentTariff',
                ParamType.DocumentReference, false, ['tariffs']),
          ),
        ),
        FFRoute(
          name: 'Lessonold',
          path: '/lessonold',
          builder: (context, params) => LessonoldWidget(),
        ),
        FFRoute(
          name: 'Homework_Confirmed_Mobile',
          path: '/homeworkConfirmedMobile',
          requireAuth: true,
          asyncParams: {
            'currentLesson':
                getDoc(['courses', 'lessons'], LessonsRecord.fromSnapshot),
          },
          builder: (context, params) => HomeworkConfirmedMobileWidget(
            currentLesson: params.getParam('currentLesson', ParamType.Document),
            countLesson: params.getParam('countLesson', ParamType.int),
            lessonIndx: params.getParam('lessonIndx', ParamType.int),
            courseFree: params.getParam('courseFree', ParamType.bool),
            currentTariff: params.getParam('currentTariff',
                ParamType.DocumentReference, false, ['tariffs']),
          ),
        ),
        FFRoute(
          name: 'Lesson',
          path: '/lessonfull',
          requireAuth: true,
          asyncParams: {
            'currentLesson':
                getDoc(['courses', 'lessons'], LessonsRecord.fromSnapshot),
          },
          builder: (context, params) => LessonWidget(
            currentLesson: params.getParam('currentLesson', ParamType.Document),
            lessonIndex: params.getParam('lessonIndex', ParamType.int),
            countLessons: params.getParam('countLessons', ParamType.int),
            tariff: params.getParam(
                'tariff', ParamType.DocumentReference, false, ['tariffs']),
            freeCourse: params.getParam('freeCourse', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'Homework',
          path: '/homework',
          asyncParams: {
            'lesson':
                getDoc(['courses', 'lessons'], LessonsRecord.fromSnapshot),
          },
          builder: (context, params) => HomeworkWidget(
            lesson: params.getParam('lesson', ParamType.Document),
            allLessCount: params.getParam('allLessCount', ParamType.int),
            indexInList: params.getParam('indexInList', ParamType.int),
            courseFree: params.getParam('courseFree', ParamType.bool),
            tariff: params.getParam(
                'tariff', ParamType.DocumentReference, false, ['tariffs']),
          ),
        ),
        FFRoute(
          name: 'ModulesFree',
          path: '/modulesFree',
          requireAuth: true,
          asyncParams: {
            'currentCourse': getDoc(['courses'], CoursesRecord.fromSnapshot),
          },
          builder: (context, params) => ModulesFreeWidget(
            currentCourse: params.getParam('currentCourse', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'Gallerry',
          path: '/gallerry',
          requireAuth: true,
          builder: (context, params) => GallerryWidget(
            allImages:
                params.getParam<String>('allImages', ParamType.String, true),
            currentIndex: params.getParam('currentIndex', ParamType.int),
            courseFree: params.getParam('courseFree', ParamType.bool),
            tariff: params.getParam(
                'tariff', ParamType.DocumentReference, false, ['tariffs']),
          ),
        ),
        FFRoute(
          name: 'Courses',
          path: '/Courses',
          requireAuth: true,
          builder: (context, params) => CoursesWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/logIn';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
