import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:path_provider/path_provider.dart';

// Change this to fit the PDF file you are using to test.

class PDFS extends StatefulWidget {

  @override
  _PDFSState createState() => _PDFSState();
}

class _PDFSState extends State<PDFS> {
  bool _isLoad = false, _isInit = true;
  PDFDocument document;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: Center(
            child: _isInit ? Text('Press Button') : _isLoad ? Center(child: CircularProgressIndicator(),) : PDFViewer(document: document),
          )),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(child: MaterialButton(
                child: Text('ASSETS'),
                  onPressed: (){
                  loadFromAssets();
                  },
              ),)
            ],
          )
        ],
      ),
    );
  }

   loadFromAssets() async {
    setState(() {
      _isInit = false;
      _isLoad = true;
    });
    document = await PDFDocument.fromAsset("assets/CODE-EX_FindYourStore_Ver-1.pdf");
    setState(() {
      _isLoad = false;
    });
   }
}