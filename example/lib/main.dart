import 'package:flutter/material.dart';
import 'package:open_pdf/open_pdf.dart';

void main() {
  runApp(OpenPdfPage());
}

class OpenPdfPage extends StatelessWidget {
  final _openPdf = OpenPdf();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
          body: FutureBuilder<Widget>(
              future: _openPdf.openPDF('assets/tt.pdf'),
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.waiting) return Container();
                return snap.data!;
              }),
        )));
  }
}
