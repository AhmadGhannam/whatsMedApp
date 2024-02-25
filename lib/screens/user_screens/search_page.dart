import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/screens/user_screens/ph_Maps_screen.dart';
import 'package:flutter_travel_concept/util/places.dart';
import 'package:flutter_travel_concept/widgets/user_widgets/searchBarType.dart';
import 'package:flutter_travel_concept/widgets/user_widgets/vertical_place_item.dart';

class searchPage extends StatefulWidget {
  final String text;

  searchPage({required this.text});
  // bool get getsearchEnter => searchEnter;
  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> with ChangeNotifier {
  void changesearchEnter(bool newval) {
    //   widget.searchEnter = true;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const <Widget>[
          // IconButton(
          //   icon: const Icon(Icons.dangerous_outlined),
          //   color: const Color.fromARGB(255, 255, 255, 255),
          //   // key: const ValueKey(2),
          //   // size: 24.0
          //   onPressed: () {
          //     // Navigator.of(context).push(
          //     //   MaterialPageRoute(
          //     //     builder: (BuildContext context) {
          //     //       return searchPage();
          //     //     },
          //     //   ),
          //     // );
          //   },
          // ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "type a name of your medication",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: searchBarType(
              text: widget.text,hintText: "E.g: panadol",
            ),
          ),
          //  buildHorizontalList(context),
          // print( widget.searchEnter),
          TextButton(onPressed: (){
             Navigator.of(context).pushNamed(phMapsScreen.routeName);
          }, child: Text('jhgjhjhgjh')),
          buildVerticalList()
        ],
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
