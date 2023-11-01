import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

bool checkTwoStringIsEmpty(
  String? string1,
  String? string2,
) {
  if (string1 != null && string2 != null && string1 != "" && string2 != "") {
    return true;
  } else {
    return false;
  }

  // Add your function code here!
}

bool checkThreeStringIsEmpty(
  String? string1,
  String? string2,
  String? string3,
) {
  if (string1 != null &&
      string2 != null &&
      string1 != "" &&
      string2 != "" &&
      string3 != null &&
      string3 != "") {
    return true;
  } else {
    return false;
  }

  // Add your function code here!
}

String? dateOnRussian(DateTime? date) {
  if (date != null) {
    var formatter = DateFormat.yMMMMd("ru_RU");
    String formatted = formatter.format(date);
    return formatted;
  } else {
    return null;
  }
}

bool checkReferenceCourseIsNull(DocumentReference? courseReferense) {
  if (courseReferense != null) {
    return true;
  } else {
    return false;
  }
}

bool checkTreeStringIsEmptyAny(
  String? string1,
  String? string2,
  String? rlTeacher,
) {
  if (string1 != "" && string1 != null ||
      string2 != "" && string2 != null ||
      rlTeacher != null && rlTeacher != '') {
    return true;
  } else {
    return false;
  }
}

int countThreeString(
  String? string1,
  String? string2,
  String? rlTeacher,
) {
  int a = 0;
  int b = 0;
  int c = 0;
  if (string1 != null && string1 != "") {
    a = 1;
  }
  if (string2 != null && string2 != "") {
    b = 1;
  }
  if (rlTeacher != null && rlTeacher != '') {
    c = 1;
  }
  return a + b + c;
}

int increase(int? number) {
  // Add your function code here!
  if (number != null) {
    return number + 1;
  } else {
    return 0;
  }
}

bool checkOneString(DocumentReference? rlCourse) {
  // Add your function code here!
  if (rlCourse != null) {
    return true;
  } else {
    return false;
  }
}

String dateToRussian(DateTime? date) {
  if (date != null) {
    var formatterday = DateFormat.d("ru_RU");
    String formattedday = formatterday.format(date);
    var formattermonth = DateFormat.MMMM("ru_RU");
    String formattedmonth = formattermonth.format(date);
    var formatteryear = DateFormat.y("ru_RU");
    String formattedyear = formatteryear.format(date);
    return formattedday + ' ' + formattedmonth;
  } else {
    return "Нет даты";
  }
}

String rlTEacherToString(DocumentReference rlTeacher) {
  // Add your function code here!
  return rlTeacher.toString();
}

String mainYeastFunction(
  int mainYeast,
  int mainWeight,
  int wantYeast,
) {
  if (mainYeast == 0 && wantYeast == 1) {
    return ((mainWeight * 0.4).round()).toString();
  } else if (mainYeast == 0 && wantYeast == 2) {
    return ((mainWeight * 0.33).round()).toString();
  } else if (mainYeast == 1 && wantYeast == 0) {
    return ((mainWeight * 2.5).round()).toString();
  } else if (mainYeast == 1 && wantYeast == 2) {
    return ((mainWeight * 0.36).round()).toString();
  } else if (mainYeast == 2 && wantYeast == 0) {
    return ((mainWeight * 3.03).round()).toString();
  } else if (mainYeast == 2 && wantYeast == 1) {
    return ((mainWeight * 2.78).round()).toString();
  } else
    return mainWeight.toString();
}

String mainMussFunction(
  int mainMuss,
  int wantMuss,
) {
  return ((wantMuss / mainMuss).toStringAsFixed(2)).toString();
}

List<KnowledgeBaseRecord>? randomKnowledgeBase(
    List<KnowledgeBaseRecord> knowledgeBaseOld) {
  if (knowledgeBaseOld != null) {
    knowledgeBaseOld.shuffle();

    return [knowledgeBaseOld[0], knowledgeBaseOld[1]];
  } else {
    knowledgeBaseOld = [];
    return knowledgeBaseOld;
  }
}

List<DocumentReference> userReferenceToList(DocumentReference user) {
  List<DocumentReference> users = [];
  users.add(user);
  return users;
}

bool returnTrueIfStringContainStringSearch(
  String? stringBase,
  String? stringForSearch,
) {
  if (stringBase!.toLowerCase().contains(stringForSearch!.toLowerCase())) {
    return true;
  } else {
    return false;
  }
}

String returnStringToUpperCase(String stringAny) {
  return stringAny.toUpperCase();
}

List<String> reverseStringList(List<String>? stringList) {
  if (stringList != null) {
    return stringList.reversed.toList();
  } else {
    return [];
  }
}

