
import 'dart:convert';

import 'package:ai_bharata_submission/Models/currency.dart';
import 'package:flutter/material.dart';
import 'package:ai_bharata_submission/Mocks/mock_favorites.dart';
import 'package:web_socket_channel/io.dart';
import 'favorites_item.dart';

class Favorites extends StatefulWidget {

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  // final data='{ "method": "SUBSCRIBE","params": ["all@ticker"],"cid": 1}';
  // final channel =IOWebSocketChannel.connect('ws://prereg.ex.api.ampiy.com/prices');
  // bool gotdata=false;
  // streamListener(){
  //   channel.stream.listen((message){
  //     channel.sink.add(data);
  //     //channel.sink.close();
  //     Map getData= jsonDecode(message);
  //     for(var index=0; index<=100; index++) {
  //       if(getData['data'][index]['s']== '${widget.currency.code}INR')
  //         setState(() {
  //           // currentprice=getData['data'][index]['c'];
  //           // percentchange=getData['data'][index]['P'];
  //           gotdata=true;
  //         });
  //     }
  //
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Favorites',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          for (final currency in MockFavorites.data) ...[
            FavoritesItem(currency: currency),
            const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }
}
