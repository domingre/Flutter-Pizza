import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/option_item.dart';
import 'package:untitled/pages/share/pizzeria_style.dart';
import 'package:untitled/pages/share/total_widget.dart';

import '/models/pizza.dart';

class PizzaDetails extends StatefulWidget {
  final pizza _pizza;

  const PizzaDetails(this._pizza, {Key? key}) : super(key: key);

  @override
  _PizzaDetailsState createState() => _PizzaDetailsState();
}

class _PizzaDetailsState extends State<PizzaDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget._pizza.title),
        ),
        body: ListView(
          padding: EdgeInsets.all(4.0),
          children: [
            Text('Pizza ${widget._pizza.title}',
                style: PizzeriaStyle.pageTitleTextStyle),
            Image.asset(
              'assets/images/pizza/${widget._pizza.img}',
              height: 180,
            ),
            Text('Recette', style: PizzeriaStyle.headerTextStyle),
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 12),
              child: Text(
                widget._pizza.garniture,
              ),
            ),
            Text('Pâte et taille sélectionnées',
                style: PizzeriaStyle.headerTextStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: _buildDropDownPates()),
                Expanded(child: _buildDropDownTailles()),
              ],
            ),
            Text("Sauce selectionnée(s)", style: PizzeriaStyle.headerTextStyle),
            _buildDropDownSauces(),
            totalWidget(widget._pizza.total),
            _buildBuyButton(),
          ],
        ));
  }

  _buildBuyButton() {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.deepPurple)),
        onPressed: () {
          print("Commander");
        },
        child: Row(
          children: [
            Icon(Icons.shopping_cart),
            SizedBox(width: 5),
            Text("Commander"),
          ],
        ),
      ),
    ]);
  }

  _buildDropDownPates() {
    return DropdownButton<OptionItem>(
      isExpanded: true,
      value: pizza.pates[widget._pizza.pate],
      items: _buildDropDownItem(pizza.pates),
      onChanged: (item) {
        setState(() {
          widget._pizza.pate = item!.value;
        });
      },
    );
  }

  _buildDropDownTailles() {
    return DropdownButton<OptionItem>(
      isExpanded: true,
      value: pizza.tailles[widget._pizza.taille],
      items: _buildDropDownItem(pizza.tailles),
      onChanged: (item) {
        setState(() {
          widget._pizza.taille = item!.value;
        });
      },
    );
  }

  _buildDropDownSauces() {
    return DropdownButton<OptionItem>(
      isExpanded: true,
      value: pizza.sauces[widget._pizza.sauce],
      items: _buildDropDownItem(pizza.sauces),
      onChanged: (item) {
        setState(() {
          widget._pizza.sauce = item!.value;
        });
      },
    );
  }

  _buildDropDownItem(List<OptionItem> list) {
    return Iterable.generate(
        list.length,
        (i) => DropdownMenuItem<OptionItem>(
              value: list[i],
              child: Text(list[i].name),
            )).toList();
  }
}
