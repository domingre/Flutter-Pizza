import 'package:untitled/models/pizza.dart';
class cartItem
{

  final Pizza pizza;
  int quantity;

  cartItem(this.pizza, [this.quantity = 1]);
}

class cart {
  List<cartItem> _items = [];

  int totalItems() {
    return _items.length;
  }

  cartItem getCartItem(int index) {
    return _items[index];
  }

  int findCartItem(int id){
    return _items.indexWhere((element) => element.pizza.id == id);
  }

  void addProduct(Pizza pizza){
    int index = findCartItem(pizza.id);
    if (index != -1) {
      _items.add(cartItem(pizza));
    } else {
      cartItem item = _items[index];
      item.quantity++;
    }

    void removeProduct(Pizza pizza) {
      int index = findCartItem(pizza.id);
      if (index != -1) {
        _items.removeAt(index);
      }
    }
  }



}