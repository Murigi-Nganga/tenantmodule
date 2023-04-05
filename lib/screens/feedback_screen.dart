import 'package:flutter/material.dart';
import 'tabs/feedback_message_tab.dart';
import 'tabs/feedback_progress_tab.dart';

import '../widgets/side_drawer.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  static const routeName = '/feedback';

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  int _selectedTabIndex = 0;

  _showInfo() => showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text(
            'Info',
            textAlign: TextAlign.center,
          ),
          content: const Text(
            'The progress tab is under construction. '
            'It allows tenants to track the state of their feedback. '
            'Whether it is solved(green), is being solved(amber) or has not yet been solved(red). ',
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
    return Scaffold(
      drawer: const SideDrawer(),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          'Feedback',
        ),
        actions: [
          IconButton(
            onPressed: _showInfo,
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      body: _selectedTabIndex == 0
          ? const FeedbackMesssageTab()
          : const FeedbackProgressTab(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: (index) => setState(() {
          _selectedTabIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.feedback_rounded,
            ),
            label: 'Write Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.query_stats_rounded,
            ),
            label: 'Progress',
          ),
        ],
      ),
    );
  }
}
