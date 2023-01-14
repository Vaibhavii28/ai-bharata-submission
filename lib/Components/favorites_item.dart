import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:web_socket_channel/io.dart';

import '../../../../components/custom_icon.dart';
import 'package:ai_bharata_submission/Models/currency.dart';
import '../../../../utils/constants.dart';
class FavoritesItem extends StatefulWidget {
  final Currency currency;

  const FavoritesItem({
    Key? key,
    required this.currency,
  }) : super(key: key);

  @override
  State<FavoritesItem> createState() => _FavoritesItemState();
}

class _FavoritesItemState extends State<FavoritesItem> {
  bool gotdata=false;
  final data='{ "method": "SUBSCRIBE","params": ["all@ticker"],"cid": 1}';


  final channel =IOWebSocketChannel.connect('ws://prereg.ex.api.ampiy.com/prices');
  String currentprice='0';
  String percentchange='0';
  streamListener(){
    channel.stream.listen((message){
      channel.sink.add(data);
      //channel.sink.close();
      Map getData= jsonDecode(message);
      for(var index=0; index<=100; index++) {
         if(getData['data'][index]['s']== '${widget.currency.code}INR')
         setState(() {
           currentprice=getData['data'][index]['c'];
           percentchange=getData['data'][index]['P'];
           gotdata=true;
         });
      }

    });
  }


  Widget title() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.currency.name,
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          widget.currency.code,
          style: const TextStyle(
            fontSize: 16,
            color: kSecondaryTextColor,
          ),
        ),
      ],
    );
  }

  Widget price() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        gotdata?
         Text(
    '${NumberFormat.compactCurrency(
      locale: 'en_IN',
      decimalDigits: 2,
      symbol: '\u{20B9}',
    ).format(double.parse(currentprice))}',
          style: const TextStyle(fontSize: 16),
        ): Container(),
        const SizedBox(height: 4),

      ],
    );
  }

  Widget change(){
    return Row(
      children: [
        gotdata?
        Icon(
          double.parse(percentchange) >= 0
              ? FontAwesomeIcons.caretUp
              : FontAwesomeIcons.caretDown,
          size: 16,
          color: double.parse(percentchange) >= 0? Colors.green : Colors.red
        ):Container(),
        const SizedBox(width: 2),
        gotdata?
        Text(
          double.parse(percentchange).toStringAsFixed(2),
          style: TextStyle(
              color: double.parse(percentchange) >= 0? Colors.green : Colors.red
          ),
        ):Container()
      ],
    );
  }

  @override
  void initState() {
    streamListener();

  }
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 74,
        color: kPrimaryColor,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  CustomIcon(icon: widget.currency.icon),
                  const SizedBox(width: 16),
                  title(),
                  const Spacer(flex: 2,),
                  price(),
                  const Spacer(),
                  change(),
                ],
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {}
              ),
            ),
          ],
        ),
      ),
    );
  }
}
