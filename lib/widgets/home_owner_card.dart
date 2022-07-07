import 'package:flutter/material.dart';
import 'package:tenantmodule/screens/auth/log_in_screen.dart';
import 'package:tenantmodule/theme/app_theme.dart';

class HomeOwnerCard extends StatelessWidget {
    const HomeOwnerCard({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return InkWell(
            onTap: (){
                Navigator.pushNamed(context, LogInScreen.routeName);
            },
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: appColors['PrimaryColorDark'],
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const <Widget>[
                        CircleAvatar(
                            backgroundImage:  AssetImage('assets/images/background_image.jpg'),
                            radius: 25,
                        ),
                        Text('Mary Jane', style: TextStyle(color: Colors.white),),
                        Icon(Icons.keyboard_arrow_right, color: Colors.white,),
                    ]
                )
            ),
        );
    }
}
