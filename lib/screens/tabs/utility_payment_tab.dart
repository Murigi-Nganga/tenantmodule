import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tenantmodule/services/payments_service.dart';

class UtilityPaymentTab extends StatefulWidget {
  const UtilityPaymentTab(
      {Key? key,
      required this.unitItems,
      required this.paymentOptions,
      required this.showCustomDialog})
      : super(key: key);

  final List<DropdownMenuItem<String>> unitItems;
  final List<DropdownMenuItem<String>> paymentOptions;
  final Function showCustomDialog;

  @override
  State<UtilityPaymentTab> createState() => _UtilityPaymentTabState();
}

class _UtilityPaymentTabState extends State<UtilityPaymentTab> {
  late String _paymentMode;
  late String _propertyUnit;
  // ignore: unused_field
  late String _utility;
  final _utilityPaymentFormKey = GlobalKey<FormState>();
  final _utilityAmountController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  late PaymentsProvider _paymentsProvider;

  List<DropdownMenuItem<String>> get utilityItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
        value: "ELECTRICITY",
        child: Text(
          "Electricity",
        ),
      ),
      const DropdownMenuItem(
        value: "WATER",
        child: Text(
          "Water",
        ),
      ),
    ];
    return menuItems;
  }

  _initiateUtilityPaymentRequest() {
    if (_utilityPaymentFormKey.currentState!.validate()) {
      if (_paymentMode == 'M-Pesa') {
        _paymentsProvider
            .processMpesaAdhocPayment(_phoneNumberController.text,
                double.parse(_utilityAmountController.text), _propertyUnit)
            .then((displayMessage) => widget.showCustomDialog(displayMessage));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) {
      _paymentsProvider = Provider.of<PaymentsProvider>(context, listen: false);
      _propertyUnit = widget.unitItems[0].value!;
      _paymentMode = widget.paymentOptions[0].value!;
      _utility = utilityItems[0].value!;
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
            key: _utilityPaymentFormKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                      labelText: 'Select Utility'),
                  items: utilityItems,
                  value: utilityItems[0].value,
                  onChanged: (value) {
                    setState(() {
                      _utility = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                      labelText: 'Select Unit'),
                  items: widget.unitItems,
                  value: widget.unitItems[0].value,
                  onChanged: (value) {
                    setState(() {
                      _propertyUnit = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _utilityAmountController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter the amount to be paid";
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                    labelText: 'Utility Amount',
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                      _paymentMode = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: _phoneNumberController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter the Phone Number";
                    }
                    if (value.length < 10) {
                      return "Phone number should be a minimum of 10 digits";
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                    labelText: 'Enter Phone Number to be Charged',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Consumer<PaymentsProvider>(
                  builder: ((_, paymentsProvider, __) =>
                      paymentsProvider.paymentStatus ==
                              ProcessingStatus.processing
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              width: MediaQuery.of(context).size.width * .7,
                              child: ElevatedButton(
                                onPressed: _initiateUtilityPaymentRequest,
                                child: const Text(
                                  "Pay Utility",
                                ),
                              ),
                            )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
