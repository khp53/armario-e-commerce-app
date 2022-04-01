import 'package:armario/screens/explore/explore_body.dart';
import 'package:armario/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  List<Widget> defaultWidgets = [Home(), ExploreBody()];

  onTaped(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: defaultWidgets.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/svgs/home-alt-2.svg',
              height: 35,
            ),
            icon: SvgPicture.asset(
              'assets/svgs/home-alt.svg',
              height: 35,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/svgs/pricetag-alt-2.svg',
              height: 35,
            ),
            icon: SvgPicture.asset(
              'assets/svgs/pricetag-alt.svg',
              height: 35,
            ),
            label: '',
          ),
        ],
        onTap: onTaped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
