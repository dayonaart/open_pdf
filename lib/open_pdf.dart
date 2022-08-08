import 'dart:io';
import 'package:advance_pdf_viewer_fork/advance_pdf_viewer_fork.dart';
import 'package:flutter/material.dart';
import 'package:open_pdf/ios_view.dart';
import 'open_pdf_platform_interface.dart';

class OpenPdf {
  Future<String?> getPlatformVersion() async {
    return OpenPdfPlatform.instance.getPlatformVersion();
  }

  Future<Widget> open(String? path) async {
    // var d = await OpenPdfPlatform.instance.open(path);
    // print(d);
    // try {
    //   final isAssets = path!.contains("assets/");
    //   final document = isAssets ? PdfDocument.openAsset(path) : PdfDocument.openFile(path);
    //   PdfController pdfController = PdfController(document: document);
    //   return PdfView(
    //     controller: pdfController,
    //   );
    // } catch (e) {
    //   print(e);
    //   return const Material(
    //     child: Center(
    //       child: Text("Cannot open pdf file", style: TextStyle(color: Colors.red, fontSize: 20)),
    //     ),
    //   );
    // }
    return const TogetherWidget();
  }

  Future<Widget> openAssets({@required String? path}) async {
    try {
      PDFDocument doc = await PDFDocument.fromAsset(path!);
      return PDFViewer(document: doc);
    } catch (e) {
      return Text('$e');
    }
  }

  Future<Widget> openFile({@required File? file}) async {
    try {
      PDFDocument doc = await PDFDocument.fromFile(file!);
      return PDFViewer(document: doc);
    } catch (e) {
      return Text('$e');
    }
  }

  Future<Widget> openFromUrl({@required String? url}) async {
    try {
      PDFDocument doc = await PDFDocument.fromURL(url!);
      return PDFViewer(document: doc);
    } catch (e) {
      return Text('$e');
    }
  }
}
