import 'package:flutter/material.dart';

class PizzeriaStyle {
  static final baseTextStyle = const TextStyle(fontWeight: FontWeight.bold);

  static final TextStyle pageTitleTextStyle =
      baseTextStyle.copyWith(fontSize: 26);

  static final TextStyle headerTextStyle = baseTextStyle.copyWith(fontSize: 20);

  static final TextStyle regularTextStyle =
      baseTextStyle.copyWith(fontSize: 18);

  static final TextStyle subHeaderTextStyle =
      baseTextStyle.copyWith(fontSize: 26);

  static final TextStyle itemPriceTextStyle =
      const TextStyle(color: Colors.blue);

  static final TextStyle subItemPriceTextStyle =
      baseTextStyle.copyWith(color: Colors.indigo, fontSize: 20);

  static final TextStyle priceSubTotalTextStyle = baseTextStyle.copyWith(
      color: Colors.blueGrey, fontSize: 20, fontWeight: FontWeight.bold);

  static final TextStyle priceTotalTextStyle =
      baseTextStyle.copyWith(color: Colors.indigo, fontSize: 22);
}
