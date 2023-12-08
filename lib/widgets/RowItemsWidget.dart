import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../product/DUMMY_PRODUCTS.dart';

// a scrolling parallax effect (horizontal)

class RowItemsWidget extends StatelessWidget {
  const RowItemsWidget({super.key});

  // Add to cart function



  void addToCartFunction() {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final Product product in Product.products)
            // for (int i = 1; i < 6; i++)
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10, left: 15),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0xFF475269).withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1),
                ],
              ),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20, right: 70),
                        height: 110,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Image.asset(
                        product.img,
                        height: 120,
                        width: 120,
                        fit: BoxFit.contain,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                              color: Color(0xFF475269),
                              fontSize: 23,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "New ${product.category} Shoes",
                          style: TextStyle(
                            color: const Color(0xFF475269).withOpacity(0.8),
                            fontSize: 16,
                          ),
                        ),
                        // const Spacer(),
                        Row(
                          children: [
                            Text(
                              "\$${product.price}",
                              style: const TextStyle(
                                color: Colors.redAccent,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 70),
                            InkWell(
                              onTap: addToCartFunction,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF475269),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  CupertinoIcons.cart_fill_badge_plus,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );

        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (final Product product in Product.products)

              // for (int i = 1; i < 6; i++)

              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10, left: 15),

                padding: const EdgeInsets.symmetric(horizontal: 10),

                height: 180,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xFF475269).withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 1),
                  ],
                ),

                //

                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20, right: 70),
                          height: 110,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Image.asset(
                          product.img,
                          height: 120,
                          width: 120,
                          fit: BoxFit.contain,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(
                                color: Color(0xFF475269),
                                fontSize: 23,
                                fontWeight: FontWeight.w500),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            'Men\'s Shoes',
                            style: TextStyle(
                              color: const Color(0xFF475269).withOpacity(0.8),
                              fontSize: 16,
                            ),
                          ),

                          // const Spacer(),

                          Row(
                            children: [
                              const Text(
                                "\$50",
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 70),
                              InkWell(
                                onTap: addToCartFunction,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF475269),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    CupertinoIcons.cart_fill_badge_plus,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ));
  }
}
