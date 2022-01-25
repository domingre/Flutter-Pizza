import 'package:untitled/models/option_item.dart';

class Pizza {
  final int id;
  final String title;
  final String garniture;
  final String img;
  final double price;

  int pate = 0;
  int taille = 1;
  int sauce = 0;

  static final List<OptionItem> pates = [
    OptionItem(0, "Pâte fine"),
    OptionItem(1, "Pâte épaisse", supplement: 2),
  ];

  static final List<OptionItem> tailles = [
    OptionItem(0, "Small", supplement: -1),
    OptionItem(1, "Medium"),
    OptionItem(2, "Large", supplement: 2),
  ];

  static final List<OptionItem> sauces = [
    OptionItem(0, "Base sauce tomate"),
    OptionItem(1, "Sauce samourai", supplement: 2),
  ];

  double get total {
    double total = price;

    total += pates[pate].supplement;
    total += tailles[taille].supplement;
    total += sauces[sauce].supplement;

    return total;
  }

  Pizza(this.id, this.title, this.garniture, this.img, this.price);
  Pizza.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        garniture = json['garniture'],
        img = json['image'],
        price = json['price'];
}
