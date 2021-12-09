import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/cart.dart';
import 'package:untitled/models/optionItem.dart';
import 'package:untitled/models/shared/appBarWidget.dart';
import 'package:untitled/models/shared/buyButton.dart';
import 'package:untitled/models/shared/pizzeriaStyle.dart';
import 'package:untitled/models/shared/totalWidget.dart';

import '/models/pizza.dart';

class PizzaDetails extends StatefulWidget {
  final Pizza _pizza;
  final cart _cart;
  const PizzaDetails(this._pizza, this._cart, {Key? key}) : super(key: key);

  @override
  _PizzaDetailsState createState() => _PizzaDetailsState();
}

class _PizzaDetailsState extends State<PizzaDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget("Details"),
      body: ListView(
        padding: EdgeInsets.all(4),
        children: [
            Text('Pizza : ${widget._pizza.title}', style: PizzeriaStyle.pageTS,),
          Image.asset(
            'assets/images/pizza/${widget._pizza.img}',
            height: 180,
          ),
          Text("Recette", style: PizzeriaStyle.headerTS),
          Padding(
            padding: EdgeInsets.only(top: 8, bottom: 12),
            child: Text(
              widget._pizza.garniture,
            ),
          ),
          Text("Taille :", style: PizzeriaStyle.headerTS),
          _buildDropDownTaille(),
          Text("Sauce et pate selectionnées", style: PizzeriaStyle.pageTS), //a changer
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: _buildDropDownPates()), // a changer ?
              Expanded(child: _buildDropDownSauces()), //a changer ?
            ],
          ),
          totalWidget(widget._pizza.getTotal()),
          BuyButton()
        ],
      )
    );
  }

  _buildDropDownPates(){
    return DropdownButton<OptionItem>(
        isExpanded: true,
        value: Pizza.pates[widget._pizza.pate],
        items: _buildDropDownItem(Pizza.pates),
      onChanged: (item) {
          setState(() {
            widget._pizza.pate = item!.value;
          });
      },
    );
  }

  _buildDropDownTaille(){
    return DropdownButton<OptionItem>(
      isExpanded: true,
      value: Pizza.tailles[widget._pizza.taille],
      items: _buildDropDownItem(Pizza.tailles),
      onChanged: (item) {
        setState(() {
          widget._pizza.taille = item!.value;
        });
      },
    );
  }

  _buildDropDownSauces(){
    return DropdownButton<OptionItem>(
      isExpanded: true,
      value: Pizza.sauces[widget._pizza.sauce],
      items: _buildDropDownItem(Pizza.sauces),
      onChanged: (item) {
        setState(() {
          widget._pizza.sauce = item!.value;
        });
      },
    );
  }

  _buildDropDownItem(List<OptionItem> list){
    return Iterable.generate(
        list.length,
        (i) => DropdownMenuItem<OptionItem>(
          value: list[i],
          child: Text(list[i].name)
        )
    ).toList();
  }

}
