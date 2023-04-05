import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tenantmodule/models/invoice.dart';
import 'package:http/http.dart' as http;
import '../constants/endpoints.dart';

enum DataStatus { notFetched, fetched, fetching }

class InvoicesProvider with ChangeNotifier {
  DataStatus _fetchDataStatus = DataStatus.notFetched;

  DataStatus get fetchDataStatus => _fetchDataStatus;
  List<Invoice> _tenantInvoices = [];
  List<Invoice> _filteredInvoices = [];
  List<Invoice> get tenantInvoices => _tenantInvoices;
  List<Invoice> get filteredInvoices => _filteredInvoices;

  double get totalAmount => _filteredInvoices.fold(
      0, (previousValue, invoice) => previousValue + invoice.invoiceAmount!);

  List<Invoice> _convertToInvoices(List invoicesData) =>
      invoicesData.map((invoiceItem) => Invoice.fromJson(invoiceItem)).toList();

  Future<void> fetchTenantInvoices(String phoneNumber) async {
    _fetchDataStatus = DataStatus.fetching;
    notifyListeners();

    try {
      await http
          .get(
        Uri.parse('${Endpoints.fetchTenantInvoices}?phoneNumber=$phoneNumber'),
      )
          .then((response) {
        final responseBody = json.decode(response.body);
        if (response.statusCode == 200) {
          _tenantInvoices = _convertToInvoices(responseBody['data']);
          _filteredInvoices = _tenantInvoices;
          _fetchDataStatus = DataStatus.fetched;
        } else {
          _fetchDataStatus = DataStatus.notFetched;
        }
        notifyListeners();
      });
    } catch (_) {
      _fetchDataStatus = DataStatus.notFetched;
      notifyListeners();
    }
  }

  void filterInvoicesByUnit(String unitCode) {
    _filteredInvoices = tenantInvoices
        .where((tenantInvoice) => tenantInvoice.unitCode == unitCode)
        .toList();
    notifyListeners();
  }

  void filterInvoicesByDate(DateTime dateBefore, DateTime dateAfter) {
    _filteredInvoices = tenantInvoices.where((tenantInvoice) {
      final DateTime invoiceDate = DateTime.utc(tenantInvoice.invoiceDate![0],
          tenantInvoice.invoiceDate![1], tenantInvoice.invoiceDate![2]);

      //* Modify the selected dates to have an inclusive 'Between'
      return invoiceDate.isBefore(dateAfter.add(const Duration(days: 1))) &&
          invoiceDate.isAfter(dateBefore.subtract(const Duration(days: 1)));
    }).toList();
    notifyListeners();
  }

  void filterInvoicesByAmount(double lowAmount, double highAmount) {
    _filteredInvoices = tenantInvoices
        .where((tenantInvoice) =>
            tenantInvoice.totalPayable! <= highAmount &&
            tenantInvoice.totalPayable! >= lowAmount)
        .toList();
    notifyListeners();
  }

  Future<void> resetFilter() {
    _filteredInvoices = _tenantInvoices;
    notifyListeners();
    return Future<void>(() {});
  }
}
