import 'package:flutter/material.dart';

import '../constants/app_theme.dart';
import '../models/tenant.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const routeName = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget _profileDetails(Tenant tenant) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.person_rounded),
              title: Text(tenant.firstName!),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.person_rounded),
              title: Text(tenant.middleName!),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.email_rounded),
              title: Text(tenant.emailAddress!),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.phone_rounded),
              title: Text('0${tenant.phoneNumber}'),
            ),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, Tenant>;
    final Tenant tenant = routeArguments["user"] as Tenant;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          'Profile',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
        child: Column(
          children: [
            const CircleAvatar(
              backgroundColor: kBodyColor,
              radius: 45,
              backgroundImage: AssetImage('assets/images/background_image.jpg'),
            ),
            const SizedBox(height: 2),
            Text(
              '${tenant.firstName} ${tenant.middleName}',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              tenant.emailAddress!,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 10),
            _profileDetails(tenant),
          ],
        ),
      ),
    );
  }
}
