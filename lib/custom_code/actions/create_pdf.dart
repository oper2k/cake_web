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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'package:universal_html/html.dart' as html;
import 'package:open_file/open_file.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:translit/translit.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

Future<FFUploadedFile> createPdf(
    BuildContext context, String name, String date, String course) async {
  final pdf = pw.Document();

  final imageBytes1 = await rootBundle.load('assets/images/img_01.png');
  final image1 = pw.MemoryImage(imageBytes1.buffer.asUint8List());
  final imageBytes2 = await rootBundle.load('assets/images/img_03.png');
  final image2 = pw.MemoryImage(imageBytes2.buffer.asUint8List());
  final fontData = await rootBundle.load('assets/fonts/Roboto-Light.ttf');
  final robotoLight = pw.Font.ttf(fontData);

  List<Offset> positions = [
    Offset(393, 101),
    Offset(393, 183),
    Offset(393, 216)
  ];

  pw.PageTheme pageTheme1 = _buildPageTheme(image1);
  pw.PageTheme pageTheme2 = _buildPageTheme(image2);

  pdf.addPage(
      _buildPage(positions, [course, name, date], pageTheme1, robotoLight));

  pdf.addPage(_buildPage(
      positions,
      [
        Translit().toTranslit(source: course),
        Translit().toTranslit(source: name),
        date
      ],
      pageTheme2,
      robotoLight));

  Uint8List pdfBytes = await pdf.save();
  if (!isWeb) {
    String filePath = await savePdf(pdfBytes, 'Certificate_$name');
    return FFUploadedFile(name: filePath, bytes: pdfBytes);
  } else {
    final blob = html.Blob([pdfBytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', 'Certificate_$name.pdf')
      ..click();
    html.Url.revokeObjectUrl(url);
    return FFUploadedFile(name: 'Certificate_$name.pdf', bytes: pdfBytes);
  }
}

pw.PageTheme _buildPageTheme(pw.MemoryImage image) {
  return pw.PageTheme(
    pageFormat: PdfPageFormat.a4,
    orientation: pw.PageOrientation.landscape,
    buildBackground: (context) => pw.FullPage(
      ignoreMargins: true,
      child: pw.Image(image, fit: pw.BoxFit.cover),
    ),
  );
}

pw.Page _buildPage(List<Offset> positions, List<String> texts,
    pw.PageTheme pageTheme, pw.Font font) {
  return pw.Page(
    pageTheme: pageTheme,
    build: (context) => pw.Stack(
      children: [
        for (int i = 0; i < positions.length; i++)
          pw.Positioned(
            left: positions[i].dx,
            top: positions[i].dy,
            child: pw.Text(
              texts[i],
              style: pw.TextStyle(font: font),
            ),
          ),
      ],
    ),
  );
}

Future<String> savePdf(Uint8List pdfBytes, String fileName) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/$fileName.pdf');
  await file.writeAsBytes(pdfBytes);
  await OpenFile.open(file.path);
  return file.path;
}
