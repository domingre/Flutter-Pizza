import 'package:untitled/models/pizza.dart';

class CartItem {
  final Pizza pizza;
  int quantity;

  CartItem(this.pizza, [this.quantity = 1]);
}

class Cart {
  List<CartItem> _items = [];

  int totalItems() {
    return _items.length;
  }

  double totalPrice() {
    double totalPrice = 0.0;
    _items.forEach((element) {
      totalPrice += element.pizza.price * element.quantity;
    });
    return totalPrice;
  }

  CartItem getCartItem(int index) {
    return _items[index];
  }

  void addProduct(Pizza pizza) {
    //Recherche du produit
    int index = findCartItemIndex(pizza.id);
    if (index == -1) {
      //Ajout
      _items.add(CartItem(pizza));
    } else {
      //Incrémente la quantité
      CartItem item = _items[index];
      item.quantity++;
    }
  }

  void removeProduct(Pizza pizza) {
    //Recherche du produit
    int index = findCartItemIndex(pizza.id);
    if (index != -1) {
      //Suppression
      _items.removeAt(index);
    }
  }

  int findCartItemIndex(int id) {
    return _items.indexWhere((element) => element.pizza.id == id);
  }
}
