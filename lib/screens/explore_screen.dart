import 'package:flutter/material.dart';
import 'package:tenantmodule/widgets/app_drawer.dart';

class ExploreScreen extends StatelessWidget {
    const ExploreScreen({Key? key}) : super(key: key);

    static const routeName = '/explore';

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Explore'),
                centerTitle: true,
            ),
            body: const Center(
                child: Text('Welcome to the Explore Screen!!!')
            ),
            drawer: const AppDrawer(),
        );
    }
}
