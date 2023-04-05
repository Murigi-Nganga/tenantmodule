import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tenantmodule/constants/endpoints.dart';

enum SubmissionStatus { notSubmitted, submitting, submitted }

class FeedbackProvider with ChangeNotifier {
  SubmissionStatus _feedbackSubStatus = SubmissionStatus.notSubmitted;

  SubmissionStatus get feedbackSubStatus => _feedbackSubStatus;

  Future<String> submitTenantFeedback(
      String category, String message, int unitID, int tenancyID) async {
    _feedbackSubStatus = SubmissionStatus.submitting;
    notifyListeners();
    String responseMessage = '';
    Map<String, dynamic> requestBody = {
      "feedbackCategory": category,
      "feedback": message,
      "unitID": unitID,
      "tenancyID": tenancyID
    };

    try {
      await http.post(
        Uri.parse(Endpoints.submitTenantFeedback),
        body: json.encode(requestBody),
        headers: {'Content-Type': 'application/json'},
      ).then((response) {
        if (response.statusCode == 200) {
          responseMessage = 'Feedback submitted successfully';
          _feedbackSubStatus = SubmissionStatus.submitted;
        } else {
          responseMessage = 'Feedback could not be submitted';
          _feedbackSubStatus = SubmissionStatus.notSubmitted;
        }
      });
    } catch (_) {
      responseMessage = 'Check your internet connection';
      _feedbackSubStatus = SubmissionStatus.notSubmitted;
    } finally {
      notifyListeners();
    }

    return responseMessage;
  }
}
