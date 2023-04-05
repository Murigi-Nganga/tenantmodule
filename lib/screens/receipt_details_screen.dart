import 'package:flutter/material.dart';
import 'package:tenantmodule/constants/app_theme.dart';

class ReceiptDetailsScreen extends StatelessWidget {
  const ReceiptDetailsScreen({Key? key}) : super(key: key);

  static const routeName = 'receipt-details-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Receipt Details'),
          actions: [
            PopupMenuButton(
                color: kSecondaryColorDark,
                padding: const EdgeInsets.all(0.0),
                itemBuilder: (context) => [
                      PopupMenuItem(
                          child: InkWell(
                              child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(
                            Icons.download,
                          ),
                          Text(
                            'Download',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )))
                    ])
          ],
        ),
        body: const Center(child: Text('This is the receipts details screen')));
  }
}
