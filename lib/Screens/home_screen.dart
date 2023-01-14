import 'package:ai_bharata_submission/Screens/coins_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_socket_channel/io.dart';
import '../../utils/constants.dart';
import 'package:ai_bharata_submission/Components/balance_card.dart';
import 'package:ai_bharata_submission/Components/favorites.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:ai_bharata_submission/Models/currency.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  // final Currency currency;
  // HomeScreen({required this.currency});
  static const id = 'home_screen';
  int index=0;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    ExplorePage(),
    CoinsScreen(),
    Container(),
    Container()
  ];

  void _onItemTapped(int index) {
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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(right: 35),
        child: BottomNavigationBar(
          backgroundColor: kBackgroundColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.house),
                label: 'Home',
                backgroundColor: kBackgroundColor),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.coins),
                label: 'Coins',
                backgroundColor: kBackgroundColor),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.wallet),
                label: 'Wallet',
                backgroundColor: kBackgroundColor),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.user),
                label: 'You',
                backgroundColor: kBackgroundColor),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: kPrimaryTextColor,
          unselectedItemColor: kSecondaryColor,
          iconSize: 25,
          unselectedLabelStyle: TextStyle(fontSize: 15, color: kPrimaryColor),
          onTap: _onItemTapped,
          elevation: 5,
          selectedFontSize: 20,
          unselectedFontSize: 10,
        ),
      ),
      floatingActionButton: SizedBox(
        height: 40,
        width: 40,
        child: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: new Icon(
            FontAwesomeIcons.rightLeft,
            size: 20,
          ),
          elevation: 4.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  Widget header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 20,
                  color: kSecondaryTextColor,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'User',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const CircleAvatar(
            foregroundImage: AssetImage('assets/images/jack_brown.png'),
            backgroundColor: kBackgroundColor,
            radius: 30,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Currency currency=
    return Column(
      children: [
        Expanded(
          child: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              begin: const Alignment(0, 0.8),
              end: Alignment.bottomCenter,
              colors: [
                kBackgroundColor,
                kBackgroundColor.withOpacity(0),
              ],
            ).createShader(bounds),
            blendMode: BlendMode.dstATop,
            child: ListView(
              padding: const EdgeInsets.only(top: 64, bottom: 24),
              children: [
                header(),
                const SizedBox(height: 36),
                const BalanceCard(),
                const SizedBox(height: 36),
                Favorites(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
