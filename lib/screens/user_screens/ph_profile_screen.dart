import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_travel_concept/providers/pharamacy.dart';
import 'package:flutter_travel_concept/providers/pharmacies.dart';
import 'package:flutter_travel_concept/screens/helpers/location_helper.dart';
import 'package:flutter_travel_concept/screens/user_screens/ph_Maps_screen.dart';
import 'package:flutter_travel_concept/util/pharamicies.dart';
import 'package:flutter_travel_concept/util/places.dart';
import 'package:flutter_travel_concept/util/reviews.dart';
import 'package:flutter_travel_concept/widgets/user_widgets/icon_badge.dart';
import 'package:flutter_travel_concept/widgets/user_widgets/review.dart';
import 'package:flutter_travel_concept/widgets/user_widgets/vertical_place_item.dart';
import 'package:provider/provider.dart';

class phProfileScreen extends StatefulWidget {
  static String routeName = 'phprofilescreen';

  phProfileScreen();

  @override
  State<phProfileScreen> createState() => _phProfileScreenState();
}

class _phProfileScreenState extends State<phProfileScreen> {
  TextEditingController _commentController = TextEditingController();

  TextEditingController _reportController = TextEditingController();

  double? rating;

  String _previewImageUrl = '';
  double longitude = 0.0;
  double latitude = 0.0;
  int ZoomIn = 2;

