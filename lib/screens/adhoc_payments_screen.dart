import 'package:flutter/material.dart';
import 'tabs/rent_payment_tab.dart';
import 'tabs/utility_payment_tab.dart';
import '../widgets/side_drawer.dart';

class AdhocPaymentsScreen extends StatefulWidget {
  const AdhocPaymentsScreen({Key? key}) : super(key: key);

  static const routeName = '/adhoc-payments';

  @override
  State<AdhocPaymentsScreen> createState() => _AdhocPaymentsScreenState();
}

class _AdhocPaymentsScreenState extends State<AdhocPaymentsScreen> {
  List<DropdownMenuItem<String>> unitItems = const [
    DropdownMenuItem(
      value: "Unit One",
      child: Text(
        "Unit One",
      ),
    ),
    DropdownMenuItem(
      value: "Unit Two",
      child: Text(
        "Unit Two",
      ),
    ),
  ];

  List<DropdownMenuItem<String>> paymentOptions = const [
    DropdownMenuItem(
      value: "M-Pesa",
      child: Text(
        "M-Pesa",
      ),
    ),
    DropdownMenuItem(
      value: "Airtel Money",
      child: Text(
        "Airtel Money",
      ),
    ),
  ];

  void _showCustomDialog(message) => showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text(
            'Info',
            textAlign: TextAlign.center,
          ),
          content: Text(
            message,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Align(
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              ),
            ),
          ],
        );
      });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const SideDrawer(),
        appBar: AppBar(
          title: const Text(
            'Payments',
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Rent',
              ),
              Tab(
                text: 'Utilities',
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TabBarView(
            children: [
              RentPaymentTab(
                unitItems: unitItems,
                paymentOptions: paymentOptions,
                showCustomDialog: _showCustomDialog,
              ),
              UtilityPaymentTab(
                unitItems: unitItems,
                paymentOptions: paymentOptions,
                showCustomDialog: _showCustomDialog,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
