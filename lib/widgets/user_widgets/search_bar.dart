import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/screens/user_screens/details.dart';

import 'package:flutter_travel_concept/widgets/user_widgets/OCRScreen.dart';

class searchBar extends StatelessWidget {
  final TextEditingController _searchControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: 300,
            decoration: BoxDecoration(
              color: Colors.blueGrey[50],
              borderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            child: IconButton(
              onPressed: () {
                //     onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return OCRScreen();
                    },
                  ),
                );
              },
              // print('hiii scan');

              //},
              icon: const Icon(Icons.camera_alt),
            ),
          ),
        )
      ],
    );
  }
}
