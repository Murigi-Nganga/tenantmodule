// import 'package:shared_preferences/shared_preferences.dart';

// import '../models/user.dart';


// class UserPreferences {

    // void saveUser(User user) async {
    //     final SharedPreferences prefs = await SharedPreferences.getInstance();

    //     prefs.setInt("userId", user.userId);
    //     prefs.setString("firstName", user.firstName);
    //     prefs.setString("middleName", user.middleName);
    //     prefs.setString("otherNames", user.otherNames);
    //     prefs.setString("email", user.email);
    //     prefs.setInt("phoneNumber", user.phoneNumber);
    //     prefs.setString("token", user.token);

    // }

//     Future<User?> getUser() async {
//         final SharedPreferences prefs = await SharedPreferences.getInstance();

//         int? userId = prefs.getInt("userId") ;
//         String? firstName = prefs.getString("firstName");
//         String? middleName = prefs.getString("middleName");
//         String? otherNames = prefs.getString("otherNames");
//         String? email = prefs.getString("email");
//         int? phoneNumber = prefs.getInt("phoneNumber") ;
//         String? token= prefs.getString("token") ;

//         return
//             (token == null ) ? null : User(
//             userId  as int,
//             firstName as String,
//             middleName as String,
//             otherNames as String,
//             email as String,
//             phoneNumber as int,
//             token);
//     }

    // void removeUser() async {
    //     final SharedPreferences prefs = await SharedPreferences.getInstance();

    //     prefs.remove("userId");
    //     prefs.remove("firstName");
    //     prefs.remove("middleName");
    //     prefs.remove("otherNames");
    //     prefs.remove("email");
    //     prefs.remove("phoneNumber");
    //     prefs.remove("token");
//     }

//     Future<String> getToken(args) async {
//         final SharedPreferences prefs = await SharedPreferences.getInstance();
//         String token= prefs.getString("token") as String;
//         return token;
//     }
// }