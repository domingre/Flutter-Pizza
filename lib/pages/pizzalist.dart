import 'package:flutter/material.dart';
import 'package:untitled/models/cart.dart';
import 'package:untitled/models/pizzaData.dart';
import 'package:untitled/pages/pizzadetails.dart';
import 'package:untitled/pages/share/buyButton_Widget.dart';
import 'package:untitled/pages/share/pizzeria_style.dart';
import 'package:untitled/services/pizzeria_service.dart';

import '/models/pizza.dart';
import 'share/appBar_Widget.dart';

class PizzaList extends StatefulWidget {
  final Cart _cart;
  const PizzaList(this._cart, {Key? key}) : super(key: key);

  @override
  _PizzaListState createState() => _PizzaListState();
}

class _PizzaListState extends State<PizzaList> {
  List<Pizza> _liste = [];
  late Future<List<Pizza>> _pizzas;
  PizzeriaService _services = PizzeriaService();

  @override
  void initState() {
    _pizzas = _services.fetchPizzas();
    //_liste = pizzaData.buildList();
  }

  _buildRow(Pizza pizza) {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10), top: Radius.circular(2))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PizzaDetails(pizza, widget._cart)));
              },
              child: _buildPizzeriaDetails(pizza),
            ),
            BuyButtonWidget(pizza, widget._cart),
          ],
        ));
  }

  _buildPizzeriaDetails(Pizza pizza) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ListTile(
          title: Text("Pizza ${pizza.title}"),
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

  _buildBuyButton() {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.deepPurple)),
          child: Row(children: [
            Icon(Icons.shopping_cart),
            SizedBox(
              width: 5,
            ),
            Text("Commander"),
          ]),
          onPressed: () {
            print("Commander la pizza !!!");
          })
    ]);
  }

/*

 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget("Nos Pizzas", widget._cart),
        body: FutureBuilder<List<Pizza>>(
          future: _pizzas,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _buildListView(snapshot.data!);
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Impossible de récupérer les données : ${snapshot.error}',
                  style: PizzeriaStyle.errorTextStyle,
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }

  _buildListView(List<Pizza> pizzas) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: pizzas.length,
        itemBuilder: (context, index) {
          return _buildRow(pizzas[index]);
        });
  }
}
