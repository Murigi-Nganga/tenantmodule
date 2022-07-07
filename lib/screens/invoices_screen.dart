import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';

class InvoicesScreen extends StatelessWidget {
    const InvoicesScreen({Key? key}) : super(key: key);

    static const routeName = '/invoices';

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Invoices'),
                centerTitle: true,
            ),
            body: const Center(child: Text('This is the invoices screen')),
            drawer: const AppDrawer(),
        );
    }
}
