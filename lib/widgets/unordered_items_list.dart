import 'package:flutter/material.dart';

class UnorderedItemsList extends StatelessWidget {
  const UnorderedItemsList({Key? key, required this.features }) : super(key: key);

  final List<String> features;

  @override
  Widget build(BuildContext context) {
    return Column(
      children : [
        ...features.map((feature) => Row(
          children: [
            const Text("• "),
            Expanded(
              child: Text(feature),
            ),
          ],
        )),
      ]
    );
  }
}
