import 'package:flutter/material.dart';

class PizzeriaStyle {

  static final baseTextStyle = const TextStyle(fontWeight: FontWeight.bold);

  static final TextStyle pageTS = baseTextStyle.copyWith(fontSize: 26);

  static final TextStyle titleTS = baseTextStyle.copyWith(
      fontSize: 30,
      color: Colors.red
  );

  static final TextStyle headerTS = baseTextStyle.copyWith(fontSize: 20);

  static final TextStyle regularTS = baseTextStyle.copyWith(fontSize: 18);

  static final TextStyle subHeaderTS = baseTextStyle.copyWith(fontSize: 26);

  static final TextStyle itemPriceTS = const TextStyle(color: Colors.blue);

  static final TextStyle subItemPriceTS = baseTextStyle.copyWith(
      color: Colors.indigo,
      fontSize: 20
  );

  static final TextStyle priceSubTotalTS = baseTextStyle.copyWith(
    color: Colors.greenAccent,
    fontSize: 20
  );

  static final TextStyle priceTotalTS = baseTextStyle.copyWith(
    color : Colors.deepOrange,
    fontSize: 22
  );

}