import 'package:flutter/material.dart';
import 'package:ai_bharata_submission/Models/currency.dart';
import 'package:ai_bharata_submission/Models/trade.dart';
class MockFavorites {
  static final data = [
    Currency(
      code: 'BTC',
      name: 'Bitcoin',
      icon: Image.asset('assets/images/btc_icon.png'),


    ),
    Currency(
      code: 'ETH',
      name: 'Ethereum',
      icon: Image.asset('assets/images/eth_icon.png'),

    ),
    Currency(
      code: 'ADA',
      name: 'Cardano',
      icon: Image.asset('assets/images/ada_icon.png'),


    ),
    Currency(code: 'MATIC', name: 'Polygon', icon: Image.asset('assets/images/matic_icon.png'),)
  ];
}
