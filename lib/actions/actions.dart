import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/courses/homework_add_desktop/homework_add_desktop_widget.dart';
import '/courses/take_first_less/take_first_less_widget.dart';
import '/courses/take_first_less_mobile/take_first_less_mobile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

Future navigationForOpenLesson(
  BuildContext context, {
  int? lessonIndexInList,
  LessonsRecord? currentLesson,
  UsersRecord? userDoc,
  int? countLessons,
  required DocumentReference? tariff,
}) async {
  if (lessonIndexInList == 0) {
    context.pushNamed(
      'Lesson',
      queryParameters: {
        'currentLesson': serializeParam(
          currentLesson,
          ParamType.Document,
        ),
        'lessonIndex': serializeParam(
          lessonIndexInList,
          ParamType.int,
        ),
        'countLessons': serializeParam(
          countLessons,
          ParamType.int,
        ),
        'tariff': serializeParam(
          tariff,
          ParamType.DocumentReference,
        ),
        'freeCourse': serializeParam(
          false,
          ParamType.bool,
        ),
      }.withoutNulls,
      extra: <String, dynamic>{
        'currentLesson': currentLesson,
        kTransitionInfoKey: TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.fade,
          duration: Duration(milliseconds: 0),
        ),
      },
    );
  } else {
    if (userDoc!.rlFinishedCourseFirstLesson
        .contains(currentLesson?.parentReference)) {
      context.pushNamed(
        'Lesson',
        queryParameters: {
          'currentLesson': serializeParam(
            currentLesson,
            ParamType.Document,
          ),
          'lessonIndex': serializeParam(
            lessonIndexInList,
            ParamType.int,
          ),
          'countLessons': serializeParam(
            countLessons,
            ParamType.int,
          ),
          'tariff': serializeParam(
            tariff,
            ParamType.DocumentReference,
          ),
          'freeCourse': serializeParam(
            false,
            ParamType.bool,
          ),
        }.withoutNulls,
        extra: <String, dynamic>{
          'currentLesson': currentLesson,
          kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );
    } else {
      if (MediaQuery.sizeOf(context).width <= kBreakpointSmall) {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          isDismissible: false,
          enableDrag: false,
          useSafeArea: true,
          context: context,
          builder: (context) {
            return WebViewAware(
                child: Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: TakeFirstLessMobileWidget(),
            ));
          },
        );
      } else {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          isDismissible: false,
          enableDrag: false,
          context: context,
          builder: (context) {
            return WebViewAware(
                child: Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: TakeFirstLessWidget(),
            ));
          },
        );
      }
    }
  }
}

Future cert(
  BuildContext context, {
  CoursesRecord? course,
}) async {
  ApiCallResponse? apiResultsl12;

  apiResultsl12 = await CertCall.call(
    fio:
        '${currentUserDisplayName} ${valueOrDefault(currentUserDocument?.surname, '')}',
    kurs: course?.name,
    date: dateTimeFormat(
      'd/M/y',
      getCurrentTimestamp,
      locale: FFLocalizations.of(context).languageCode,
    ),
  );
  if ((apiResultsl12?.succeeded ?? true)) {
    await launchURL(CertCall.link(
      (apiResultsl12?.jsonBody ?? ''),
    ).toString());
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          (apiResultsl12?.statusCode ?? 200).toString(),
          style: GoogleFonts.getFont(
            'Inter',
            color: FlutterFlowTheme.of(context).primaryText,
            fontSize: 15.0,
          ),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: Color(0xFFEE8B60),
      ),
    );
  }
}

