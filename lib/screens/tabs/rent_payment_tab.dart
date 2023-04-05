import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/payments_service.dart';

class RentPaymentTab extends StatefulWidget {
  const RentPaymentTab({
    Key? key,
    required this.unitItems,
    required this.paymentOptions,
    required this.showCustomDialog,
  }) : super(key: key);

  final List<DropdownMenuItem<String>> unitItems;
  final List<DropdownMenuItem<String>> paymentOptions;
  final Function showCustomDialog;

  @override
  State<RentPaymentTab> createState() => _RentPaymentTabState();
}

class _RentPaymentTabState extends State<RentPaymentTab> {
  late String _propertyUnit;
  late String _paymentMode;
  final _rentPaymentFormKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();
  final _rentAmountController = TextEditingController();
  late PaymentsProvider _paymentsProvider;

  _initiateRentPaymentRequest() {
    if (_rentPaymentFormKey.currentState!.validate()) {
      if (_paymentMode == 'M-Pesa') {
        _paymentsProvider
            .processMpesaAdhocPayment(_phoneNumberController.text,
                double.parse(_rentAmountController.text), _propertyUnit)
            .then((displayMessage) => widget.showCustomDialog(displayMessage));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      _paymentsProvider = Provider.of<PaymentsProvider>(context, listen: false);
      _propertyUnit = widget.unitItems[0].value!;
      _paymentMode = widget.paymentOptions[0].value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Form(
            key: _rentPaymentFormKey,
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                      labelText: 'Select Unit'),
                  items: widget.unitItems,
                  value: widget.unitItems[0].value!,
                  onChanged: (value) {
                    setState(() {
                      _propertyUnit = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _rentAmountController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Enter the amount to be paid");
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                      labelText: 'Rent Amount',
                    )),
                const SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                      labelText: 'Choose Payment Method'),
                  items: widget.paymentOptions,
                  value: widget.paymentOptions[0].value,
                  onChanged: (value) {
                    setState(() {
                      _paymentMode = value.toString();
                    });
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _phoneNumberController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Enter the Phone Number");
                      }
                      if (value.length < 10) {
                        return ("Phone number should be a minimum of 10 digits");
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                      labelText: 'Enter Phone Number to be Charged',
                    )),
                const SizedBox(
                  height: 30,
                ),
                Consumer<PaymentsProvider>(
                  builder: ((_, paymentsProvider, __) =>
                      paymentsProvider.paymentStatus ==
                              ProcessingStatus.processing
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              width: MediaQuery.of(context).size.width * .7,
                              child: ElevatedButton(
                                onPressed: _initiateRentPaymentRequest,
                                child: const Text(
                                  "Pay Rent",
                                ),
                              ),
                            )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
