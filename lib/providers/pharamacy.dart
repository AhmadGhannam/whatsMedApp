import 'package:flutter/widgets.dart';
import 'package:flutter_travel_concept/providers/review.dart';

import 'package:flutter_travel_concept/models/location.dart';

class Pharamacy with ChangeNotifier {
  final String id;
  final String user_id;
  final String ph_name;
  final Location ph_location;
  final double ratingPhar;
  final String workingTimes;
  final String imgPath;
  final List<Review> reviews;
  //final String
  Pharamacy(
      {required this.id,
      required this.user_id,
      required this.ph_name,
      required this.ph_location,
      required this.ratingPhar,
      required this.workingTimes,
      required this.imgPath,
      required this.reviews});
}
