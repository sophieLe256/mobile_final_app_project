import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String img;
  final double price;
  final String description;
  final int quantity;
  final int reviewTotal;
  final int reviewCount;
  final String seller;
  final bool isRecommended;
  final List<String> favorite;
  final List<String> cart;
  final String id;

  const Product({
    required this.isRecommended,
    required this.quantity,
    required this.reviewTotal,
    required this.reviewCount,
    required this.name,
    required this.category,
    required this.img,
    required this.price,
    required this.description,
    required this.seller,
    required this.favorite,
    required this.id,
    required this.cart,
  });

  static Product fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic> data = doc.data() ?? {};
    return Product(
      quantity: data['quantity'] ?? 0,
      reviewTotal: data['reviewTotal'] ?? 0,
      reviewCount: data['reviewCount'] ?? 0,
      name: data['name'] ?? '',
      category: data['category'] ?? '',
      img: data['img'] ?? '',
      price: (data['price'] ?? 0.0).toDouble(),
      description: data['description'] ?? '',
      seller: data['seller'] ?? '',
      isRecommended: data['isRecommended'] ?? false,
      favorite: data['favorite'] == null
          ? []
          : data["favorite"].map<String>((i) => i as String).toList(),
      id: data["id"] ?? '',
      cart: data['cart'] == null
          ? []
          : data["cart"].map<String>((i) => i as String).toList(),
    );
  }

  // static Product fromSnapshot(DocumentSnapshot doc) {
  //   Product product = Product(
  //       quantity: doc["quantity"],
  //       reviewTotal: doc["reviewTotal"],
  //       reviewCount: doc["reviewCount"],
  //       name: doc["name"],
  //       category: doc["category"],
  //       img: doc["img"],
  //       price: doc["price"],
  //       description: doc["description"],
  //       seller: doc["seller"],
  //       isRecommended: doc["isRecommended"]);
  //   return product;
  // }

  @override
  List<Object?> get props => [
        name,
        category,
        img,
        price,
        quantity,
        reviewCount,
        reviewTotal,
        description,
        seller,
        favorite,
        cart,
      ];

  static List<Product> products = [
    Product(
      name: 'Air Jordan 1 Navy',
      category: "Men",
      img: "assets/1.png",
      price: 90,
      description:
          "Premium suede and Jordan Brand's signature Formula 23 foam come together to give you an extra luxurious (and extra cozy) AJ1. You don't need to play when it comes to choosing style or comfort with this one—which is nice, 'cause you deserve both.",
      quantity: 1,
      reviewCount: 0,
      reviewTotal: 0,
      seller: "Market",
      isRecommended: false,
      favorite: [],
      id: '',
      cart: [],
    ),
    Product(
      name: 'Air Jordan 1 Mid SE',
      category: "Men",
      img: "assets/2.png",
      price: 135,
      description:
          "Fresh look, familiar feel. Every time the AJ1 gets a remake, you get the classic sneaker in new colors and textures. Premium materials and accents give modern expression to an all-time favorite.",
      quantity: 1,
      reviewCount: 0,
      reviewTotal: 0,
      seller: "Market",
      isRecommended: false,
      favorite: [],
      id: '',
      cart: [],
    ),
    Product(
      name: 'Nike Shoes 3',
      category: "Women",
      img: "assets/3.png",
      price: 50,
      description:
          "Run (don't walk) to your new favorite Borough. Made for the long haul, this legend uses a combination of durable materials on the upper and outsole to achieve a classic look made in a whole new way. A redesigned toe box and midfoot give your feet a little extra room so you can run, jump and play just a bit longer and a little bit harder.",
      quantity: 1,
      reviewCount: 0,
      reviewTotal: 0,
      seller: "Market",
      isRecommended: false,
      favorite: [],
      id: '',
      cart: [],
    ),
    Product(
      name: 'Nike Shoes 4',
      category: "Women",
      img: "assets/4.png",
      price: 120,
      description:
          "Run (don't walk) to your new favorite Borough. Made for the long haul, this legend uses a combination of durable materials on the upper and outsole to achieve a classic look made in a whole new way. A redesigned toe box and midfoot give your feet a little extra room so you can run, jump and play just a bit longer and a little bit harder.",
      quantity: 1,
      reviewCount: 0,
      reviewTotal: 0,
      seller: "Market",
      isRecommended: false,
      favorite: [],
      id: '',
      cart: [],
    ),
    Product(
      name: 'Nike Shoes 5',
      category: "Women",
      img: "assets/5.png",
      price: 60,
      description:
          "Run (don't walk) to your new favorite Borough. Made for the long haul, this legend uses a combination of durable materials on the upper and outsole to achieve a classic look made in a whole new way. A redesigned toe box and midfoot give your feet a little extra room so you can run, jump and play just a bit longer and a little bit harder.",
      quantity: 1,
      reviewCount: 0,
      reviewTotal: 0,
      seller: "Market",
      isRecommended: false,
      favorite: [],
      id: '',
      cart: [],
    ),
    Product(
      name: 'Nike Court Borough Low',
      category: "Men",
      img: "assets/6.png",
      price: 80,
      description:
          "Run (don't walk) to your new favorite Borough. Made for the long haul, this legend uses a combination of durable materials on the upper and outsole to achieve a classic look made in a whole new way. A redesigned toe box and midfoot give your feet a little extra room so you can run, jump and play just a bit longer and a little bit harder.",
      quantity: 1,
      reviewCount: 0,
      reviewTotal: 0,
      seller: "Market",
      isRecommended: false,
      favorite: [],
      id: '',
      cart: [],
    ),
    Product(
      name: 'Nike Shoes 7',
      category: "Men",
      img: "assets/7.png",
      price: 80,
      description:
          "Run (don't walk) to your new favorite Borough. Made for the long haul, this legend uses a combination of durable materials on the upper and outsole to achieve a classic look made in a whole new way. A redesigned toe box and midfoot give your feet a little extra room so you can run, jump and play just a bit longer and a little bit harder.",
      quantity: 1,
      reviewCount: 0,
      reviewTotal: 0,
      seller: "Market",
      isRecommended: false,
      favorite: [],
      id: '',
      cart: [],
    ),
    Product(
      name: 'Nike Shoes 8',
      category: "Women",
      img: "assets/8.png",
      price: 90,
      description:
          "Run (don't walk) to your new favorite Borough. Made for the long haul, this legend uses a combination of durable materials on the upper and outsole to achieve a classic look made in a whole new way. A redesigned toe box and midfoot give your feet a little extra room so you can run, jump and play just a bit longer and a little bit harder.",
      quantity: 1,
      reviewCount: 0,
      reviewTotal: 0,
      seller: "Market",
      isRecommended: false,
      favorite: [],
      id: '',
      cart: [],
    ),
    Product(
      name: 'Nike Shoes 9',
      category: "Men",
      img: "assets/9.png",
      price: 120,
      description:
          "Run (don't walk) to your new favorite Borough. Made for the long haul, this legend uses a combination of durable materials on the upper and outsole to achieve a classic look made in a whole new way. A redesigned toe box and midfoot give your feet a little extra room so you can run, jump and play just a bit longer and a little bit harder.",
      quantity: 1,
      reviewCount: 0,
      reviewTotal: 0,
      seller: "Market",
      isRecommended: false,
      favorite: [],
      id: '',
      cart: [],
    ),
    Product(
      name: 'Nike Shoes 10',
      category: "Women",
      img: "assets/10.png",
      price: 180,
      description:
          "Run (don't walk) to your new favorite Borough. Made for the long haul, this legend uses a combination of durable materials on the upper and outsole to achieve a classic look made in a whole new way. A redesigned toe box and midfoot give your feet a little extra room so you can run, jump and play just a bit longer and a little bit harder.",
      quantity: 1,
      reviewCount: 0,
      reviewTotal: 0,
      seller: "Market",
      isRecommended: false,
      favorite: [],
      id: '',
      cart: [],
    ),
  ];
}
