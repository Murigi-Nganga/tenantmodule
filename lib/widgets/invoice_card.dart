import 'package:flutter/material.dart';

import '../models/invoice.dart';
import '../screens/invoice_details_screen.dart';

class InvoiceCard extends StatelessWidget {
  const InvoiceCard({Key? key, required this.invoice}) : super(key: key);

  final Invoice invoice;

  @override
  Widget build(BuildContext context) => Card(
          child: ListTile(
        leading: const Icon(Icons.receipt_rounded),
        title: Text('Ksh ${invoice.totalPayable}'),
        subtitle: Text(invoice.invoiceDate!.join("-")),
        trailing: Text('${invoice.invoiceStatus}'),
        onTap: () {
          Navigator.pushNamed(context, InvoiceDetailsScreen.routeName,
              arguments: {'invoiceData': invoice});
        },
      ));
}
