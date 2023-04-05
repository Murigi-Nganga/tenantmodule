import 'package:flutter/material.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:provider/provider.dart';
import 'package:tenantmodule/screens/invoices_screen.dart';
import 'package:tenantmodule/services/payments_service.dart';

class InvoicePaymentScreen extends StatefulWidget {
  const InvoicePaymentScreen({Key? key}) : super(key: key);

  static const routeName = '/invoice-payment';

  @override
  State<InvoicePaymentScreen> createState() => _InvoicePaymentScreenState();
}

class _InvoicePaymentScreenState extends State<InvoicePaymentScreen> {
  String? paymentMode;
  final phoneNumberController = TextEditingController();
  final _invoiceFormKey = GlobalKey<FormState>();
  late PaymentsProvider _paymentsProv;

  List<DropdownMenuItem<String>> get paymentItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "M-Pesa",
          child: Text(
            "M-Pesa",
          )),
      const DropdownMenuItem(
          value: "Airtel Money", child: Text("Airtel Money")),
    ];
    return menuItems;
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      _paymentsProv = Provider.of<PaymentsProvider>(context, listen: false);
    });
  }

  _initiateInvoicePaymentRequest(String invoiceNumber, String phoneNumber) {
    if (_invoiceFormKey.currentState!.validate()) {
      if (paymentMode == 'M-Pesa') {
        _paymentsProv
            .processMpesaInvoicePayment(invoiceNumber, phoneNumber)
            .then((responseMessage) async {
          await showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Align(child: Text('Info')),
              content: Text(
                responseMessage,
                textAlign: TextAlign.center,
              ),
              actions: [
                Align(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text('Ok'),
                  ),
                ),
              ],
            ),
          );

          if (!mounted) return;
          Navigator.popUntil(
              context, ModalRoute.withName(InvoicesScreen.routeName));
        });
      } else {
        //TODO: Process Airtel Money Transaction Request
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final amount = routeArguments['amount'];
    final invoiceNumber = routeArguments['invoiceNumber'];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pay Invoice',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(
            height: 35,
          ),
          Form(
            key: _invoiceFormKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                    keyboardType: TextInputType.number,
                    initialValue: '$amount',
                    readOnly: true,
                    autofocus: false,
                    inputFormatters: [ThousandsFormatter()],
                    textAlign: TextAlign.start,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Enter the amount to be paid");
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                      labelText: 'Rent Amount',
                    )),
                const SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                      labelText: 'Choose Payment Method'),
                  items: paymentItems,
                  value: paymentMode,
                  validator: (value) {
                    if (value == null) {
                      return ('Choose a payment method');
                    }
                    return null;
                  },
                  onChanged: (String? value) {
                    setState(() {
                      paymentMode = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    controller: phoneNumberController,
                    textAlign: TextAlign.start,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Enter the Phone Number");
                      }
                      return null;
                    },
                    onSaved: (value) {},
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                      labelText: 'Enter Phone Number to be Charged',
                    )),
                const SizedBox(
                  height: 30,
                ),
                Consumer<PaymentsProvider>(
                  builder: ((_, paymentsProvider, __) => paymentsProvider
                              .paymentStatus ==
                          ProcessingStatus.processing
                      ? const CircularProgressIndicator()
                      : Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .6,
                            child: ElevatedButton(
                              onPressed: () => _initiateInvoicePaymentRequest(
                                  invoiceNumber, phoneNumberController.text),
                              child: const Text(
                                "Pay",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ])),
      ),
    );
  }
}
