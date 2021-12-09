import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuyButton extends StatelessWidget {
  const BuyButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
}