  Future<void> _getCurrentUserLocation() async {
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
        latitude: latitude, longitude: longitude, zoomIn: ZoomIn);
    setState(() {
      _previewImageUrl = staticMapImageUrl;
      print(_previewImageUrl);
    });
  }

  @override
  void initState() {
    // _getCurrentUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pharId = ModalRoute.of(context)!.settings.arguments as String;
    print(pharId);
    final Phar =
        Provider.of<Pharmacies>(context, listen: false).findById(pharId);

    latitude = Phar.ph_location.latitude;
    longitude = Phar.ph_location.longitude;
    _getCurrentUserLocation();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text(Phar.ph_name),
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
          buildSlider(Phar),
          const SizedBox(height: 20),
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              Row(
                //rmainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Container(
                  //   alignment:

                  Icon(
                    Icons.local_pharmacy,
                    size: 20,
                    color: Colors.blueGrey[300],
                  ),
                  const SizedBox(
                      width: 3), //Padding(padding: EdgeInsets.only(left: 20)),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      Phar.ph_name,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),

                  // ),
                  // IconButton(
                  //   icon: Icon(
                  //     switchFavourite ? Icons.favorite : Icons.favorite_border,
                  //   ),
                  //   onPressed: () {
                  //     setState(() {
                  //       switchFavourite = !switchFavourite;
                  //     });
                  //   },
                  // ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              IgnorePointer(
                ignoring: true,
                child: RatingBar.builder(
                  //itemSize: 50,
                  initialRating: Phar.ratingPhar,
                  unratedColor: Colors.grey,
                  //glowColor: Colors.grey,
                  itemCount: 5,
                  itemSize: 23,
                  allowHalfRating: true,
                  glow: false,
                  tapOnlyMode: true, //Colors.amber,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 3,
                  ),
                  onRatingUpdate: (double value) {
                    // value = 3;
                  },
                ),
              ),

              Row(
                children: [],
              ),
              SizedBox(
                height: 5,
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
                      Phar.ph_location.address,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.blueGrey[300],
                      ),
                      maxLines: 1,
                      // textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(width: 13),
                  Container(
                    // alignment: Alignment.centerLeft,
                    child: TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return StatefulBuilder(builder:
                                  (BuildContext context, StateSetter setState) {
                                return AlertDialog(
                                  title: Text('pharmacy Location'),
                                  content: // SingleChildScrollView(
                                      //child:
                                      Column(
                                    children: [
                                      _previewImageUrl.isEmpty
                                          ? Text('dadadad')
                                          : SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.6165,
                                           child: Stack(
                                              children: [
                                                Image.network(
                                                  _previewImageUrl,
                                                  width: double
                                                      .infinity, // Adjust the width to fit your image
                                                  height:
                                                      360, // Adjust the height to fit your image
                                                  fit: BoxFit.cover,
                                                ),
                                                Positioned(
                                                    bottom:
                                                        16, // Adjust the position of the button as per your requirement
                                                    right:
                                                        16, // Adjust the position of the button as per your requirement
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          width: 48.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape: BoxShape
                                                                .rectangle,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            color: Colors.grey,
                                                          ),
                                                          child: IconButton(
                                                            onPressed: () {
                                                              if (ZoomIn < 20) {
                                                                ZoomIn++;
                                                                setState(() {
                                                                  final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
                                                                      latitude:
                                                                          latitude,
                                                                      longitude:
                                                                          longitude,
                                                                      zoomIn:
                                                                          ZoomIn);
                                                                  // setState(() {
                                                                  _previewImageUrl =
                                                                      staticMapImageUrl;
                                                                  // print(_previewImageUrl);
                                                                  // });
                                                                });
                                                              }
                                                            },
                                                            icon: const Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white),
                                                            //   style: SizedBox(height: 3,),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          width: 48.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape: BoxShape
                                                                .rectangle,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            color: Colors.grey,
                                                          ),
                                                          child: IconButton(
                                                            onPressed: () {
                                                              if (ZoomIn > 1) {
                                                                ZoomIn--;
                                                                setState(() {
                                                                  final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
                                                                      latitude:
                                                                          latitude,
                                                                      longitude:
                                                                          longitude,
                                                                      zoomIn:
                                                                          ZoomIn);
                                                                  //  setState(() {
                                                                  _previewImageUrl =
                                                                      staticMapImageUrl;
                                                                  //print(_previewImageUrl);
                                                                  // });
                                                                });
                                                              }
                                                            },
                                                            icon: const Icon(
                                                              Icons.minimize,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                              ],
                                            ),),
                                      TextButton(
                                        child: Text('close'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  ),
                                  //),
                                  actions: [],
                                );
                              });
                            },
                          );
                        },
                        child: const Text('view on map')),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              // Container(
              //   alignment: Alignment.centerLeft,
              //   child: Text(
              //  //   widget.price.toString(),
              //     style: const TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 17,
              //     ),
              //     maxLines: 1,
              //     textAlign: TextAlign.left,
              //   ),
              // ),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Working Times",
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
                  Phar.workingTimes,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 20.0),

              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Rate this pharmacy'),
                        content: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                controller: _commentController,
                                style: const TextStyle(
                                  fontSize: 15.0,
                                  color: Color.fromARGB(255, 39, 48, 53),
                                ),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(10.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 255, 0, 0),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.blueGrey,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  hintText: 'type your comment here',
                                  // labelText: "sdfsdf",
                                  prefixIcon: Icon(
                                    Icons.comment,
                                    color: Colors.blueGrey[300],
                                  ),
                                  // focusedBorder: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.blueGrey[300],
                                  ),
                                ),
                                maxLines: 1,
                              ),
                              const SizedBox(height: 30),
                              RatingBar.builder(
                                //itemSize: 50,
                                unratedColor: Colors.grey,
                                //glowColor: Colors.grey,
                                itemCount: 5,
                                itemSize: 30,
                                allowHalfRating: true,
                                glow: false,
                                tapOnlyMode: true, //Colors.amber,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  // size: 3,
                                ),
                                onRatingUpdate: (val) {
                                  rating = val;
                                  setState(() {});
                                  print(val);
                                },
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // Perform some action
                              Navigator.of(context).pop();
                            },
                            child: const Text('Close'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Perform some action
                              print(_commentController.text);
                              print(rating);
                              Navigator.of(context).pop();
                            },
                            child: const Text('Submit'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.green[400]),
                child: const Text('Rate this pharmacy'),

              ),

              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.red[400]),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Your Report'),
                        content: TextField(
                          controller: _reportController,
                          style: const TextStyle(
                            fontSize: 15.0,
                            color: Color.fromARGB(255, 39, 48, 53),
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 255, 0, 0),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.blueGrey,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            hintText: 'type your report',
                            // labelText: "sdfsdf",
                            prefixIcon: Icon(
                              Icons.report,
                              color: Colors.blueGrey[300],
                            ),
                            // focusedBorder: InputBorder.none,
                            hintStyle: TextStyle(
                              fontSize: 15.0,
                              color: Colors.blueGrey[300],
                            ),
                          ),
                          maxLines: 1,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // Perform some action
                              Navigator.of(context).pop();
                            },
                            child: const Text('Close'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Perform some action
                              print(_reportController.text);
                              //print(rating);
                              Navigator.of(context).pop();
                            },
                            child: const Text('Report'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text(
                  'Report this pharamacy',
                ),
              ),

              const SizedBox(height: 10),

              buildVerticalList(),
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

  buildSlider(Pharamacy Phar) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      height: 250.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: pharmacies == null ? 0 : 1,
        itemBuilder: (BuildContext context, int index) {
          //Map phar = pharmacies[index];
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                Phar.imgPath,
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

  buildVerticalList() {
    // _performSearch();
    // print(widget.searchEnter);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: places == null ? 0 : places.length,
        itemBuilder: (BuildContext context, int index) {
          Map place = places[index];
          return VerticalPlaceItem(place: place);
        },
      ),
    );
  }
}
