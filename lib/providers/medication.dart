import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/models/location.dart';

class Medication with ChangeNotifier {
  final String id;
  final String user_id;
  final String ph_id;
  final String med_name;
  final double med_price;
  final String med_description;
  final String img_path;
  final Location ph_location;
  final String ph_name;
  bool isFavourite; //we'll be changable after product created


  Medication({
    required this.id,required this.user_id,required this.ph_id,
    required this.med_name,required this.med_price
    ,required this.med_description,required this.img_path
    ,required this.ph_location,required this.ph_name,this.isFavourite=false
  });

   void toggleFavouriteStatus(/*String token, String userId*/) async {
    //print(token);
    final oldstatus = isFavourite;
    isFavourite = !isFavourite;
    notifyListeners();//to let all listeners know
    // final url =
    //     'https://flutter-app-82e44-default-rtdb.firebaseio.com/userFavourites/$userId/$id.json?auth=$token';
    // try {
    //   final res =
    //       await http.put(Uri.parse(url), body: json.encode(isFavourite));
    //   if (res.statusCode >= 400) {
    //     isFavourite = oldstatus;
    //     notifyListeners();
    //   }
    // } catch (error) {
    //   isFavourite = oldstatus;
    //   notifyListeners();
    // }
  }

  
  


}
