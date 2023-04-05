import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:tenantmodule/models/property_unit.dart';

import '../constants/endpoints.dart';

enum DataStatus { notfetched, fetched, fetching }

class PropertyUnitsProvider with ChangeNotifier {
  DataStatus _fetchDataStatus = DataStatus.notfetched;
  List<PropertyUnitLong> _vacantPropertyUnits = [];
  List<PropertyUnitShort> _tenantPropertyUnits = [];

  DataStatus get fetchDataStatus => _fetchDataStatus;
  List<PropertyUnitLong> get vacantPropertyUnits => _vacantPropertyUnits;
  List<PropertyUnitShort> get tenantPropertyUnits => _tenantPropertyUnits;

  List _convertToPropertyUnits(List propertyUnitsData, bool isLong) => isLong
      ? propertyUnitsData
          .map((item) => PropertyUnitLong.fromJson(item))
          .toList()
      : propertyUnitsData
          .map((item) => PropertyUnitShort.fromJson(item['propertyUnit']))
          .toList();

  //Fetches vacant units for advertisement
  Future<void> fetchVacantUnits() async {
    _fetchDataStatus = DataStatus.fetching;
    notifyListeners();
    try {
      await http
          .get(
        Uri.parse(Endpoints.fetchPropertiesURL),
      )
          .then((response) {
        final responseBody = json.decode(response.body);

        if (response.statusCode == 200) {
          _vacantPropertyUnits =
              _convertToPropertyUnits(responseBody['data'], true)
                  as List<PropertyUnitLong>;
          _fetchDataStatus = DataStatus.fetched;
        } else {
          _fetchDataStatus = DataStatus.notfetched;
        }
        notifyListeners();
      });
    } catch (_) {
      _fetchDataStatus = DataStatus.notfetched;
      notifyListeners();
    }
  }

  // Fetches tenant's units
  Future<void> fetchTenantUnits(String phoneNumber) async {
    _fetchDataStatus = DataStatus.fetching;
    notifyListeners();
    try {
      await http
          .get(Uri.parse(
              '${Endpoints.fetchTenanciesByTenant}?phoneNumber=$phoneNumber'))
          .then((response) {
        final responseBody = json.decode(response.body);
        if (response.statusCode == 200) {
          _tenantPropertyUnits =
              _convertToPropertyUnits(responseBody['data'], false)
                  as List<PropertyUnitShort>;
          _fetchDataStatus = DataStatus.fetched;
        } else {
          _fetchDataStatus = DataStatus.notfetched;
        }
        notifyListeners();
      });
    } catch (_) {
      _fetchDataStatus = DataStatus.notfetched;
      notifyListeners();
    }
  }
}
