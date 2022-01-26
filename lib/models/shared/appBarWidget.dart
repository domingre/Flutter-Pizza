import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/cart.dart';

import '../cartPage.dart';

class appBarWidget extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final cart _cart;

  @override
  Size get preferredSize =>  Size.fromHeight(kToolbarHeight);

  const appBarWidget(this.title,this._cart, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => cartPanier(_cart),
              )
          );
        },
          icon: Icon(Icons.shopping_cart),
        )
      ]
    );
  }
}
