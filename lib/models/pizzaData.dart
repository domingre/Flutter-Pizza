import 'pizza.dart';

class pizzaData {
  static List<Pizza> buildList() {
    List<Pizza> list = [];
    list.add(Pizza(1, 'BBQ', 'salade ognion tomate', 'pizza-bbq.jpg', 8));
    list.add(Pizza(2, 'Hawaien', 'tomate salade ognion', 'pizza-hawai.jpg', 8));
    list.add(
        Pizza(3, 'Spinach', 'ognion tomate salade', 'pizza-spinach.jpg', 8));
    list.add(Pizza(
        4, 'Vegetarienne', 'ognion salade tomate', 'pizza-vegetable.jpg', 8));

    return list;
  }
}