Future lessonCompleted(
  BuildContext context, {
  LessonsRecord? currentLesson,
  UsersRecord? userDoc,
  int? allLessonCount,
  int? lessonIndex,
}) async {
  if (allLessonCount == 0) {
    await userDoc!.reference.update({
      ...mapToFirestore(
        {
          'rl_finished_course_first_lesson':
              FieldValue.arrayUnion([currentLesson?.parentReference]),
          'rl_finished_lessons':
              FieldValue.arrayUnion([currentLesson?.reference]),
        },
      ),
    });
    FFAppState().update(() {});
  } else {
    if (allLessonCount == functions.increase(lessonIndex)) {
      if (currentLesson?.rlModules != null) {
        await userDoc!.reference.update({
          ...mapToFirestore(
            {
              'rl_finished_course_first_lesson':
                  FieldValue.arrayUnion([currentLesson?.parentReference]),
              'rl_finished_lessons':
                  FieldValue.arrayUnion([currentLesson?.reference]),
              'rl_finished_module':
                  FieldValue.arrayUnion([currentLesson?.rlModules]),
              'rl_start_module':
                  FieldValue.arrayUnion([currentLesson?.rlModules]),
            },
          ),
        });
      } else {
        await userDoc!.reference.update({
          ...mapToFirestore(
            {
              'rl_finished_course_first_lesson':
                  FieldValue.arrayUnion([currentLesson?.parentReference]),
              'rl_finished_lessons':
                  FieldValue.arrayUnion([currentLesson?.reference]),
            },
          ),
        });
      }

      FFAppState().update(() {});
    } else {
      if (currentLesson?.rlModules != null) {
        await userDoc!.reference.update({
          ...mapToFirestore(
            {
              'rl_finished_course_first_lesson':
                  FieldValue.arrayUnion([currentLesson?.parentReference]),
              'rl_finished_lessons':
                  FieldValue.arrayUnion([currentLesson?.reference]),
              'rl_start_module':
                  FieldValue.arrayUnion([currentLesson?.rlModules]),
            },
          ),
        });
      } else {
        await userDoc!.reference.update({
          ...mapToFirestore(
            {
              'rl_finished_course_first_lesson':
                  FieldValue.arrayUnion([currentLesson?.parentReference]),
              'rl_finished_lessons':
                  FieldValue.arrayUnion([currentLesson?.reference]),
            },
          ),
        });
      }

      FFAppState().update(() {});
    }
  }
}

