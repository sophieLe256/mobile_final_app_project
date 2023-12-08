import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_project/pages/itemPage.dart';
import '../product/DUMMY_PRODUCTS.dart';
import 'package:mobile_app_project/product/bloc/product_bloc.dart';
import 'package:mobile_app_project/product/product_repo.dart';

// 4 Item image below the scrolling row image
class AllItemsWidget extends StatelessWidget {
  const AllItemsWidget({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.68,
        ),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        });
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF475269).withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ItemPage(product: product)));
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                product.img,
                height: 120,
                width: 120,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                product.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF475269),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "New ${product.category} Shoes",
              style: TextStyle(
                fontSize: 13,
                color: const Color(0xFF475269).withOpacity(0.7),
              ),
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.68,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        for (final Product product in Product.products)
          // for (int i = 1; i <= 8; i++)
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF475269).withOpacity(0.3),
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.redAccent),

                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "itemPage");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      product.img,
                      height: 120,
                      width: 120,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF475269),
                      ),
                    ),
                  ),

                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "New ${product.category} Shoes",
                    style: TextStyle(
                      fontSize: 13,
                      color: const Color(0xFF475269).withOpacity(0.7),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${product.price}",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.redAccent),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          CupertinoIcons.cart_fill_badge_plus,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
          ),
      ],
    );
  }
}
