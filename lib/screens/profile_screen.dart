import 'package:flutter/material.dart';
import 'package:tenantmodule/widgets/app_drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const routeName = '/user-profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
        body: const Center(child: Text('This is the profile screen')),
      drawer: const AppDrawer(),
    );
  }
}
