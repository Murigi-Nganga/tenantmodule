import 'package:flutter/material.dart';

import '../../widgets/feedback_list_item.dart';


class FeedbackProgressTab extends StatelessWidget {
  const FeedbackProgressTab({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _feedbackItems = const [
    {
      'status': 'Solved',
      'category': 'Water',
      'description': 'There is a water leak in the living room ceiling'
    },
    {
      'status': 'In progress',
      'category': 'Water',
      'description': 'There are some broken water pipes in the dining area'
    },
    {
      'status': 'Unsolved',
      'category': 'Electricity',
      'description': 'There are some exposed wires in the corridor area'
    },
    // {
    //   'status': 'In progress',
    //   'category': 'Water',
    //   'description': 'There is a water leak in the living room ceiling'
    // },
    // {
    //   'status': 'Solved',
    //   'category': 'Electricity',
    //   'description': 'There is a water leak in the living room ceiling'
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _feedbackItems.length,
        itemBuilder: ((context, index) =>
            FeedbackListItem(feedbackItem: _feedbackItems[index])));
  }
}
