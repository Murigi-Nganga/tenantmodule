import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Row(
        children: <Widget>[
          const Icon(Icons.search),
          TextFormField(
            
          ),
          // Text('Search using keyword or location')
        ],
      )
    );
  }
}