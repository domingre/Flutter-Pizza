import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/shared/pizzeriaStyle.dart';
import 'package:intl/intl.dart';

class totalWidget extends StatelessWidget {

  final double total;

  const totalWidget(this.total, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var format = NumberFormat("###.00 €");
    String totalAffiche = format.format(total);

    return Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.grey,
      border: Border.all(
        color: Colors.black,
        width: 2
        )
      ),
      child: Row(
        children: [
          Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 12),
                child: Text(
                  "Total : ",
                  style: PizzeriaStyle.priceTotalTS,
                  textAlign: TextAlign.end,
                )
              )
            ),
          Expanded(
              child: Text(
                totalAffiche,
                style: PizzeriaStyle.priceTotalTS,
                textAlign: TextAlign.end,
              ))
        ],
      ),
    );
  }
}
