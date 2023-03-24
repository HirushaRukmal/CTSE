import 'package:flutter/material.dart';
import 'package:kind_heart/screens/dashboard/dashboard.dart';
import 'package:kind_heart/screens/donationManagement/listDonation.dart';

import 'package:kind_heart/screens/main/home.dart';
import 'package:kind_heart/screens/placeManagement/listplace.dart';
import 'package:kind_heart/screens/postManagement/postListNew.dart';
import 'package:kind_heart/screens/userManagement/profile.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    ListDonation(),
    ListPlace(),
    PostList(),
    ProfileScreen(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Donation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Place',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      ),
    );
  }
}
