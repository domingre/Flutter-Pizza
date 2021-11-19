import 'package:flutter/material.dart';
import 'package:untitled/pages/pizzalist.dart';
import 'models/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizzeria',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home: MyHomePage(title: "Notre pizzeria")
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({required this.title, Key? key}) : super(key: key);
  String title;

  final _menus = [
    Menu(1, 'Entrées', 'entree.png', Colors.lightGreen),
    Menu(2, 'Pizzas', 'pizza.png', Colors.red),
    Menu(3, 'Desserts', 'dessert.png', Colors.brown),
    Menu(4, 'Boissons', 'boisson.png', Colors.lightBlue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _menus.length,
          itemBuilder: (context, index) => InkWell(
            onTap: (){
              switch(_menus[index].type) {
                case 2:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PizzaList()),
                  );
                  break;
              }
            },
            child: _buildRow(_menus[index]),
          ),
          itemExtent: 180,
          )
        ),
      );
  }

  _buildRow(Menu menu){
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: menu.color,
        borderRadius: const BorderRadius.all(Radius.circular(20))
      ),
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.all(6),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.asset(
              'assets/images/menus/${menu.image}',
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            height: 50,
            child: Center(
              child: Text(
                menu.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Comic Sans MS',
                  fontSize: 28,
                )
              )
            )
          )
        ],
      )
    );
  }
}


