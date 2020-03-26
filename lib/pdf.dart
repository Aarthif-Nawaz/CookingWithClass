import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

// Change this to fit the PDF file you are using to test.

class PDF extends StatefulWidget {

  @override
  _PDFState createState() => _PDFState();
}

class _PDFState extends State<PDF> {
   String _documentPath = 'E:/Development/Flutter/CookingWithClass/assets/CODE-EX_FindYourStore_Ver-1.pdf';
  // This moves the PDF file from the assets to a place accessible by our PDF viewer.
  Future<String> prepareTestPdf() async {
    final ByteData bytes = await DefaultAssetBundle.of(context).load(_documentPath);
    final Uint8List list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}/$_documentPath';

    final file = await File(tempDocumentPath).create(recursive: true);
    file.writeAsBytesSync(list);
    return tempDocumentPath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Opening a PDF"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => () => {
    // We need to prepare the test PDF, and then we can display the PDF.
                prepareTestPdf().then((path) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FullPdfViewerScreen(path)),);})},
              child: const Text('Open PDF with full_pdf_viewer'),
            ),
          ],
        ),
      ),
    );
  }
}
class FullPdfViewerScreen extends StatelessWidget {
  final String pdfPath;

  FullPdfViewerScreen(this.pdfPath);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text("Document"),
        ),
        path: pdfPath);
  }
}