import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:untitled/models/cart.dart';

class cartPanier extends StatefulWidget {
  const cartPanier(this._cart, {Key? key}) : super(key: key);
  final cart _cart;

  @override
  _cartPanierState createState() => _cartPanierState();
}

class _cartPanierState extends State<cartPanier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: Text("panier"),
      ),
      body: Column(
        children: [
          Expanded(child: ListView(
            children: [
              Text("Pizza")
            ],
          )),
          Row(
            children: [
              Text("Prix")
            ],
          ),
          Container(
            child: ElevatedButton(
              child: (Text("valider")),
              onPressed: () {
                print("Valider");
              },
            ),
          )
        ],
      )
    );
  }
}
