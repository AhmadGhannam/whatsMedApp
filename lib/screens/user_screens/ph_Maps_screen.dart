import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/providers/pharmacies.dart';
import 'package:flutter_travel_concept/screens/helpers/location_helper.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class phMapsScreen extends StatefulWidget {
   phMapsScreen({super.key});
  static const routeName = 'ph_maps';



  @override
  State<phMapsScreen> createState() => _phMapsScreenState();
}

class _phMapsScreenState extends State<phMapsScreen> {
  String _previewImageUrl = '';
  double longitude = 0.0;
  double latitude = 0.0;

  // String apiKey = 'YOUR_BING_MAPS_API_KEY';
  // double centerLatitude = 34.204482;
  // double centerLongitude = 39.043569;
  // int zoomLevel = 10;
  // int width = 500;
  // int height = 500;

  // String pushpinIcon =
  //     'https://image.flaticon.com/icons/png/128/1237/1237946.png'; // URL of the pushpin icon
  // double myLocationLatitude = 34.123456; // Example latitude for user's location
  // double myLocationLongitude =
  //     39.654321; // Example longitude for user's location

  // final String apiUrl =
  //     'https://dev.virtualearth.net/REST/v1/Imagery/Map/Road/34.204482,39.043569/7?mapSize=500,500&pushpin=34.123456,39.654321;64;https://media.istockphoto.com/id/1193451471/fr/vectoriel/carte-pin-vector-glyph-icon.jpg?s=612x612&w=0&k=20&c=C94WAFWyatJWYfaZsxmoERJz0NMGu5pglXy1tveSNkI=&key=AmeugOit994E0f1q6xxfc_6GVEHyLFV5Qeg_svNwn_GBnfsuOlPck93Jo6r-oc_z';

  var ZoomIn = 17;
  Future<void> _getCurrentUserLocation() async {
    print('locData');
    final locData = await Location().getLocation();
    print(locData.longitude);
    print(locData.latitude);
    longitude = locData.longitude!;
    latitude = locData.latitude!;
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
        latitude: latitude, longitude: longitude, zoomIn: ZoomIn);
    setState(() {
      _previewImageUrl = staticMapImageUrl;
      print(_previewImageUrl);
    });
  }

  @override
  void initState() {
    _getCurrentUserLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // final pharId = ModalRoute.of(context)!.settings.arguments as String;
    // print(pharId);
    // final Phar =
    //     Provider.of<Pharmacies>(context, listen: false).findById(pharId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text('ph_Maps'),
      ),
      body: Column(
        children: [
          // _previewImageUrl == ''
          //     ? Text('data')
          //     : Image.network(
          //         _previewImageUrl,
          //         fit: BoxFit.cover,
          //         width: double.infinity,
          //         // key: ValueKey(1),
          //       ),
       _previewImageUrl.isEmpty
    ? Text('data')
    : SizedBox(
        height: MediaQuery.of(context).size.height * 0.783, // Adjust the height to fit your image
        child: Stack(
          children: [
            Image.network(
              _previewImageUrl,
              width: double.infinity, // Adjust the width to fit your image
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 16, // Adjust the position of the button as per your requirement
              right: 16, // Adjust the position of the button as per your requirement
              child: Column(
                children: [
                  Container(
                    width: 48.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey,
                    ),
                    child: IconButton(
                      onPressed: () {
                        if (ZoomIn < 20) {
                          ZoomIn++;
                          setState(() {
                            final staticMapImageUrl = LocationHelper
                                .generateLocationPreviewImage(
                              latitude: latitude,
                              longitude: longitude,
                              zoomIn: ZoomIn,
                            );
                            _previewImageUrl = staticMapImageUrl;
                          });
                        }
                      },
                      icon: const Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 48.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey,
                    ),
                    child: IconButton(
                      onPressed: () {
                        if (ZoomIn > 1) {
                          ZoomIn--;
                          setState(() {
                            final staticMapImageUrl = LocationHelper
                                .generateLocationPreviewImage(
                              latitude: latitude,
                              longitude: longitude,
                              zoomIn: ZoomIn,
                            );
                            _previewImageUrl = staticMapImageUrl;
                          });
                        }
                      },
                      icon: Icon(
                        Icons.minimize,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
          // Container(
          //   width: 48.0,
          //   height: 48.0,
          //   decoration: BoxDecoration(
          //     shape: BoxShape.rectangle,
          //     borderRadius: BorderRadius.circular(8.0),
          //     color: Colors.grey,
          //   ),
          //   child: IconButton(
          //     onPressed: () {},
          //     icon: Icon(Icons.add, color: Colors.white),
          //   ),
          // ),
          // ElevatedButton(onPressed: () {}, child: Text('ZoomOut')),
          // ElevatedButton(onPressed: () {}, child: Text('ZoomIn')),
          //  SingleChildScrollView(child:

          // SingleChildScrollView(
          //     child: SizedBox(
          //   height: 400, // Provide a specific height here
          //   child: Column(
          //     children: [
          //       Expanded(
          //           child: WebView(
          //         initialUrl: 'https://www.bing.com/maps',
          //         javascriptMode: JavascriptMode.unrestricted,
          //         onPageFinished: (String url) {
          //           _addMapIcon();
          //         },
          //       )),
          //     ],
          //   ),
          // ))
        ],
      ),
    );
  }
}
