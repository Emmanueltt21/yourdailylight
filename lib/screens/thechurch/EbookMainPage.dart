import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class EbookMainPage extends StatefulWidget {
  //const EbookMainPage({Key? key}) : super(key: key);
  String? bookTitle, bookLink;
  EbookMainPage(this.bookTitle, this.bookLink);

  @override
  State<EbookMainPage> createState() => _EbookMainPageState();
}

class _EbookMainPageState extends State<EbookMainPage> {
  late PdfViewerController _pdfViewerController;

  @override
  void initState() {
    // TODO: implement initState
    _pdfViewerController = PdfViewerController();
    initData();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _pdfViewerController.dispose();
    super.dispose();
  }

 void initData (){
    print('BOOKURL ----->> ${widget.bookLink}}');
    print('BOOK_TITLE ----->> ${widget.bookTitle}}');
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 60.0,
        title: Text('Book Reader'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_up,
              color: Colors.white,
            ),
            onPressed: () {
              _pdfViewerController.previousPage();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
            onPressed: () {
              _pdfViewerController.nextPage();
            },
          )
        ],
      ),
      body: SfPdfViewer.network(
          '${widget.bookLink}',
          enableDoubleTapZooming: false,
        controller: _pdfViewerController,
      ),
    );
  }
}
