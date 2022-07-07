import 'package:flutter/material.dart';
import 'package:tenantmodule/screens/explore_screen.dart';
import 'package:tenantmodule/screens/feedback_screen.dart';
import 'package:tenantmodule/screens/home_screen.dart';
import 'package:tenantmodule/screens/invoices_screen.dart';
import 'package:tenantmodule/screens/profile_screen.dart';
import 'package:tenantmodule/theme/app_theme.dart';

List<Map<String,dynamic>> appDrawerMenuDetailItems = [
    { 'title': 'Home', 'icon':  Icons.home, 'nextRoute': HomeScreen.routeName},
    { 'title': 'Explore', 'icon': Icons.explore, 'nextRoute': ExploreScreen.routeName},
    { 'title': 'Profile', 'icon': Icons.person, 'nextRoute': ProfileScreen.routeName },
    { 'title': 'Invoices', 'icon': Icons.receipt, 'nextRoute': InvoicesScreen.routeName},
    {'title': 'Feedback','icon': Icons.feedback, 'nextRoute': FeedbackScreen.routeName}
];

class AppDrawer extends StatelessWidget {
    const AppDrawer({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Drawer(
            width: MediaQuery.of(context).size.width * .8,
            child: SingleChildScrollView(
              child: Column(
                  children: <Widget>[
                      UserAccountsDrawerHeader(
                          decoration: BoxDecoration(
                              color: appColors['PrimaryColor']
                          ),
                          accountName: const Text('John Doe'),
                          accountEmail: const Text('johndoe@gmail.com'),
                          // currentAccountPicture: Add an account picture
                      ),
                      ...appDrawerMenuDetailItems.map((menuDetailItem) =>
                          MenuItem(
                              menuTitle: menuDetailItem['title'],
                              menuIcon: menuDetailItem['icon'],
                              nextRoute: menuDetailItem['nextRoute']
                          ),
                      ),
                      const Divider(),
                      ListTile(
                          leading: Icon(
                              Icons.logout,
                              color: appColors["SecondaryColor"]
                          ),
                          title: const Text('Logout'),
                          onTap: (){},
                      )
                  ],
              ),
            ),
        );
    }
}

class MenuItem extends StatelessWidget {
    const MenuItem({Key? key, required this.menuTitle, required this.menuIcon, required this.nextRoute}) : super(key: key);

    final String menuTitle;
    final IconData menuIcon;
    final String nextRoute;

    @override
    Widget build(BuildContext context) {
        return ListTile(
            title: Text(menuTitle),
            leading: Icon(
                menuIcon,
                color: appColors['SecondaryColor'],
            ),
            onTap: () {
                Navigator.pushReplacementNamed(context, nextRoute);
            },
        );
    }
}