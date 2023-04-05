import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../constants/app_theme.dart';

class InvoiceFilterDialog extends StatefulWidget {
  const InvoiceFilterDialog({Key? key}) : super(key: key);

  @override
  State<InvoiceFilterDialog> createState() => _InvoiceFilterDialogState();
}

class _InvoiceFilterDialogState extends State<InvoiceFilterDialog> {
  final List<Map<String, dynamic>> _filterMenuData = [
    {"value": "House", "icon": Icons.house_rounded},
    {"value": "Date", "icon": Icons.date_range},
    {"value": "Amount", "icon": Icons.attach_money_rounded}
  ];

  final List<Map<String, dynamic>> _houseMenuData = [
    {"value": "House 1", "icon": Icons.house_rounded},
    {"value": "House 2", "icon": Icons.house_rounded},
  ];

  late List<DropdownMenuItem<String>> _filterMenuItems;
  late List<DropdownMenuItem<String>> _houseMenuItems;

  DateTime _dateBefore = DateTime.now();
  DateTime _dateAfter = DateTime.now();

  late var _filterValue = "House";
  var _houseValue = "House 1";

  final TextEditingController _dateInputController = TextEditingController(
    text:
        'Between ${DateFormat.yMd().format(DateTime.now())} And ${DateFormat.yMd().format(DateTime.now())}',
  );
  final TextEditingController _lowAmountController =
      TextEditingController(text: '0');
  final TextEditingController _highAmountController =
      TextEditingController(text: '2000');
  final _amountFilterFormKey = GlobalKey<FormState>();

  _processInvoiceFilter() {
    Map<String, dynamic> filterObject = {'filterValue': _filterValue};

    if (_filterValue == 'House') {
      filterObject.addAll({'house': _houseValue});
    } else if (_filterValue == 'Date') {
      filterObject.addAll(
          {'dateBefore': _dateBefore, 'dateAfter': _dateAfter}); //Date Range
    } else {
      filterObject.addAll({
        'highAmount': double.parse(_highAmountController.text),
        'lowAmount': double.parse(_lowAmountController.text)
      });
    }

    // Return to the invoices screen and pass the filter object
    Navigator.pop(context, filterObject);
  }

  @override
  void initState() {
    _filterMenuItems = _filterMenuData
        .map((item) => DropdownMenuItem<String>(
            value: item['value'],
            child: Row(
              children: [
                Icon(
                  item['icon'],
                  color: kSecondaryColorDark,
                ),
                const SizedBox(width: 20),
                Text(
                  item['value'],
                  style: const TextStyle(color: kSecondaryColorDark),
                ),
              ],
            )))
        .toList();

    _houseMenuItems = _houseMenuData
        .map((item) => DropdownMenuItem<String>(
            value: item['value'],
            child: Row(
              children: [
                Icon(
                  item['icon'],
                  color: kSecondaryColorDark,
                ),
                const SizedBox(width: 20),
                Text(
                  item['value'],
                  style: const TextStyle(color: kSecondaryColorDark),
                ),
              ],
            )))
        .toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Dialog(
          insetAnimationDuration: const Duration(seconds: 2),
          insetAnimationCurve: Curves.elasticInOut,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(children: [
              const Text(
                'Filter by',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * .6,
                child: DropdownButtonFormField(
                  value: _filterValue,
                  items: _filterMenuItems,
                  onChanged: (value) {
                    setState(() {
                      _filterValue = '$value';
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (_filterValue == 'House')
                DropdownButtonFormField(
                  value: _houseValue,
                  decoration: const InputDecoration(labelText: 'Select house'),
                  items: _houseMenuItems,
                  onChanged: (value) {
                    setState(() {
                      _houseValue = '$value';
                    });
                  },
                )
              else if (_filterValue == 'Date')
                TextFormField(
                  controller: _dateInputController,
                  decoration:
                      const InputDecoration(labelText: 'Select time period'),
                  readOnly: true,
                  minLines: 2,
                  maxLines: 3,
                  onTap: () async {
                    final pickedDate = await showDateRangePicker(
                            context: context,
                            initialDateRange: DateTimeRange(
                                start: _dateBefore, end: _dateAfter),
                            firstDate: DateTime(2020),
                            lastDate: DateTime.now())
                        .catchError(
                            (_) {}); // if picked date is null, do nothing

                    if (pickedDate != null) {
                      setState(() {
                        _dateInputController.text =
                            'Between ${DateFormat.yMd().format(pickedDate.start)} And ${DateFormat.yMd().format(pickedDate.end)}';
                        _dateBefore = pickedDate.start;
                        _dateAfter = pickedDate.end;
                      });
                    }
                  },
                )
              else
                Form(
                  key: _amountFilterFormKey,
                  child: Column(
                    children: [
                      const Text('Between', style: TextStyle(fontSize: 17)),
                      const SizedBox(height: 10),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter an amount';
                          }
                          if (double.parse(value) >
                              double.parse(_highAmountController.text)) {
                            return 'Enter a lower amount';
                          }
                          return null;
                        },
                        controller: _lowAmountController,
                        decoration: const InputDecoration(hintText: 'Amount'),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(
                              r'^\d+\.?\d{0,2}')), //? Spater zurueck hier kommen
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text('And',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17)),
                      const SizedBox(height: 10),
                      TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter an amount';
                            }
                            if (double.parse(value) <
                                double.parse(_lowAmountController.text)) {
                              return 'Enter a higher amount';
                            }
                            return null;
                          },
                          controller: _highAmountController,
                          decoration: const InputDecoration(hintText: 'Amount'),
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d+\.?\d{0,2}')),
                          ]),
                    ],
                  ),
                ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * .6,
                child: ElevatedButton(
                  onPressed: _processInvoiceFilter,
                  child: const Text('Filter'),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
