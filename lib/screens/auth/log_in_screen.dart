import 'package:flutter/material.dart';
import 'package:tenantmodule/screens/home_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();

  static const routeName = '/login';
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
                width: MediaQuery.of(context).size.width * .7,
                child: ElevatedButton(
                        child: const Text('To Home Screen'),
                        onPressed: () {
                             Navigator.pushNamed(context, HomeScreen.routeName);
                        },
              ),
      )),
      // body: SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: SingleChildScrollView(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         children: <Widget>[
      //           const Icon(Icons.wb_incandescent_rounded),
      //           Row(
      //             children: const <Widget>[
      //               Text('Sign'),
      //               Text('In'),
      //             ],
      //           ),
      //           Form(
      //             child: Column(
      //               children: <Widget>[
      //                 TextFormField(
      //                   textInputAction: TextInputAction.next,
      //                   keyboardType: TextInputType.emailAddress,
      //                   decoration: const InputDecoration(
      //                     labelText: 'Email Address',
      //                     prefixIcon: Icon(Icons.email),
      //                   ),
      //                 ),
      //                 const SizedBox(height: 20,),
      //                 TextFormField(
      //                   textInputAction: TextInputAction.next,
      //                   keyboardType: TextInputType.number,
      //                   decoration: const InputDecoration(
      //                     labelText: 'ID Number',
      //                     prefixIcon: Icon(Icons.numbers),
      //                   ),
      //                 ),
      //                 const SizedBox(height: 20,),
      //                 TextFormField(
      //                   textInputAction: TextInputAction.done,
      //                   keyboardType: TextInputType.number,
      //                   decoration: const InputDecoration(
      //                     labelText: 'ID Number',
      //                     prefixIcon: Icon(Icons.numbers),
      //                   ),
      //                 ),
      //                 const SizedBox(height: 20,),
      //
      //               ],
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
