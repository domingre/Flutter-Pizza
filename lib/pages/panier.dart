import 'package:flutter/material.dart';
import 'package:untitled/models/cart.dart';

class Panier extends StatefulWidget {
  final Cart _cart;
  const Panier(this._cart, {Key? key}) : super(key: key);

  @override
  _PanierState createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panier'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget._cart.totalItems(),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: new BoxDecoration(
                      border: new Border.all(color: Colors.black)),
                  child: _buildItem(widget._cart.getCartItem(index)),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Total : ${widget._cart.totalPrice()} €',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    padding: EdgeInsets.all(12),
                    child: ElevatedButton(
                      child: Text('Valider'),
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      onPressed: () {
                        print('Valider');
                      },
                    )),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildItem(CartItem cartItem) {
    return Row(children: [
      Expanded(
          child: Image.asset(
        'assets/images/pizza/${cartItem.pizza.img}',
        height: 120,
        fit: BoxFit.fitWidth,
      )),
      Expanded(
        child: Column(
          children: [
            Text(cartItem.pizza.title,
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Prix : ${cartItem.pizza.price}€'),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        iconSize: 32,
                        icon: Icon(Icons.expand_less, color: Colors.black),
                        onPressed: () => {
                          setState(() {
                            cartItem.quantity++;
                          })
                        },
                      ),
                      Text('${cartItem.quantity}'),
                      IconButton(
                        iconSize: 32,
                        icon: Icon(Icons.expand_more, color: Colors.black),
                        onPressed: () => {
                          setState(() {
                            if (cartItem.quantity > 0) {
                              cartItem.quantity--;
                            }
                          })
                        },
                      )
                    ],
                  )
                ],
              )
            ]),
            Text('Sous-total : ${cartItem.pizza.price * cartItem.quantity}€'),
          ],
        ),
      ),
    ]);
  }
}