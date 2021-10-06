import 'package:flutter/material.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

class PdfViewerPage extends StatelessWidget {
  final String path;
  const PdfViewerPage({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PdfView(path: path);
  }
}
