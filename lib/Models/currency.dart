import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'trade.dart';

class Currency {
  final String code;
  final String name;
  final Image icon;
  final double currentAmount;
  final double profit;

  Currency({
    required this.code,
    required this.name,
    required this.icon,

    this.currentAmount = 0.0,
    this.profit = 0.0,

  });


  String _toPercent(double value) =>
      NumberFormat('+#.##%; -#.##%').format(value);

  String get profitString => _toPercent(profit);


}
