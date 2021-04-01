import 'package:flutter/material.dart';
import 'package:flutter_paw_care/const/color_padding.dart';
import 'beranda.dart';
import 'profile.dart';

//HomeScreen
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  //list tampilan buttom navigation bar
  final List<Widget> _childrenbody = [
    BerandaTab(),
    ProfileTab(),
    LainnyaTab(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _currentIndex == 0
            //title beranda
            ? Text('Beranda')
            : _currentIndex == 1
                //title Profile
                ? Text('Profile')
                //titile Lainnya
                : Text('Lainnya'),
        elevation: _currentIndex == 0
            //title beranda
            ? 1
            : _currentIndex == 1
                //title Profile
                ? 1
                //titile Lainnya
                : 0,
      ),
      body: _childrenbody[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'Lainnya',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

//Tab Lainnya
class LainnyaTab extends StatefulWidget {
  @override
  _LainnyaTabState createState() => _LainnyaTabState();
}

class _LainnyaTabState extends State<LainnyaTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.construction,
              size: 60,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Under Construction',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: Content_font_size),
            )
          ],
        ),
      ),
    );
  }
}
