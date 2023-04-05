import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tenantmodule/services/property_units_service.dart';

import '../constants/app_theme.dart';
import '../widgets/side_drawer.dart';
import '../widgets/property_card.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  static const routeName = '/explore';

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final searchController = TextEditingController();

  late PropertyUnitsProvider _propertyUnitsProv;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      _propertyUnitsProv =
          Provider.of<PropertyUnitsProvider>(context, listen: false);
      _propertyUnitsProv.fetchVacantUnits();
    });
  }

  final OutlineInputBorder _inputBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
      borderSide: BorderSide(style: BorderStyle.none));

  @override
  Widget build(BuildContext context) {
    _showSearch() {
      _propertyUnitsProv.fetchVacantUnits();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
      ),
      drawer: const SideDrawer(),
      body: RefreshIndicator(
        color: kAccentColor,
        onRefresh: () => _propertyUnitsProv.fetchVacantUnits(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                style: const TextStyle(fontSize: 14, color: Colors.white),
                controller: searchController,
                // onChanged: _showSearch,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    color: kSecondaryColorLight,
                    splashRadius: 20,
                    onPressed: () {
                      // _showSearch(searchController.text);
                      _showSearch();
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  hintText: 'Locations, features, property owners',
                  hintStyle: const TextStyle(color: Colors.white70),
                  focusColor: Theme.of(context).colorScheme.secondary,
                  fillColor: kSecondaryColor,
                  border: _inputBorder,
                  focusedBorder: _inputBorder,
                  enabledBorder: _inputBorder,
                ),
              ),
              const SizedBox(height: 20),
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
                          propertyUnitsProvider.vacantPropertyUnits.length,
                      itemBuilder: ((context, index) => PropertyCardWidget(
                          propertyUnitData: propertyUnitsProvider
                              .vacantPropertyUnits[index])));
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
