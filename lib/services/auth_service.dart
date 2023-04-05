// import 'dart:convert';

// import 'package:http/http.dart';
// import 'package:flutter/material.dart';

// import '../models/user.dart';
// import '../preferences/user_preferences.dart';
// import '../constants/endpoints.dart';
// import 'user_provider.dart';

// enum Status {
//     notRegistered,
//     registering,
//     registered,
//     notLoggedIn,
//     authenticating,
//     loggedIn,
//     loggedOut
// }

// class AuthProvider with ChangeNotifier {
//     Status _loggedInStatus = Status.notLoggedIn;
//     Status _registeredInStatus = Status.notRegistered;

//     Status get loggedInStatus => _loggedInStatus;
//     Status get registeredInStatus => _registeredInStatus;

//     Future<Map<String, dynamic>> login(
//         {required String email, required String password}) async {
//         Map<String, dynamic> result;

//         final Map<String, dynamic> loginData = {
//             "email": email,
//             "password": password
//         };

//         _loggedInStatus = Status.authenticating;
//         notifyListeners();

//         return await post(
//             Uri.parse(Endpoints.login),
//             body: json.encode(loginData),
//             headers: {'Content-Type': 'application/json'},
//         ).then((response) {
//             if (response.statusCode == 200) {
//                 final Map<String, dynamic> responseData = json.decode(response.body);

//                 User authUser = User.fromJson(responseData);
//                 UserProvider().setUser(authUser);

//                 // Persist user data on successful login
//                 UserPreferences().saveUser(authUser);

//                 _loggedInStatus = Status.loggedIn;
//                 result = {
//                     'status': true,
//                     'message': 'Login successful',
//                     'data': authUser
//                 };
//             } else {
//                 _loggedInStatus = Status.notLoggedIn;
//                 result = {'status': false, 'message': 'Incorrect email or password'};
//             }
//             notifyListeners();
//             return result;
//         }).catchError((error) {
//             _loggedInStatus = Status.notLoggedIn;
//             notifyListeners();
//             return {
//                 'status': false,
//                 'message': 'No internet connection',
//                 'data': error
//             };
//         });
//     }

//     Future<Map<String, dynamic>> register(
//         {required String firstName,
//             required String middleName,
//             required String otherNames,
//             required String email,
//             required int phoneNumber,
//             required String password}) async {
//         final Map<String, dynamic> registrationData = {
//             "firstName": firstName,
//             "middleName": middleName,
//             "otherNames": otherNames,
//             "email": email,
//             "phoneNumber": phoneNumber,
//             "password": password
//         };

//         _registeredInStatus = Status.registering;
//         notifyListeners();

//         return await post(Uri.parse(Endpoints.register),
//             body: json.encode(registrationData),
//             headers: {'Content-Type': 'application/json'})
//             .then(onValue)
//             .catchError((error) {
//             _registeredInStatus = Status.notRegistered;
//             notifyListeners();
//             return {
//                 'status': false,
//                 'message': 'No internet connection',
//                 'data': error
//             };
//         });
//     }

//     Future<Map<String, dynamic>> onValue(Response response) async {
//         Map<String, Object> result;
//         final Map<String, dynamic> responseData = json.decode(response.body);

//         if (response.statusCode == 200) {
//             User authUser = User.fromJson(responseData);
//             _registeredInStatus = Status.notRegistered;
//             result = {
//                 'status': true,
//                 'message': 'Registration Successful',
//                 'data': authUser
//             };
//         } else {
//             _registeredInStatus = Status.notRegistered;
//             result = {
//                 'status': false,
//                 'message': 'A user with that email \n or phone number exists',
//                 'data': responseData
//             };
//         }

//         notifyListeners();

//         return result;
//     }

//     void logout() {
//         UserPreferences().removeUser();
//         _loggedInStatus = Status.loggedOut;
//         notifyListeners();
//     }

// }
