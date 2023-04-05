import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:tenantmodule/screens/receipts_screen.dart';

import '../constants/app_theme.dart';
// import '../models/user.dart';
// import '../providers/auth_provider.dart';
// import '../providers/user_provider.dart';
import '../screens/auth/login_screen.dart';
import '../screens/explore_screen.dart';
import '../screens/feedback_screen.dart';
import '../screens/home_screen.dart';
import '../screens/invoices_screen.dart';
// import '../screens/auth/login_screen.dart';
import '../screens/adhoc_payments_screen.dart';
// import '../screens/profile_screen.dart';

import 'drawer_item.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    // AuthProvider auth = Provider.of<AuthProvider>(context);
    // User? user = Provider.of<UserProvider>(context).user;

    return Drawer(
      width: MediaQuery.of(context).size.width * 0.85,
      child: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, ProfileScreen.routeName, arguments: {'user': user});
              },
              child: const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                ),
                accountName: Text(
                    // '${user.firstName} ${user.middleName}'
                    'FirstName MiddleName'),
                accountEmail: Text(
                    // user.email,
                    'User Email'),
                currentAccountPicture: CircleAvatar(
                  //TODO: Change image back to original
                  backgroundImage:
                      AssetImage('assets/images/background_image.jpg'),
                  // NetworkImage(
                  //     "https://cdn.myanimelist.net/r/360x360/images/characters/9/310307.jpg?s=56335bffa6f5da78c3824ba0dae14a26"
                  // ),
                ),
              ),
            ),
            DrawerItem(
              name: 'Home',
              icon: Icons.home_rounded,
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName),
            ),
            DrawerItem(
              name: "Explore",
              icon: Icons.search,
              onPressed: () => Navigator.pushReplacementNamed(
                  context, ExploreScreen.routeName),
            ),
            DrawerItem(
              name: "Payments",
              icon: Icons.paid,
              onPressed: () => Navigator.pushReplacementNamed(
                  context, AdhocPaymentsScreen.routeName),
            ),
            DrawerItem(
              name: "Invoices",
              icon: Icons.receipt,
              onPressed: () => Navigator.pushReplacementNamed(
                  context, InvoicesScreen.routeName),
            ),
            DrawerItem(
              name: "Receipts",
              icon: Icons.receipt_long,
              onPressed: () => Navigator.pushReplacementNamed(
                  context, ReceiptsScreen.routeName),
            ),
            DrawerItem(
              name: "Feedback",
              icon: Icons.feedback_rounded,
              onPressed: () => Navigator.pushReplacementNamed(
                  context, FeedbackScreen.routeName),
            ),
            const Divider(
              thickness: 1,
              height: 8,
              color: Colors.black45,
            ),
            DrawerItem(
                name: "Log out",
                icon: Icons.logout_sharp,
                onPressed: () {
                  // auth.logout();
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginScreen.routeName, (route) => false);
                }),
          ],
        ),
      ),
    );
  }
}
