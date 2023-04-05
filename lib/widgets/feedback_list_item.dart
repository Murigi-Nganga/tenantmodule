import 'package:flutter/material.dart';

class FeedbackListItem extends StatelessWidget {
  const FeedbackListItem({Key? key, required this.feedbackItem})
      : super(key: key);

  final Map<String, dynamic> feedbackItem;
  Color get color => feedbackItem['status'] == 'Solved'
      ? Colors.green
      : (feedbackItem['status'] == 'Unsolved' ? Colors.red : Colors.orange);

  @override
  Widget build(BuildContext context) => InkWell(
        customBorder: Border.all(
            color: const Color.fromARGB(255, 17, 212, 118), width: 10),
        splashColor: Colors.pinkAccent,
        child: ListTile(
          onTap: () {},
          trailing: Icon(
            Icons.circle_rounded,
            color: color,
            size: 12,
          ),
          title: Text(feedbackItem['category']),
          subtitle: Text(feedbackItem['description']),
        ),
      );
}
