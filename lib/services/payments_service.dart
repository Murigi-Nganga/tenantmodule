import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../constants/endpoints.dart';
import 'package:http/http.dart' as http;

enum ProcessingStatus { notProcessed, processing, processed }

class PaymentsProvider with ChangeNotifier {
  ProcessingStatus _paymentStatus = ProcessingStatus.notProcessed;
  ProcessingStatus get paymentStatus => _paymentStatus;

  Future<String> processMpesaInvoicePayment(
      String invoiceNumber, String phoneNumber) async {
    String displayMessage = '';
    _paymentStatus = ProcessingStatus.processing;
    notifyListeners();
    try {
      await http
          .post(Uri.parse(Endpoints.mpesaPromptURL),
              headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
              },
              body: json.encode({
                "invoiceNumber": invoiceNumber,
                "mobileNumber": phoneNumber,
                "paymentMode": "MPESA",
                "shortcode": "174379"
              }))
          .then((response) {
        final responseBody = json.decode(response.body);

        if (responseBody["httpStatus"] == 200) {
          displayMessage = responseBody["data"]["paymentInstructions"];
          _paymentStatus = ProcessingStatus.processed;
          notifyListeners();
        } else {
          displayMessage =
              'The payment request was not successful. Ensure the number you have entered is valid';
          _paymentStatus = ProcessingStatus.notProcessed;
          notifyListeners();
        }
      });
    } catch (_) {
      displayMessage = 'Check your internet connection';
      _paymentStatus = ProcessingStatus.notProcessed;
      notifyListeners();
    }

    return displayMessage;
  }

  Future processMpesaAdhocPayment(
      String phonenumber, double amount, String property) async {
    String displayMessage = '';
    _paymentStatus = ProcessingStatus.processing;
    notifyListeners();

    try {
      await http
          .post(Uri.parse(Endpoints.adHocMpesaURL),
              headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
              },
              body: jsonEncode({
                "mobileNumber": phonenumber,
                "paymentMode": "MPESA",
                "amount": amount,
                "houseNumber": property
              }))
          .then((response) {
        final responseBody = json.decode(response.body);

        if (responseBody["httpStatus"] == 200) {
          displayMessage = responseBody["data"]["paymentInstructions"];
          _paymentStatus = ProcessingStatus.processed;
          notifyListeners();
        } else {
          displayMessage =
              'The payment request was not successful. Ensure the number you have entered is valid';
          _paymentStatus = ProcessingStatus.notProcessed;
          notifyListeners();
        }
      });
    } catch (error) {
      displayMessage = 'Check your internet connection';
      _paymentStatus = ProcessingStatus.notProcessed;
      notifyListeners();
    }

    return displayMessage;
  }
}
