import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';

class FeedbackScreen extends StatelessWidget {
    const FeedbackScreen({Key? key}) : super(key: key);

    static const routeName = '/feedback';

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Feedback'),
                centerTitle: true,
            ),
            body: const Center(child: Text('This is the feedback screen')),
            drawer: const AppDrawer(),
        );
    }
}
