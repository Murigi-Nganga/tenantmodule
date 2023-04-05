import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/app_theme.dart';
import '../services/property_units_service.dart';
import '../widgets/side_drawer.dart';
import '../widgets/property_card.dart';
import './explore_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PropertyUnitsProvider _propertyUnitsProv;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      _propertyUnitsProv =
          Provider.of<PropertyUnitsProvider>(context, listen: false);
      _propertyUnitsProv.fetchTenantUnits('0722748949');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideDrawer(),
      appBar: AppBar(
        title: const Text(
          'Home',
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => _propertyUnitsProv.fetchTenantUnits('0722748949'),
        color: kAccentColor,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: [
                const Text('Welcome User'),
                const Text('Your units: '),
                const Divider(
                  color: kSecondaryColorDark,
                ),
                const SizedBox(height: 10),
                Consumer<PropertyUnitsProvider>(
                  builder: (_, propertyUnitsProvider, __) {
                    if (propertyUnitsProvider.fetchDataStatus ==
                        DataStatus.fetching) {
                      return const CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                          controller: ScrollController(),
                          shrinkWrap: true,
                          itemCount:
                              propertyUnitsProvider.tenantPropertyUnits.length,
                          itemBuilder: (ctx, index) => PropertyCardWidget(
                              propertyUnitData: propertyUnitsProvider
                                  .tenantPropertyUnits[index]));
                    }
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Explore',
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(ExploreScreen.routeName);
        },
        child: const Icon(
          Icons.explore,
          color: Colors.white,
        ),
      ),
    );
  }
}
