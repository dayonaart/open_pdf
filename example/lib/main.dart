import 'package:advance_pdf_viewer_fork/advance_pdf_viewer_fork.dart';
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
          body: Center(
            child: FutureBuilder<Widget>(
                future: _openPdf.openAssets(path: 'assets/test.pdf'),
                builder: (context, snap) {
                  if (snap.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(
                      color: Colors.orange,
                    );
                  } else {
                    return snap.data ?? Container();
                  }
                }),
          ),
        )));
  }
}
