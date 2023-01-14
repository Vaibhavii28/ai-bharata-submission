import 'package:ai_bharata_submission/Mocks/mock_favorites.dart';
import 'package:ai_bharata_submission/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Components/favorites_item.dart';

class CoinsScreen extends StatefulWidget {
  static const id = 'coin_screen';

  @override
  State<CoinsScreen> createState() => _CoinsScreenState();
}

class _CoinsScreenState extends State<CoinsScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Coins',
            style: TextStyle(color: kPrimaryTextColor, fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: kPrimaryTextColor,
                    ),
                    filled: true,
                    fillColor: kSecondaryColor,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    hintText: 'Search',
                    hintStyle:
                        TextStyle(color: kPrimaryTextColor, fontSize: 15)),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: DefaultTabController(
                length: 3,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        constraints: BoxConstraints.expand(height: 50),
                        child: TabBar(
                            controller: _tabController,
                            indicatorWeight: 5,
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  topLeft: Radius.circular(15)),
                              color: Colors.blue,
                            ),
                            indicatorPadding:
                                EdgeInsets.only(left: 20, right: 20, top: 45),
                            indicatorColor: Colors.blue,
                            labelColor: kSecondaryTextColor,
                            tabs: [
                              Tab(
                                text: "Coins",
                              ),
                              Tab(text: "SIP"),
                              Tab(text: "Favourites"),
                            ]),
                      ),
                      Expanded(
                          child: Container(
                        height: 200,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            Coins(), Container(), Container(),
                          ],
                        ),
                      )),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}

class Coins extends StatefulWidget {
  const Coins({Key? key}) : super(key: key);

  @override
  State<Coins> createState() => _CoinsState();
}

class _CoinsState extends State<Coins> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: MediaQuery.of(context).size.height *0.1,
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: kSecondaryColor))),
              child: Row(
                children: [
                  Text('Name'),
                  Spacer(flex: 3,),
                  Text('Price'),
                  Spacer(),
                  Text('Change')
                ],
              ),
            ),
          ),
          SizedBox(height: 30,),
          for (final currency in MockFavorites.data)...
          [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: FavoritesItem(currency: currency),
            ),
            const SizedBox(height: 16),
          ]
        ],
        ),
      ),
    );
  }
}

