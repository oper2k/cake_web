// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:html' as html;
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show rootBundle;

Future<void> generateSertificat() async {
  // Создаем новый PDF документ
  final pdf = pw.Document();

  // Загрузка изображения шаблона сертификата
  Future<pw.MemoryImage> _loadImage() async {
    final byteData = await rootBundle.load('images/cert.png');
    return pw.MemoryImage(byteData.buffer.asUint8List());
  }

  final image = await _loadImage();
  // Данные для вставки в сертификат
  final data = {
    "Name": "Sergey Gorelov",
    "Course": "Pirozki",
    "Prepod": "Ilya",
    "Date": "12"
  };

  // Позиции для текста
  final positions = {
    "Name": [100.0, 500.0],
    "Course": [100.0, 550.0],
    "Prepod": [100.0, 600.0],
    "Date": [100.0, 650.0]
  };

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Stack(
          children: [
            pw.Image(image), // Отображение изображения шаблона
            // Добавление текста
            ...data.entries.map(
              (entry) {
                final position = positions[entry.key]!;
                return pw.Positioned(
                  left: position[0],
                  top: position[1],
                  child: pw.Text(entry.value),
                );
              },
            ),
          ],
        );
      },
    ),
  );

  // Преобразуем PDF в Uint8List
  final bytes = await pdf.save();

  // Создаем Blob из данных PDF
  final blob = html.Blob([bytes], 'application/pdf');

  // Инициируем скачивание файла
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.AnchorElement(href: url)
    ..setAttribute("download", "example.pdf")
    ..click();
  html.Url.revokeObjectUrl(url);
}
