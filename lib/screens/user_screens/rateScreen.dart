
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarPackage extends StatefulWidget {
  const RatingBarPackage();

  @override
  State<RatingBarPackage> createState() => _RatingBarPackageState();
}

class _RatingBarPackageState extends State<RatingBarPackage> {
  double? rating;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text("Rating Bar"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$rating"),
            RatingBar.builder(
                unratedColor: Colors.grey,
                itemCount: 5,
                allowHalfRating: true,
                glow: false,
                tapOnlyMode: true,
                itemBuilder: (context, index) => Icon(
                      Icons.star,
                    ),
                onRatingUpdate: (val) {
                  rating = val;
                  setState(() {});
                  print(val);
                })
          ],
        ),
      ),
    );
  }
}