import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/providers/medication.dart';
import 'package:flutter_travel_concept/providers/pharamacy.dart';

import 'package:flutter_travel_concept/providers/medications.dart';
import 'package:flutter_travel_concept/providers/pharmacies.dart';
import 'package:flutter_travel_concept/screens/user_screens/ph_profile_screen.dart';
import 'package:flutter_travel_concept/util/medications.dart';
import 'package:flutter_travel_concept/util/pharamicies.dart';


import 'package:flutter_travel_concept/util/places.dart';
import 'package:flutter_travel_concept/widgets/user_widgets/icon_badge.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  static const routeName = 'med-detail';
  Details();

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool switchFavourite = false;

  @override
  Widget build(BuildContext context) {
    final medId = ModalRoute.of(context)!.settings.arguments as String;
    print(medId);
    final Med = Provider.of<Medications>(context,listen: false).findById(medId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text(Med.med_name),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: IconBadge(
              icon: Icons.notifications_none,
              color: const Color.fromARGB(238, 255, 255, 255),
              key: const ValueKey(2),
              size: 24.0,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 10.0),
          buildSlider(Med),
          const SizedBox(height: 20),
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      Med.med_name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      switchFavourite ? Icons.favorite : Icons.favorite_border,
                    ),
                    onPressed: () {
                      setState(() {
                        switchFavourite = !switchFavourite;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.local_pharmacy,
                    size: 20,
                    color: Colors.blueGrey[300],
                  ),
                  const SizedBox(width: 3),
                  TextButton(
                    child: Text(
                      Med.ph_name,
                      style: const TextStyle(
                          fontSize: 20, decoration: TextDecoration.underline),
                    ),
                    //style: ButtonStyle(textStyle: ),
                    onPressed: () {
                      ///Map pharms = pharmacies[0];
                      //Pharamacy phar=Provider.of<Pharmacies>(context,listen: false).findById(Med.ph_id);
                      Navigator.of(context).pushNamed(phProfileScreen.routeName, arguments: Med.id);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    size: 14,
                    color: Colors.blueGrey[300],
                  ),
                  const SizedBox(width: 3),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      Med.ph_location.address,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.blueGrey[300],
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  Med.med_price.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "indications",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  Med.med_description,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 10.0),
             // const SizedBox(height: 40),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "The side effects",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('-  '+
                  Med.med_description,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(
      //     Icons.airplanemode_active,
      //   ),
      //   onPressed: () {},
      // ),
    );
  }

  buildSlider(Medication Med) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      height: 250.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: medications == null ? 0 : medications.length,
        itemBuilder: (BuildContext context, int index) {
          // Map med = medications[index];

          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                Med.img_path,
                height: 250.0,
                width: MediaQuery.of(context).size.width - 40.0,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }



}
