

import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/providers/medication.dart';
import 'package:flutter_travel_concept/providers/medications.dart';
import 'package:flutter_travel_concept/screens/user_screens/notifications_screen.dart';
import 'package:flutter_travel_concept/screens/user_screens/search_page.dart';
import 'package:flutter_travel_concept/util/medications.dart';
import 'package:flutter_travel_concept/util/places.dart';
import 'package:flutter_travel_concept/widgets/app-drawer.dart';
import 'package:flutter_travel_concept/widgets/user_widgets/VerticalMedItem.dart';
import 'package:flutter_travel_concept/widgets/user_widgets/horizontal_place_item.dart';
import 'package:flutter_travel_concept/widgets/user_widgets/icon_badge.dart';
import 'package:flutter_travel_concept/widgets/user_widgets/search_bar.dart';
import 'package:flutter_travel_concept/widgets/user_widgets/vertical_place_item.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            color: const Color.fromARGB(255, 255, 255, 255),
            // key: const ValueKey(2),
            // size: 24.0
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return searchPage(
                      text: '',
                    );
                  },
                ),
              );
            },
          ),
          IconButton(
            icon: IconBadge(
              icon: Icons.notifications_none,
              color: const Color.fromARGB(238, 255, 255, 255),
              key: const ValueKey(2),
              size: 24.0,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return NotificationsApp();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "scan your medication box",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(218, 83, 77, 77)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: searchBar(),
          ),
          //buildHorizontalList(context),
          buildVerticalList(context),
        ],
      ),
    );
  
  
  
  }

  buildHorizontalList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0, left: 20.0),
      height: 250.0,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: places == null ? 0 : places.length,
        itemBuilder: (BuildContext context, int index) {
          Map place = places.reversed.toList()[index];
          return HorizontalPlaceItem(place: place);
        },
      ),
    );
  }

  buildVerticalList(BuildContext context) {
    final medData = Provider.of<Medications>(context).getMedications;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: medData == null ? 0 : medData.length,
        itemBuilder: (BuildContext context, int index) {
          Medication med = medData[index];
          return ChangeNotifierProvider.value(
           // create: (ctx)=>med,
            value: med,
            child: VerticalMedItem(),);
        },
      ),
    );
  }
}
