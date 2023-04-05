import 'package:flutter/material.dart';
import 'package:tenantmodule/constants/app_theme.dart';
import '../services/invoice_pdf_service.dart';
import '../models/invoice.dart';
// import '../widgets/invoice_pdf_page.dart';
import 'invoice_payment_screen.dart';
import '../widgets/invoice_detail_card.dart';

class InvoiceDetailsScreen extends StatelessWidget {
  const InvoiceDetailsScreen({Key? key}) : super(key: key);

  static const routeName = '/invoice-details';

  _createInvoicePDF(Invoice invoiceData) async {
    final pdfFile = await InvoicePDFService.generate(invoiceData);
    InvoicePDFService.openFile(pdfFile);
  }

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final invoiceData = routeArguments['invoiceData'] as Invoice;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice Details'),
        actions: [
          IconButton(
            onPressed: () => _createInvoicePDF(invoiceData),
            icon: const Icon(Icons.download_for_offline_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              InvoiceDetailsGridView(invoiceData: invoiceData),
              Card(
                color: kPrimaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        'Invoice Message',
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        invoiceData.invoiceMessage!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 65,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Pay for this invoice',
        onPressed: () {
          Navigator.pushNamed(context, InvoicePaymentScreen.routeName,
              arguments: {
                'invoiceNumber': invoiceData.invoiceNumber,
                'amount': invoiceData.totalPayable
              });
        },
        child: const Text(
          'Pay',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: .1,
          ),
        ),
      ),
    );
  }
}

class InvoiceDetailsGridView extends StatelessWidget {
  const InvoiceDetailsGridView({Key? key, required this.invoiceData})
      : super(key: key);

  final Invoice invoiceData;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> invoiceGridData = [
      {
        'detailTitle': 'Invoice ID',
        'detailContent': '${invoiceData.invoiceID}',
        'detailIcon': Icons.numbers_rounded
      },
      {
        'detailTitle': 'Invoice Number',
        'detailContent': '${invoiceData.invoiceNumber}',
        'detailIcon': Icons.numbers_rounded
      },
      // {
      //   'detailTitle': 'Unit Code',
      //   'detailContent': '${invoiceData.unitCode}',
      //   'detailIcon': Icons.home_rounded
      // },
      {
        'detailTitle': 'Invoice Date',
        'detailContent': invoiceData.invoiceDate!.join("-"),
        'detailIcon': Icons.date_range_rounded
      },
      {
        'detailTitle': 'Invoice Amount',
        'detailContent': 'Ksh ${invoiceData.invoiceAmount}',
        'detailIcon': Icons.attach_money_rounded
      },
      {
        'detailTitle': 'Monthly Rent',
        'detailContent': 'Ksh ${invoiceData.monthlyRent}',
        'detailIcon': Icons.attach_money_rounded,
      },
      // {
      //   'detailTitle': 'Payable Rent',
      //   'detailContent': 'Ksh ${invoiceData.rentPayable}',
      //   'detailIcon': Icons.attach_money_rounded
      // },
      {
        'detailTitle': 'Monthly Rent',
        'detailContent': 'Ksh ${invoiceData.monthlyRent}',
        'detailIcon': Icons.attach_money_rounded
      },
      {
        'detailTitle': 'Last Reading',
        'detailContent': '${invoiceData.lastReading}',
        'detailIcon': Icons.water_drop_outlined
      },
      {
        'detailTitle': 'Current Reading',
        'detailContent': '${invoiceData.currentReading}',
        'detailIcon': Icons.water_drop_outlined
      },
      {
        'detailTitle': 'Units used',
        'detailContent': '${invoiceData.unitsUsed}',
        'detailIcon': Icons.water_drop_outlined
      },
      {
        'detailTitle': 'Water cost payable',
        'detailContent': '${invoiceData.waterCostPayable}',
        'detailIcon': Icons.water_drop_outlined
      },
      {
        'detailTitle': 'Water cost per unit',
        'detailContent': '${invoiceData.waterCostPerUnit}',
        'detailIcon': Icons.water_drop_outlined
      },
      {
        'detailTitle': 'Current water cost',
        'detailContent': '${invoiceData.currentWaterCost}',
        'detailIcon': Icons.water_drop_outlined
      },
    ];

    return GridView.count(
        shrinkWrap: true,
        controller: ScrollController(),
        crossAxisCount: 2,
        children: invoiceGridData
            .map(
              (detailItem) => InvoiceDetailCard(
                detailTitle: detailItem['detailTitle'],
                detailContent: detailItem['detailContent'],
                detailIcon: detailItem['detailIcon'],
              ),
            )
            .toList());
  }
}
