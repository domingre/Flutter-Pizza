import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/models/pizza.dart';

class PizzaDetails extends StatefulWidget {

  final pizza _pizza;

  const PizzaDetails(this._pizza, {Key? key}) : super(key: key);

  @override
  _PizzaDetailsState createState() => _PizzaDetailsState();
}

class _PizzaDetailsState extends State<PizzaDetails> {

  _buildBuyButton() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
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
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.amberAccent)),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._pizza.title),
      ),
      body: ListView(
        padding: EdgeInsets.all(4),
        children: [
          Text(widget._pizza.title),
          Image.asset(
            'assets/images/pizza/${widget._pizza.img}',
            height: 180,
          ),
          Text("Recette"),
          Padding(
            padding: EdgeInsets.only(top: 8, bottom: 12),
            child: Text(
              widget._pizza.garniture,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: Text('La pate')), // a changer ?
              Expanded(child: Text('La sauce secrete')), //a changer ?
            ],
          ),
          Text("Sauce selectionnée"), //a changer
          Text("Les Sauces"), //a changer
          Text("${widget._pizza.price}€"),
          _buildBuyButton(),
        ],
      )
    );
  }
}
