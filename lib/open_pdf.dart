import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'open_pdf_platform_interface.dart';

class OpenPdf {
  Future<String?> getPlatformVersion() async {
    return OpenPdfPlatform.instance.getPlatformVersion();
  }

  Future<Widget> openPDF(String? path) async {
    try {
      final isAssets = path!.contains("assets/");
      final document = isAssets ? PdfDocument.openAsset(path) : PdfDocument.openFile(path);
      PdfController pdfController = PdfController(document: document);
      return PdfView(
        controller: pdfController,
      );
    } catch (e) {
      return const Material(
        child: Center(
          child: Text("Cannot open pdf file", style: TextStyle(color: Colors.red, fontSize: 20)),
        ),
      );
    }
  }
}
