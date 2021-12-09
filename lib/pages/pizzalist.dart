import 'package:flutter/material.dart';
import 'package:untitled/models/cart.dart';
import 'package:untitled/models/pizzaData.dart';
import 'package:untitled/models/shared/appBarWidget.dart';
import 'package:untitled/models/shared/buyButton.dart';
import 'package:untitled/pages/pizzadetails.dart';

  import '/models/pizza.dart';

  class PizzaList extends StatefulWidget {
    const PizzaList(this._cart, {Key? key}) : super(key: key);
    final cart _cart;

    @override
    _PizzaListState createState() => _PizzaListState();
  }

  class _PizzaListState extends State<PizzaList> {

    List<Pizza> _liste = [];

    @override
    void initState(){
      _liste = pizzaData.buildList();
    }

    _buildRow(Pizza pizza){
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10), top: Radius.circular(2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => PizzaDetails(pizza, widget._cart)));
              },
              child: _buildPizzeriaDetails(pizza),
            ),
            BuyButton()
          ],
        )
      );
    }

    _buildPizzeriaDetails(Pizza pizza){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            title: Text(pizza.title),
            subtitle: Text(pizza.garniture),
            leading: Icon(Icons.local_pizza),
          ),
          Image.asset(
            'assets/images/pizza/${pizza.img}',
            height: 120,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
          Container(
            padding: const EdgeInsets.all(4),
            child: Text(pizza.garniture),
          ),
        ],
      );
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: appBarWidget("Nos Pizzas"),
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: _liste.length,
          itemBuilder: (context, index){
            return _buildRow(_liste[index]);
          },
        )
      );
    }
  }

