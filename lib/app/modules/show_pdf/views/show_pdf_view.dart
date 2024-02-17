import 'package:flutter/material.dart';
import 'package:student/app/global_widget/static/background_simple.dart';

import 'package:get/get.dart';
import 'package:printing/printing.dart';

import '../controllers/show_pdf_controller.dart';

class ShowPdfView extends GetView<ShowPdfController> {
  const ShowPdfView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundSimple(
        titleText: 'Converted PDF'.tr,
        child: PdfPreview(
          useActions: true,
          scrollViewDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          padding: EdgeInsets.zero,
          pdfPreviewPageDecoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  width: 0.4,
                  color: Colors.grey
              )
          ),
          build: (format) async => controller.data,
        ),
      ),
    );
  }
}
