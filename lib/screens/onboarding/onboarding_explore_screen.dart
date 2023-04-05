import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/app_theme.dart';
import '../../services/property_units_service.dart';
import '../../widgets/property_card.dart';
import '../auth/login_screen.dart';

class OnboardingExploreScreen extends StatefulWidget {
  const OnboardingExploreScreen({Key? key}) : super(key: key);

  static const routeName = '/onboarding-explore';

  @override
  State<OnboardingExploreScreen> createState() =>
      _OnboardingExploreScreenState();
}

class _OnboardingExploreScreenState extends State<OnboardingExploreScreen> {
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

  @override
  Widget build(BuildContext context) {
    _showSearch() {
      _propertyUnitsProv.fetchVacantUnits();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => _propertyUnitsProv.fetchVacantUnits(),
        color: kAccentColor,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
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
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(style: BorderStyle.none),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(style: BorderStyle.none),
                  ),
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
                      itemBuilder: (ctx, index) => PropertyCardWidget(
                          propertyUnitData:
                              propertyUnitsProvider.vacantPropertyUnits[index]),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Go to log in',
        onPressed: () {
          Navigator.pushNamed(context, LoginScreen.routeName);
        },
        child: const Icon(
          Icons.arrow_forward_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
