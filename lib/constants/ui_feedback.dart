import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String snackText, IconData snackIcon, Color snackBackgroundColor) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    margin: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
    behavior: SnackBarBehavior.floating,
    backgroundColor: snackBackgroundColor.withOpacity(.9),
    dismissDirection: DismissDirection.horizontal,
    duration: const Duration(seconds: 2),
    content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(snackText, overflow: TextOverflow.ellipsis,),
          Icon(
            snackIcon,
            color: Colors.white,
          ),
        ]
    ),
  ));
}