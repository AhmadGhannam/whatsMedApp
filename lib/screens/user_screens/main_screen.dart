import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/providers/medications.dart';
import 'package:flutter_travel_concept/screens/user_screens/details.dart';
import 'package:flutter_travel_concept/screens/user_screens/favourite_screen.dart';
import 'package:flutter_travel_concept/screens/user_screens/home.dart';
import 'package:flutter_travel_concept/screens/user_screens/ph_Maps_screen.dart';
import 'package:flutter_travel_concept/screens/user_screens/settings_screen.dart';
import 'package:flutter_travel_concept/widgets/user_widgets/icon_badge.dart';
import 'package:flutter_travel_concept/screens/login_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main_screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: this._page == 0
            ? List.generate(4, (index) => Home())
            : this._page == 1
                ? List.generate(4, (index) => favouriteScreen())
                : this._page == 2
                    ? List.generate(4, (index) => phMapsScreen())
                    : this._page == 3
                        ? List.generate(4, (index) => SettingsPage())
                        : List.generate(4, (index) => LoginScreen()),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(width: 7.0),
            barIcon(icon: Icons.home, page: 0),
            barIcon(
              icon: Icons.favorite,
              page: 1,
            ),
            barIcon(icon: Icons.map_outlined, page: 2, badge: false),
            barIcon(icon: Icons.settings, page: 3),
            const SizedBox(width: 7.0),
          ],
        ),
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }

  void navigationTapped(int page) {
    print(page);
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    //  this._page = widget.page;print(this._page);
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      print(page);
      this._page = page;
    });
  }

  Widget barIcon(
      {IconData icon = Icons.home, int page = 0, bool badge = false}) {
    Color lightAccent = const Color.fromARGB(2, 14, 199, 137);

    return IconButton(
      icon: badge
          ? IconBadge(
              icon: icon,
              color: const Color.fromARGB(237, 255, 0, 0),
              key: const ValueKey(2),
              size: 24.0)
          : Icon(icon, size: 24.0),
      color: _page == page
          ? const Color.fromARGB(236, 0, 0, 0)
          : Colors.blueGrey[300],
      onPressed: () {
        //print(page);
        if(page==0){
         final medData = Provider.of<Medications>(context, listen: false);
         medData.showAll();
        }
        _pageController.jumpToPage(page);
      },
    );
  }
}