Future sendHomework(
  BuildContext context, {
  LessonsRecord? currentLesson,
  UsersRecord? userDoc,
  int? allLessonCount,
  int? indexLesson,
  ChatsRecord? currentChat,
  required DocumentReference? currentTariff,
  required bool? freeCourse,
}) async {
  ChatsRecord? newChatUser;

  if (currentChat != null) {
    if (MediaQuery.sizeOf(context).width >= kBreakpointLarge) {
      await showAlignedDialog(
        barrierDismissible: false,
        context: context,
        isGlobal: true,
        avoidOverflow: false,
        targetAnchor:
            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
        followerAnchor:
            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
        builder: (dialogContext) {
          return Material(
            color: Colors.transparent,
            child: WebViewAware(
                child: HomeworkAddDesktopWidget(
              onlyPhoto: currentLesson!.withPhotoHomework,
              currentChat: currentChat,
            )),
          );
        },
      );
    } else {
      context.pushNamed(
        'HomeworkAdded',
        queryParameters: {
          'currentChat': serializeParam(
            currentChat,
            ParamType.Document,
          ),
          'photoOnly': serializeParam(
            currentLesson?.withPhotoHomework,
            ParamType.bool,
          ),
          'courseFree': serializeParam(
            freeCourse,
            ParamType.bool,
          ),
          'currentTariff': serializeParam(
            currentTariff,
            ParamType.DocumentReference,
          ),
        }.withoutNulls,
        extra: <String, dynamic>{
          'currentChat': currentChat,
          kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );
    }
  } else {
    var chatsRecordReference = ChatsRecord.collection.doc();
    await chatsRecordReference.set(createChatsRecordData(
      userClient: userDoc?.reference,
      userCurator: FFAppState().curatorChat,
      rlLesson: currentLesson?.reference,
      lastMessageTime: getCurrentTimestamp,
      lastMessage: '',
      countLessons: allLessonCount,
      indexLesson: indexLesson,
      isFinished: false,
    ));
    newChatUser = ChatsRecord.getDocumentFromData(
        createChatsRecordData(
          userClient: userDoc?.reference,
          userCurator: FFAppState().curatorChat,
          rlLesson: currentLesson?.reference,
          lastMessageTime: getCurrentTimestamp,
          lastMessage: '',
          countLessons: allLessonCount,
          indexLesson: indexLesson,
          isFinished: false,
        ),
        chatsRecordReference);
    await Future.delayed(const Duration(milliseconds: 300));
    if (MediaQuery.sizeOf(context).width >= kBreakpointLarge) {
      await showAlignedDialog(
        barrierDismissible: false,
        context: context,
        isGlobal: true,
        avoidOverflow: false,
        targetAnchor:
            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
        followerAnchor:
            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
        builder: (dialogContext) {
          return Material(
            color: Colors.transparent,
            child: WebViewAware(
                child: HomeworkAddDesktopWidget(
              onlyPhoto: currentLesson!.withPhotoHomework,
              currentChat: newChatUser,
            )),
          );
        },
      );
    } else {
      context.pushNamed(
        'HomeworkAdded',
        queryParameters: {
          'currentChat': serializeParam(
            newChatUser,
            ParamType.Document,
          ),
          'photoOnly': serializeParam(
            currentLesson?.withPhotoHomework,
            ParamType.bool,
          ),
          'courseFree': serializeParam(
            freeCourse,
            ParamType.bool,
          ),
          'currentTariff': serializeParam(
            currentTariff,
            ParamType.DocumentReference,
          ),
        }.withoutNulls,
        extra: <String, dynamic>{
          'currentChat': newChatUser,
          kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );
    }
  }
}

Future navigationForOpenLessonFree(
  BuildContext context, {
  required LessonsRecord? currentLesson,
  required int? indexInList,
  required UsersRecord? userDoc,
  required int? countLessons,
}) async {
  if (indexInList == 0) {
    context.pushNamed(
      'Lesson',
      queryParameters: {
        'currentLesson': serializeParam(
          currentLesson,
          ParamType.Document,
        ),
        'lessonIndex': serializeParam(
          indexInList,
          ParamType.int,
        ),
        'countLessons': serializeParam(
          countLessons,
          ParamType.int,
        ),
        'freeCourse': serializeParam(
          true,
          ParamType.bool,
        ),
      }.withoutNulls,
      extra: <String, dynamic>{
        'currentLesson': currentLesson,
        kTransitionInfoKey: TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.fade,
          duration: Duration(milliseconds: 0),
        ),
      },
    );
  } else {
    if (userDoc!.rlFinishedCourseFirstLesson
        .contains(currentLesson?.parentReference)) {
      context.pushNamed(
        'Lesson',
        queryParameters: {
          'currentLesson': serializeParam(
            currentLesson,
            ParamType.Document,
          ),
          'lessonIndex': serializeParam(
            indexInList,
            ParamType.int,
          ),
          'countLessons': serializeParam(
            countLessons,
            ParamType.int,
          ),
          'freeCourse': serializeParam(
            true,
            ParamType.bool,
          ),
        }.withoutNulls,
        extra: <String, dynamic>{
          'currentLesson': currentLesson,
          kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );
    } else {
      if (MediaQuery.sizeOf(context).width <= kBreakpointSmall) {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          isDismissible: false,
          enableDrag: false,
          useSafeArea: true,
          context: context,
          builder: (context) {
            return WebViewAware(
                child: Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: TakeFirstLessMobileWidget(),
            ));
          },
        );
      } else {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          isDismissible: false,
          enableDrag: false,
          context: context,
          builder: (context) {
            return WebViewAware(
                child: Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: TakeFirstLessWidget(),
            ));
          },
        );
      }
    }
  }
}
