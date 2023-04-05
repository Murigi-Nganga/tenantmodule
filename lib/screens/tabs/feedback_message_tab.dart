import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/feedback_service.dart';

class FeedbackMesssageTab extends StatefulWidget {
  const FeedbackMesssageTab({Key? key}) : super(key: key);

  @override
  State<FeedbackMesssageTab> createState() => _FeedbackMesssageTabState();
}

class _FeedbackMesssageTabState extends State<FeedbackMesssageTab> {
  late String _category;
  final _feedbackFormKey = GlobalKey<FormState>();

  late FeedbackProvider _feedbackProvider;
  final TextEditingController _messageController = TextEditingController();

  List<DropdownMenuItem<String>> dropdownItems = const [
    DropdownMenuItem(
        value: "ELECTRICITY",
        child: Text(
          "Electricity",
          style: TextStyle(fontWeight: FontWeight.w400),
        )),
    DropdownMenuItem(
        value: "WATER",
        child: Text(
          "Water",
          style: TextStyle(fontWeight: FontWeight.w400),
        )),
  ];

  _submitFeedback() async {
    if (_feedbackFormKey.currentState!.validate()) {
      late String displayMessage;

      await _feedbackProvider
          .submitTenantFeedback(
              _category, _messageController.text.trim(), 18, 7)
          .then((responseMessage) {
        displayMessage = responseMessage;
      });

      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Align(child: Text('Info')),
          content: Text(
            displayMessage,
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
    }
  }

  @override
  void initState() {
    _category = dropdownItems[0].value.toString();
    _feedbackProvider = Provider.of<FeedbackProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Align(
              child: SizedBox(
                child: Text(
                  'Write your Feedback',
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.black),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Form(
              key: _feedbackFormKey,
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                        labelStyle: TextStyle(fontWeight: FontWeight.w700),
                        labelText: 'Category of Issue'),
                    items: dropdownItems,
                    value: dropdownItems[0].value,
                    onChanged: (value) {
                      setState(() {
                        _category = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                      controller: _messageController,
                      maxLines: 8,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty || value.trim().isEmpty) {
                          return ("Enter your feedback message");
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        hintText: 'Write your Feedback',
                      )),
                  const SizedBox(
                    height: 25,
                  ),
                  Consumer<FeedbackProvider>(
                      builder: (_, feedbackProvider, __) {
                    return feedbackProvider.feedbackSubStatus ==
                            SubmissionStatus.submitting
                        ? const CircularProgressIndicator()
                        : SizedBox(
                            width: MediaQuery.of(context).size.width * .7,
                            child: ElevatedButton(
                              onPressed: _submitFeedback,
                              child: const Text('Submit'),
                            ),
                          );
                  }),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'All feedback is recorded and shared with the property manager to be worked on.',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