String mainBisquitFunction(
  int mainForm,
  int wantForm,
  int? mainD,
  int? mainW,
  int? mainH,
  int? wantD,
  int? wantW,
  int? wantH,
) {
  if (mainForm == 0 && wantForm == 0) {
    int a = (mainD ?? 0) * (mainD ?? 0);
    int b = (wantD ?? 0) * (wantD ?? 0);
    return ((b / a).toStringAsFixed(2)).toString();
  } else if (mainForm == 1 && wantForm == 1) {
    int a = (mainW ?? 0) * (mainH ?? 0);
    int b = (wantW ?? 0) * (wantH ?? 0);
    return (double.parse((b / a).toStringAsFixed(2))).toString();
  } else if (mainForm == 0 && wantForm == 1) {
    double a = (((mainD ?? 0) / 2) * ((mainD ?? 0) / 2)) * 3.14;
    int b = (wantW ?? 0) * (wantH ?? 0);
    return (double.parse((b / a).toStringAsFixed(2))).toString();
  } else if (mainForm == 1 && wantForm == 0) {
    int a = (mainW ?? 0) * (mainH ?? 0);
    double b = (((wantD ?? 0) / 2) * ((wantD ?? 0) / 2)) * 3.14;
    return (double.parse((b / a).toStringAsFixed(2))).toString();
  }

  return 0.toString();
}

String? mainGelatinFunction(
  double mainCount,
  int mainGramm,
  double wantCount,
) {
  if ((mainCount == 120 || mainCount == 140) &&
      (wantCount == 160 || wantCount == 180)) {
    return (mainGramm * 0.94).toStringAsFixed(2);
  } else if ((mainCount == 120 || mainCount == 140) &&
      (wantCount == 200 || wantCount == 220)) {
    return (mainGramm * 0.84).toStringAsFixed(2);
  } else if ((mainCount == 120 || mainCount == 140) && (wantCount == 240)) {
    return (mainGramm * 0.75).toStringAsFixed(2);
  } else if ((mainCount == 160 || mainCount == 180) &&
      (wantCount == 120 || wantCount == 140)) {
    return (mainGramm * 1.07).toStringAsFixed(2);
  } else if ((mainCount == 160 || mainCount == 180) &&
      (wantCount == 200 || wantCount == 220)) {
    return (mainGramm * 0.89).toStringAsFixed(2);
  } else if ((mainCount == 160 || mainCount == 180) && (wantCount == 240)) {
    return (mainGramm * 0.8).toStringAsFixed(2);
  } else if ((mainCount == 200 || mainCount == 220) &&
      (wantCount == 120 || wantCount == 140)) {
    return (mainGramm * 1.2).toStringAsFixed(2);
  } else if ((mainCount == 200 || mainCount == 220) &&
      (wantCount == 160 || wantCount == 180)) {
    return (mainGramm * 1.12).toStringAsFixed(2);
  } else if ((mainCount == 200 || mainCount == 220) && (wantCount == 240)) {
    return (mainGramm * 0.89).toStringAsFixed(2);
  } else if ((mainCount == 240) && (wantCount == 120 || wantCount == 140)) {
    return (mainGramm * 1.34).toStringAsFixed(2);
  } else if ((mainCount == 240) && (wantCount == 160 || wantCount == 180)) {
    return (mainGramm * 1.25).toStringAsFixed(2);
  } else if ((mainCount == 240) && (wantCount == 200 || wantCount == 220)) {
    return (mainGramm * 1.12).toStringAsFixed(2);
  } else {
    return mainGramm.toStringAsFixed(2);
  }
}

String separateThreeSymbols(int number) {
  final String string = number.toStringAsFixed(0);
  final RegExp regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  return string.replaceAllMapped(regex, (Match match) => '${match[1]} ').trim();
}

DateTime? returnDiffInDaysUserCreate(UsersRecord user) {
  return user.createdTime;
}

DateTime addSomeDaysToDate(
  DateTime date,
  int days,
) {
  return date.add(Duration(days: days));
}

int sum(List<int> allPrice) {
  int sum = 0;
  for (int price in allPrice) {
    sum += price;
  }
  return sum;
}

List<String> imageList(List<LessonsContentRecord> allLessonContent) {
  List<String> result = [];
  for (var lessonContent in allLessonContent) {
    result.addAll(lessonContent.imageL);
  }
  return result;
}

List<DocumentReference> listFreeAndPaidCourses(
  DocumentReference freeCourses,
  List<DocumentReference> paidCourse,
) {
  // объединить freeCourses и paidCourses в один лист
  List<DocumentReference> allCourses = [freeCourses, ...paidCourse];
  return allCourses;
}
