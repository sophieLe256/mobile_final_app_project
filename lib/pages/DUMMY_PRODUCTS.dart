import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String img;
  final double price;
  final String description;

  const Product({
    required this.name,
    required this.category,
    required this.img,
    required this.price,
    required this.description,
  });

  @override
  List<Object?> get props => [name, category, img, price];

  static List<Product> products = [
    const Product(
      name: 'Air Jordan 1',
      category: "Men",
      img: "assets/1.png",
      price: 90,
      description: "Premium suede and Jordan Brand's signature Formula 23 foam come together to give you an extra luxurious (and extra cozy) AJ1. You don't need to play when it comes to choosing style or comfort with this one—which is nice, 'cause you deserve both.",
    ),
    const Product(
      name: 'Air Jordan 1 Mid SE',
      category: "Men",
      img: "assets/2.png",
      price: 135,
      description: "Fresh look, familiar feel. Every time the AJ1 gets a remake, you get the classic sneaker in new colors and textures. Premium materials and accents give modern expression to an all-time favorite.",
    ),
    const Product(
      name: 'Air Jordan 1 Element',
      category: "Women",
      img: "assets/3.png",
      price: 80,
      description: "Run (don't walk) to your new favorite Borough. Made for the long haul, this legend uses a combination of durable materials on the upper and outsole to achieve a classic look made in a whole new way. A redesigned toe box and midfoot give your feet a little extra room so you can run, jump and play just a bit longer and a little bit harder.",
    ),
    const Product(
      name: 'Air Jordan 1',
      category: "Women",
      img: "assets/4.png",
      price: 120,
      description: "Run (don't walk) to your new favorite Borough. Made for the long haul, this legend uses a combination of durable materials on the upper and outsole to achieve a classic look made in a whole new way. A redesigned toe box and midfoot give your feet a little extra room so you can run, jump and play just a bit longer and a little bit harder.",
    ),
    const Product(
      name: 'Air Jordan 1 Retro High OG',
      category: "Women",
      img: "assets/5.png",
      price: 120,
      description: "Run (don't walk) to your new favorite Borough. Made for the long haul, this legend uses a combination of durable materials on the upper and outsole to achieve a classic look made in a whole new way. A redesigned toe box and midfoot give your feet a little extra room so you can run, jump and play just a bit longer and a little bit harder.",
    ),
    const Product(
      name: 'Nike Court Borough Low',
      category: "Men",
      img: "assets/6.png",
      price: 120,
      description: "Run (don't walk) to your new favorite Borough. Made for the long haul, this legend uses a combination of durable materials on the upper and outsole to achieve a classic look made in a whole new way. A redesigned toe box and midfoot give your feet a little extra room so you can run, jump and play just a bit longer and a little bit harder.",
    ),
    const Product(
      name: 'Air Jordan 1',
      category: "Men",
      img: "assets/7.png",
      price: 80,
      description: "Run (don't walk) to your new favorite Borough. Made for the long haul, this legend uses a combination of durable materials on the upper and outsole to achieve a classic look made in a whole new way. A redesigned toe box and midfoot give your feet a little extra room so you can run, jump and play just a bit longer and a little bit harder.",
    ),
    const Product(
      name: 'Air Jordan 1',
      category: "Women",
      img: "assets/8.png",
      price: 90,
      description: "Run (don't walk) to your new favorite Borough. Made for the long haul, this legend uses a combination of durable materials on the upper and outsole to achieve a classic look made in a whole new way. A redesigned toe box and midfoot give your feet a little extra room so you can run, jump and play just a bit longer and a little bit harder.",
    ),
    const Product(
      name: 'Air Jordan 1',
      category: "Men",
      img: "assets/9.png",
      price: 120,
      description: "Run (don't walk) to your new favorite Borough. Made for the long haul, this legend uses a combination of durable materials on the upper and outsole to achieve a classic look made in a whole new way. A redesigned toe box and midfoot give your feet a little extra room so you can run, jump and play just a bit longer and a little bit harder.",
    ),
    const Product(
      name: 'Air Jordan 1 Mid SE',
      category: "Women",
      img: "assets/10.png",
      price: 180,
      description: "Run (don't walk) to your new favorite Borough. Made for the long haul, this legend uses a combination of durable materials on the upper and outsole to achieve a classic look made in a whole new way. A redesigned toe box and midfoot give your feet a little extra room so you can run, jump and play just a bit longer and a little bit harder.",
    ),
  ];
}
