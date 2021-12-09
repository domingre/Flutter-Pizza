import 'pizza.dart';

class pizzaData {
  static List<pizza> buildList() {
    List<pizza> list = [];
    list.add(pizza(1, 'BBQ', 'salade ognion tomate', 'pizza-bbq.jpg', 8));
    list.add(pizza(2, 'Hawaien', 'tomate salade ognion', 'pizza-hawai.jpg', 8));
    list.add(
        pizza(3, 'Spinach', 'ognion tomate salade', 'pizza-spinach.jpg', 8));
    list.add(pizza(
        4, 'Vegetarienne', 'ognion salade tomate', 'pizza-vegetable.jpg', 8));

    return list;
  }
}
