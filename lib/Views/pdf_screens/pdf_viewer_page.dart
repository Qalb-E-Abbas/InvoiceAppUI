import 'package:flutter/material.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:share_plus/share_plus.dart';

class PdfViewerPage extends StatelessWidget {
  final String path;

  const PdfViewerPage({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfView(path: path),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Share.shareFiles([path], text: 'Invoice Details');
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.share),
      ),
    );
  }
}
