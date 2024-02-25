import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/providers/medication.dart';
import 'package:flutter_travel_concept/screens/user_screens/notifications_screen.dart';
import 'package:flutter_travel_concept/util/medications.dart';
import 'package:flutter_travel_concept/util/places.dart';
import 'package:flutter_travel_concept/widgets/app-drawer.dart';
import 'package:flutter_travel_concept/widgets/user_widgets/VerticalMedItem.dart';
import 'package:flutter_travel_concept/widgets/user_widgets/icon_badge.dart';
import 'package:flutter_travel_concept/widgets/user_widgets/searchBarType.dart';
import 'package:flutter_travel_concept/widgets/user_widgets/vertical_place_item.dart';

class AvaMedPharScreen extends StatelessWidget {
  static String routeName = 'AvaMedPharScreen';
  const AvaMedPharScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: const Text('pharamacies List'),
        actions: const <Widget>[
          //   IconButton(
          //     icon: IconBadge(
          //       icon: Icons.notifications_none,
          //       color: const Color.fromARGB(238, 255, 255, 255),
          //       key: const ValueKey(2),
          //       size: 24.0,
          //     ),
          //     onPressed: () {
          //        Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (BuildContext context) {
          //         return NotificationsApp() ;
          //       },
          //     ),
          //   );
          // },
          //   ),
        ],
      ),
      body: ListView(
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: 20.0,
            ),
          ),
          //searchBarType(text: '',hintText:"search in favourites"),
          Text('your med available in 3 pharamacies',
          textAlign: TextAlign.center,style: TextStyle(fontSize: 17),),  
          Padding(
            padding: EdgeInsets.only(
              bottom: 20.0,
            ),
          ),
         // buildVerticalList(),
        ],
      ),
    );
  }

  // buildVerticalList() {
  //   return Padding(
  //     padding: const EdgeInsets.all(20.0),
  //     child: ListView.builder(
  //       primary: false,
  //       physics: const NeverScrollableScrollPhysics(),
  //       shrinkWrap: true,
  //       itemCount: medicationsAvaInPh == null ? 0 : medicationsAvaInPh.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         Medication medication = medicationsAvaInPh[index];
  //         return VerticalMedItem(med: medication);
  //       },
  //     ),
  //   );
  // }
}
