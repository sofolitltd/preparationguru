import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewPdf extends StatefulWidget {
  final String title;
  final String pdfUrl;

  const ViewPdf({
    super.key,
    required this.title,
    required this.pdfUrl,
  });

  @override
  _ViewPdfState createState() => _ViewPdfState();
}

class _ViewPdfState extends State<ViewPdf> {
  late PdfViewerController _pdfViewerController;

  @override
  void initState() {
    super.initState();
    //
    _pdfViewerController = PdfViewerController();
  }

  @override
  void dispose() {
    _pdfViewerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: SfPdfViewer.network(
        // widget.pdfUrl,
        'https://firebasestorage.googleapis.com/v0/b/preparation-guru.appspot.com/o/eti%20-declaration.pdf?alt=media&token=b46d1852-2ef6-4d48-8a92-7502b2b048d6',
        controller: _pdfViewerController,
      ),
    );
  }
}
