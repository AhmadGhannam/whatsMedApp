import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/providers/medication.dart';
import 'package:flutter_travel_concept/providers/medications.dart';
import 'package:flutter_travel_concept/screens/user_screens/notifications_screen.dart';
import 'package:flutter_travel_concept/util/places.dart';
import 'package:flutter_travel_concept/widgets/app-drawer.dart';
import 'package:flutter_travel_concept/widgets/user_widgets/VerticalMedItem.dart';
import 'package:flutter_travel_concept/widgets/user_widgets/icon_badge.dart';
import 'package:flutter_travel_concept/widgets/user_widgets/searchBarType.dart';
import 'package:flutter_travel_concept/widgets/user_widgets/vertical_place_item.dart';
import 'package:provider/provider.dart';

class favouriteScreen extends StatelessWidget {
  const favouriteScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text('favourites'),
        actions: <Widget>[
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
            padding: EdgeInsets.only(
              top: 20.0,
            ),
          ),
          searchBarType(text: '', hintText: "search in favourites"),
          const Padding(
            padding: EdgeInsets.only(
              bottom: 20.0,
            ),
          ),
          buildVerticalList(context),
        ],
      ),
    );
  }

  buildVerticalList(BuildContext context) {
    final medData = Provider.of<Medications>(context, listen: false);
     medData.showFavouritesOnly();
    final Meds =medData.getMedications;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: Meds == null ? 0 : Meds.length,
        itemBuilder: (BuildContext context, int index) {
          Medication med = Meds[index];
          return ChangeNotifierProvider.value(
            // create: (ctx)=>med,
            value: med,
            child: VerticalMedItem(),
          );
        },
      ),
    );
  }
}
