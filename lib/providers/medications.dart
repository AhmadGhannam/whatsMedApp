import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/providers/medication.dart';
import 'package:flutter_travel_concept/models/location.dart';

class Medications with ChangeNotifier {
  final List<Medication> _medications = [
    Medication(
        id: '1',
        user_id: '25',
        ph_id: '36',
        med_name: 'Mecozalyn',
        med_price: 3052,
        med_description: 'for Sickers',
        img_path:
            'https://scontent-hbe1-1.xx.fbcdn.net/v/t31.18172-8/13217310_1035916146489394_4032671442679176205_o.jpg?_nc_cat=101&ccb=1-7&_nc_sid=9267fe&_nc_ohc=Rswp4sF8AfMAX8E1SJS&_nc_ht=scontent-hbe1-1.xx&oh=00_AfBla9yJcW6KUBWcozvkbkEHMhFAiV6cyJMhdUp8uWouSQ&oe=651C1419',
        ph_location: Location(address: 'Midan Damas',latitude:36.470000,longitude: 37.258763),
        ph_name: 'Alhakawati'),
    Medication(
        id: '2',
        user_id: '34',
        ph_id: '56',
        med_name: 'panadol 500mg',
        med_price: 6000,
        med_description: 'Effective Pain Relif',
        img_path:
            'https://i-cf65.ch-static.com/content/dam/cf-consumer-healthcare/panadol-reborn/en_IE/product-detail/panadol-advance-compack-16/Panadol-Base-24s-(3D).png?auto=format',
        ph_location:  Location(address: 'shaghor',latitude:36.4705400,longitude: 37.3259),
        ph_name: 'Al Ghannam'),
    Medication(
        id: '3',
        user_id: '32',
        ph_id: '13',
        med_name: 'panadol Extra',
        med_price: 7800,
        med_description: 'Advance',
        img_path:
            'https://www.panadol.com/content/dam/cf-consumer-healthcare/panadol-reborn/en_IE/product-detail/panadol-extra-advance-box-32/Panadol-Extra-Advance-Box-32s380x463.png',
        ph_location: Location(address: 'Affef Damas',latitude:36.470345,longitude: 37.2343),
        ph_name: 'QWER'),
  ];

  var _showFavouriteOnly = false;
  List<Medication> get getMedications {
    if (_showFavouriteOnly) {
      return _medications.where((medicationItem) => medicationItem.isFavourite).toList();
    }
    return [..._medications];
    //we doing this because when i press on prod this
    //will edit  a reference not the original array
  }

  void showFavouritesOnly() {
    _showFavouriteOnly = true;
    //notifyListeners();
  }

  void showAll() {
    _showFavouriteOnly = false;
    notifyListeners();
  }

  Medication findById(String id) {
    return getMedications.firstWhere((med) => med.id == id);
  }
}
