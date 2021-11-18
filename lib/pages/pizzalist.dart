  import 'package:flutter/material.dart';
  import 'package:untitled/models/pizzaData.dart';
import 'package:untitled/pages/pizzadetails.dart';

  import '/models/pizza.dart';

  class PizzaList extends StatefulWidget {
    const PizzaList({Key? key}) : super(key: key);

    @override
    _PizzaListState createState() => _PizzaListState();
  }

  class _PizzaListState extends State<PizzaList> {

    List<pizza> _liste = [];

    @override
    void initState(){
      _liste = pizzaData.buildList();
    }

    _buildRow(pizza pizza){
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => PizzaDetails(pizza)));
              },
              child: _buildPizzeriaDetails(pizza),
            ),
            _buildBuyButton()
          ],
        )
      );
    }

    _buildPizzeriaDetails(pizza pizza){
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

  _buildBuyButton(){
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.amber)),
              child: Row(
                  children: [
                    Icon(Icons.shopping_cart),
                    SizedBox(width: 5,),
                    Text("Commander"),]
              ),
              onPressed: () {
                print("Commander la pizza");
              })
        ]);
  }

/*

 */
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Nos Pizzas')
        ),
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

