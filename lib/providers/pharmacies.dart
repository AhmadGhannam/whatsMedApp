import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/providers/pharamacy.dart';
import 'package:flutter_travel_concept/providers/review.dart';
import 'package:flutter_travel_concept/models/location.dart';

class Pharmacies with ChangeNotifier {
  final List _pharamacies = [
    Pharamacy(
        id: '1',
        user_id: '23',
        ph_name: 'Alhakawati',
        ratingPhar: 4.5,
        ph_location: Location(address: 'Midan Damas',latitude:40.847635,longitude: 28.965915),
        workingTimes: 'every Day',
        imgPath:
            'https://thumb.spokesman.com/fVg0TJdk5baL-9c2y7GJSVr_mwU=/1200x800/smart/media.spokesman.com/photos/2023/01/30/63d30542167bb.hires.jpg',
            reviews:[
              Review(id: '1', ph_id: '1', user_id: '33', comment: 'gooood', rating: 4, commentDate: '12-12-2020'),
              Review(id: '2', ph_id: '1', user_id: '11', comment: 'not bad', rating: 3, commentDate: '1-1-2020')
            ]),
    Pharamacy(
        id: '2',
        user_id: '55',
        ph_name: 'AlGhannam',
        ratingPhar: 2.5,
        ph_location: Location(address: 'shaghor',latitude:33.517444,longitude: 36.297834),
        workingTimes: 'everyDay',
        imgPath:
            'https://media.istockphoto.com/id/1325914490/photo/modern-pharmacy-drugstore-with-shelves-full-of-packages-full-of-modern-medicine-drugs-vitamin.jpg?s=612x612&w=0&k=20&c=3rPGVZAfxEvdAFvxo_NrKu4XCcT5ggHaz-s5kVW24_g=',
            reviews: [
              Review(id: '2', ph_id: '2', user_id: '33', comment: 'baaad', rating: 1, commentDate: '20-10-2020')
            ]),
    Pharamacy(
        id: '3',
        user_id: '44',
        ph_name: 'QWER',
        ratingPhar: 1.5,
        ph_location: Location(address: 'Affef Damas',latitude:36.434053,longitude: 28.224706),
        workingTimes: 'Every Day',
        imgPath:
            'https://www.cbh.ps/storage/1170-450/images/banners/1575360316767820332.jpg',
            reviews: [
              Review(id: '3', ph_id: '3', user_id: '55', comment: 'perfect', rating: 5, commentDate: '11-05-2020')
            ]
    ),
  ];

  List<Pharamacy> get getPharamacies {
    return [..._pharamacies];
  }

  Pharamacy findById(String id){
    return getPharamacies
        .firstWhere((ph) => ph.id == id);
  }


}
