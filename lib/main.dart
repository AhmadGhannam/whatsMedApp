import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/providers/medications.dart';
import 'package:flutter_travel_concept/providers/pharmacies.dart';
import 'package:flutter_travel_concept/screens/login_screen.dart';
import 'package:flutter_travel_concept/screens/phar_screens/PharSignupScreen.dart';
import 'package:flutter_travel_concept/screens/userOrPharScreen.dart';
import 'package:flutter_travel_concept/screens/user_screens/ava_med_ph_screen.dart';
import 'package:flutter_travel_concept/screens/user_screens/details.dart';
import 'package:flutter_travel_concept/screens/user_screens/main_screen.dart';

import 'package:flutter_travel_concept/screens/user_screens/notifications_screen.dart';
import 'package:flutter_travel_concept/screens/user_screens/ph_Maps_screen.dart';
import 'package:flutter_travel_concept/screens/user_screens/ph_profile_screen.dart';
import 'package:flutter_travel_concept/screens/user_screens/rateScreen.dart';
import 'package:flutter_travel_concept/screens/user_screens/settings_screen.dart';
import 'package:flutter_travel_concept/screens/user_screens/userSignupScreen.dart';
import 'package:flutter_travel_concept/util/const.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (ctx) => Medications()),
        ChangeNotifierProvider.value(value: Pharmacies()),
       // ChangeNotifierProvider.value(value: phMapsScreen()),
      ],
      
    // value:  Medications(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
      home: MainScreen(),
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        MainScreen.routeName: (ctx) => MainScreen(),
        AvaMedPharScreen.routeName: (ctx) => AvaMedPharScreen(),
        phProfileScreen.routeName: (ctx) => phProfileScreen(),
        Details.routeName:(ctx)=>Details(),
        phMapsScreen.routeName:(ctx)=>phMapsScreen(),
        PhSignupScreen.routeName:(ctx)=>PhSignupScreen(),
        UserPharScreen.routeName:(ctx)=>UserPharScreen(),
        userSignupScreen.routename:(ctx)=>userSignupScreen(),
      },
    )
    );
  }
}
