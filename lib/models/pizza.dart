import 'package:untitled/models/optionItem.dart';

class Pizza {
  final int id;
  final String title;
  final String garniture;
  final String img;
  final double price;

  //USER SELECTION
  int pate = 0;
  int sauce = 0;
  int taille = 1;
  //END

  double getTotal() {
    double total;
    total = price + pates[pate].supplement + sauces[sauce].supplement + tailles[taille].supplement ;
    return total;
  }

  static final List<OptionItem> pates = [
    OptionItem(0, "Pate fine"),
    OptionItem(1, "Pate traditionnelle", supplement: 2)
  ];
  static final List<OptionItem> sauces = [
    OptionItem(0, "Base tomate"),
    OptionItem(1, "Sauce Samourai", supplement: 2),
  ];
  static final List<OptionItem> tailles = [
    OptionItem(0, "Petite", supplement: -1),
    OptionItem(1, "Moyenne"),
    OptionItem(2, "Grande", supplement: 1)
  ];


  Pizza(this.id, this.title, this.garniture, this.img, this.price);

}