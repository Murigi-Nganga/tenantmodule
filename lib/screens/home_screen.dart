
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tenantmodule/screens/explore_screen.dart';
import 'package:tenantmodule/theme/app_theme.dart';
import 'package:tenantmodule/widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
    const HomeScreen({Key? key}) : super(key: key);

    static const routeName = '/home';

    bool get isATenant {
      int randomNum = Random().nextInt(2);
      return randomNum == 0 ? true : false;
    }


    @override
    Widget build(BuildContext context) {
       
        return Scaffold(
            appBar: AppBar(
                title: const Text('Home'),
                centerTitle: true,
            ),
            drawer: const AppDrawer(),
            body: isATenant ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const <Widget>[
                                  CircleAvatar(
                                      backgroundImage: AssetImage('assets/images/background_image.jpg'),
                                      radius: 40,
                                  ),
                                  Text('Welcome John Doe'),
                              ],
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                // color: appColors['PrimaryColorDark'],
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                        appColors['SecondaryColorDark'] as Color,
                                        appColors['PrimaryColor'] as Color,
                                    ]
                                ),
                                borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Text(
                                'We note that you are yet to register as a tenant in one of our amazing properties. \n \n'
                                'And we can’t wait for you to feel at home',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                ),
                            ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .6,
                          child: ElevatedButton(
                              onPressed: (){
                                  Navigator.pushReplacementNamed(context, ExploreScreen.routeName);
                              },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: const <Widget>[
                                      Text('Explore'),
                                      Icon(
                                          Icons.explore,
                                          color: Colors.white,
                                      ),
                                  ],
                              ),
                          ),
                        ),
                    ],
                 ),
            ) :
            const Center(child: Text('You are logged in!'))
        );
    }
}