import 'pizza.dart';
class pizzaData {

  static List<Pizza> buildList(){
    List<Pizza> list = [];
    list.add(Pizza(1, 'type osef1', 'garniture osef', 'pizza-bbq.jpg', 8));
    list.add(Pizza(2, 'type osef2', 'garniture osef', 'pizza-hawai.jpg', 8));
    list.add(Pizza(3, 'type osef3', 'garniture osef', 'pizza-spinach.jpg', 8));
    list.add(Pizza(4, 'type osef4', 'garniture osef', 'pizza-vegetable.jpg', 8));

    return list;
  }

}