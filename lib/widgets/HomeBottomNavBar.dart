import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import '../product/DUMMY_PRODUCTS.dart';

import 'BottomCartSheet.dart';
import 'BottomFavoriteSheet.dart';

class HomeBottomnavBar extends StatelessWidget {
  const HomeBottomnavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Color(0xFF475269),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.category_outlined,
            color: Colors.white,
            size: 32,
          ),
          InkWell(
            onTap: () {
              showSlidingBottomSheet(
                context,
                builder: (context) {
                  return SlidingSheetDialog(
                      elevation: 8,
                      cornerRadius: 16,
                      builder: (context, state) {
                        return BottomCartSheet();
                      });
                },
              );
            },
            child: const Icon(
              CupertinoIcons.cart_fill,
              color: Colors.white,
              size: 32,
            ),
          ),

          // Icon(
          //   Icons.favorite,
          //   color: Colors.white,
          //   size: 32,
          // ),
          InkWell(
            onTap: () {
              showSlidingBottomSheet(
                context,
                builder: (context) {
                  return SlidingSheetDialog(
                    elevation: 8,
                    cornerRadius: 16,
                    builder: (context, state) {
                      return BottomFavoriteSheet();
                    },
                  );
                },
              );
            },
            child: const Icon(
              Icons.favorite,
              color: Colors.white,
              size: 32,
            ),
          ),
          const Icon(
            Icons.person,
            color: Colors.white,
            size: 32,
          )
        ],
      ),
    );
  }
}
