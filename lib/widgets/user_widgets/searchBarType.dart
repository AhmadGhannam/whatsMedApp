import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/screens/user_screens/search_page.dart';
import 'package:location/location.dart';

class searchBarType extends StatefulWidget {
  bool searchEnter = false;
  final String text;
  final String hintText;
  searchBarType({required this.text, required this.hintText});
  @override
  State<searchBarType> createState() => _searchBarTypeState();
}

class _searchBarTypeState extends State<searchBarType> {
  //final TextEditingController _searchControl = new TextEditingController();

  TextEditingController _searchController = TextEditingController();
  String _searchText = '';
  late bool searchEnter;
  @override
  void initState() {
    // TODO: implement initState
    _searchController = TextEditingController(text: widget.text);
    super.initState();
  }



  void _performSearch() {
    setState(() {
      searchPage(
        text: '',
      );
      //  _searchController=  TextEditingController(text: widget.text);
      _searchText = widget.text;
    });
  }

  Future<void> _getCurrentUserLocation() async {
    print('locData');
    final locData = await Location().getLocation();

    print(locData.longitude);
    print(locData.latitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Color.fromARGB(255, 39, 48, 53),
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: widget.hintText,
                    // labelText: "sdfsdf",
                    prefixIcon: Icon(
                      Icons.medication_outlined,
                      color: Colors.blueGrey[300],
                    ),
                    hintStyle: TextStyle(
                      fontSize: 15.0,
                      color: Colors.blueGrey[300],
                    ),
                  ),
                  maxLines: 1,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  _performSearch();
                  print(_searchController.text);
                  _getCurrentUserLocation();
                },
              ),
            ],
          ),
        ),
        const Divider(),
        _searchText.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                  itemCount: 10, // Replace with actual item count
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Result $index'),
                    );
                  },
                ),
              )
            : const Center(
                child: Text('Enter a search term and press search.'),
              ),
      ],
    );
  }
}
