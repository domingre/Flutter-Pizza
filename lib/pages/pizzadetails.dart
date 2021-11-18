import 'package:flutter/material.dart';

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
        padding: 
      )
    );
  }
}
