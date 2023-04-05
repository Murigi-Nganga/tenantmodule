import 'dart:io';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../models/invoice.dart';

class InvoicePDFService {
  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();
    final directory = await getExternalStorageDirectory(); //* For Android only
    final file = File('${directory!.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    await OpenFile.open(file.path);
  }

  static Future<File> generate(Invoice invoice) async {
    final pdf = Document(
        author: 'Smart Real Estate',
        creator: 'Smart Real Estate',
        subject: 'Invoice');
    pdf.addPage(
      MultiPage(
        pageTheme: PageTheme(theme: ThemeData.withFont(base: Font.times())),
        build: (context) => [
          buildPDFHeader(invoice),
          buildPDFBody(invoice),
        ],
        footer: (context) => Text(
          'Created on ${DateFormat.yMMMMEEEEd().format(DateTime.now())}',
        ),
      ),
    );

    return saveDocument(name: '${invoice.invoiceNumber}.pdf', pdf: pdf);
  }

  static Widget buildPDFHeader(Invoice invoice) => Column(
        children: [
          Text(
            'Smart Real Estate',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: PdfColor.fromHex('#339966'),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Monthly Invoice : ID ${invoice.invoiceID}',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: const PdfColor(0, .4, .8),
            ),
          ),
          SizedBox(height: 10),
          Divider(
            color: const PdfColor(0, .6, .6),
            thickness: 2,
          ),
        ],
      );

  static Widget buildPDFBody(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
            'Tenant Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Text('Unit Code: ${invoice.unitCode}'),
          //TODO: Dynamic number !!
          Text(
            'Tel: 0700 000 000',
            style: const TextStyle(
              fontSize: 17.5,
            ),
          ),
          Text(
            'Email: user@gmail.com',
            style: const TextStyle(
              fontSize: 17.5,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            child: Text(
              'Invoice Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            'Invoice Date: '
            '${DateFormat.yMMMMd().format(DateTime(
              invoice.invoiceDate![0],
              invoice.invoiceDate![1],
              invoice.invoiceDate![2],
            ))}',
            style: const TextStyle(
              fontSize: 17.5,
            ),
          ),
          Text(
            'Water Cost Per Unit: Ksh ${invoice.waterCostPerUnit!.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 17.5,
            ),
          ),
          Text(
            'Units used: ${invoice.unitsUsed!.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 17.5,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: PdfColor.fromHex('#E6F7FF'),
            ),
            child: Table(
              children: [
                TableRow(children: [
                  Text(
                    'Current water cost',
                    style: const TextStyle(
                      fontSize: 17.5,
                    ),
                  ),
                  Text(
                    'Ksh ${invoice.currentWaterCost!.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 17.5,
                    ),
                  ),
                ]),
                TableRow(
                  children: [
                    Text(
                      'Monthly rent',
                      style: const TextStyle(
                        fontSize: 17.5,
                      ),
                    ),
                    Text(
                      'Ksh ${invoice.monthlyRent!.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 17.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Divider(
            color: const PdfColor(0, .6, .6),
            thickness: 2,
          ),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Total: Ksh: ${invoice.invoiceAmount!.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 19,
                color: const PdfColor(.8, .3, .6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Align(
            child: Text(
              'Invoice Message',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            invoice.invoiceMessage!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17.5,
            ),
          ),
        ],
      );
}
