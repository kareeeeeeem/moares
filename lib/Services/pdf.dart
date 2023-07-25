import 'dart:io';
import 'dart:math';

import 'package:document_file_save_plus/document_file_save_plus.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import '../Services/toast.dart';
import '../modules/solution.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import 'package:sqflite/utils/utils.dart';

pagePdf(name, wealth , List<String> type , List<double> money , List<double> percent)async{
final pdf = pw.Document();
var arabicFont = Font.ttf(await rootBundle.load("assets/fonts/HacenTunisia.ttf"));
pdf.addPage(pw.Page(
      theme: pw.ThemeData.withFont(
        base: arabicFont,
      ),
      pageFormat: type.length <18 ? PdfPageFormat.a4 : PdfPageFormat.a3,
      build: (pw.Context context) {
        return pw.Container(
            padding: pw.EdgeInsets.symmetric(horizontal:10),
            child: pw.Column(
              children: [
                pw.Padding(
                padding: pw.EdgeInsets.only(bottom: 20),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Text("بيان بتوزيع مواريث شخص متوفي", style: pw.TextStyle(fontSize: 16),textDirection: TextDirection.rtl)
                  ],
                )),
                pw.Divider(height: 30, color: PdfColor.fromHex("000000"),thickness: 2),
                pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                pw.Text("اسم المتوفي : $name", style: pw.TextStyle(fontSize: 16),textDirection: TextDirection.rtl),
                ],
                ),
                pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                 pw.Text("قيمة المبلغ : $wealth", style: pw.TextStyle(fontSize: 16),textDirection: TextDirection.rtl),
                ],
                ),
               
                pw.SizedBox(height: 15),
                pw.Text("توزيعة الميراث بعد حجب من لا يرث كالآتي", style: pw.TextStyle(fontSize: 16),textDirection: TextDirection.rtl),
                pw.Container(
                color: PdfColor.fromHex("#fff"),
                padding: pw.EdgeInsets.all(10.0),
                child: pw.Table(
                  border: pw.TableBorder.all(color: PdfColor.fromHex("#000")),
                  children: [
                    pw.TableRow(children: [
                      pw.Padding(
                      padding: pw.EdgeInsets.symmetric(horizontal:5),
                      child:pw.Text("قيمة المبلغ", style: pw.TextStyle(fontSize: 14),textDirection: TextDirection.rtl)),
                      pw.Padding(
                      padding: pw.EdgeInsets.symmetric(horizontal:5),
                      child:pw.Text("نسبة مئوية", style: pw.TextStyle(fontSize: 14),textDirection: TextDirection.rtl)),
                      pw.Padding(
                      padding: pw.EdgeInsets.symmetric(horizontal:5),
                      child:pw.Text("من يؤول له الميراث", style: pw.TextStyle(fontSize: 14),textDirection: TextDirection.rtl)),
                    ]),
                    for(int i=0;i<money.length;i++)...[ 
                      pw.TableRow(
                        
                      children: [
                      pw.Padding(
                      padding: pw.EdgeInsets.symmetric(horizontal:5),
                      child:pw.Text(money[i].toPrecision(2).toString(), style: pw.TextStyle(fontSize: 14),textDirection: TextDirection.rtl)),
                      pw.Padding(
                      padding: pw.EdgeInsets.symmetric(horizontal:5),
                      child:pw.Text("${(percent[i]*100).toPrecision(2)} %", style: pw.TextStyle(fontSize: 14),textDirection: TextDirection.rtl)),
                      pw.Padding(
                      padding: pw.EdgeInsets.symmetric(horizontal:5),
                      child:pw.Text(type[i], style: pw.TextStyle(fontSize: 14),textDirection: TextDirection.rtl)),
                    ]),
                    ]
                  ],
                ),
              ),
              pw.SizedBox(height: 15),
                pw.Padding(
                padding: pw.EdgeInsets.symmetric(horizontal: 30),
                child:pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                 pw.Container(
                 child: pw.Text("يعتمد", style: pw.TextStyle(fontSize: 16),textDirection: TextDirection.rtl)),
                 pw.Text("ختم", style: pw.TextStyle(fontSize: 16),textDirection: TextDirection.rtl),
                ],
                )),
                pw.SizedBox(height:8),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [
                  pw.Container(
                    width: 80,
                    height: 80,
                    decoration: pw.BoxDecoration(
                      borderRadius: pw.BorderRadius.circular(40),
                      border: pw.Border.all(color: PdfColor.fromHex("#000"),width: 3)
                    )
                  )
                 ])
              ]
            ),
        );
      }));

final directory = await getExternalStorageDirectory();
final file = File("${directory?.path}/example.pdf");


final pdfBytes = await pdf.save();


await file.writeAsBytes(pdfBytes.toList()).then((value)async{
await FirebaseStorage.instance.ref("pdfs").child(Random().nextInt(100000000).toString()).putFile(value);
});


DocumentFileSavePlus().saveMultipleFiles(
  dataList: [pdfBytes,],
  fileNameList: ["توزيع ميراث $name.pdf",],
  mimeTypeList: ["توزيع ميراث $name/pdf",],
);
  toast("Saved Success");
}