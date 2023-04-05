import 'package:flutter/material.dart';

import '../constants/app_theme.dart';

class InvoiceDetailCard extends StatelessWidget {
  const InvoiceDetailCard(
      {Key? key,
      required this.detailTitle,
      required this.detailContent,
      required this.detailIcon})
      : super(key: key);

  final String detailTitle;
  final String detailContent;
  final IconData detailIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(width: 2.0, color: kSecondaryColorLight)),
      margin: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            detailTitle,
            style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 87, 83, 83)),
            textAlign: TextAlign.center,
          ),
          Icon(
            detailIcon,
            size: 30,
            color: kPrimaryColorDark,
          ),
          Text(
            detailContent,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
