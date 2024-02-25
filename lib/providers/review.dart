import 'package:flutter/material.dart';

class Review with ChangeNotifier {
  final String id;
  final String ph_id;
  final String user_id;
  final String comment;
  final double rating;
  final String commentDate;
  Review({
    required this.id,required this.ph_id,required this.user_id,required this.comment,required this.rating,
    required this.commentDate
  });
}
