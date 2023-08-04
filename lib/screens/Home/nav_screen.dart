import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:home_berry/network/api.dart';
import 'package:home_berry/screens/Home/home.dart';
import 'package:home_berry/screens/Home/profile_details.dart';
import 'package:home_berry/screens/Login.dart';
import 'package:home_berry/screens/favorite/favorite_screen.dart';
import 'package:home_berry/screens/search/search_screen.dart';
import 'package:provider/provider.dart';

class Nav_Home extends StatefulWidget {
  @override
  _Nav_HomeState createState() => _Nav_HomeState();
}

class _Nav_HomeState extends State<Nav_Home> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int nav_index = 0;

  Future _future;

  Future<void> prepareData() async {
    var access = Provider.of<Api>(context, listen: false);
     await access.getAccess();
  }

  @override
  void initState() {
    _future = prepareData();
    super.initState();
  }


  final screens = [
    HomePage(),
    Search_Screen(),
    Favorite_Screen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.search, size: 30),
      Icon(Icons.favorite, size: 30),
      Icon(Icons.person, size: 30),
      // Icon(Icons.settings, size: 30),
    ]; // <Widget>[]
    return SafeArea(
      child: Scaffold(
        body: screens[nav_index],
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.grey.withOpacity(0.5),
          buttonBackgroundColor: Color(0xFFF9A537),
          backgroundColor: Colors.white,
          items: items,
          index: nav_index,
          height: 50,
          onTap: (index) => setState(() => this.nav_index = index),
        ),
      ),
    );
  }
}
