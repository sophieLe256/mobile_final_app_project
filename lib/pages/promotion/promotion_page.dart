import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PromotionPage extends StatelessWidget {
  final List<Map<String, dynamic>> promotions = [
    {
      'image': 'assets/promotion1.png',
      'title': 'Summer Sale - 30% Off',
      'description': 'Use code SUMMER30 at checkout.',
      'code': 'SUMMER30',
    },
    {
      'image': 'assets/promotion2.png',
      'title': 'Back to School Deals',
      'description': 'Use code SCHOOL20 for 20% off on school essentials.',
      'code': 'SCHOOL20',
    },
    // Add more promotions as needed
  ];

  void _copyPromoCodeToClipboard(String code, BuildContext context) {
    Clipboard.setData(ClipboardData(text: code)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Promo code '$code' copied to clipboard!")),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promotions'),
      ),
      body: ListView.builder(
        itemCount: promotions.length,
        itemBuilder: (BuildContext context, int index) {
          var promotion = promotions[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(
                  promotion['image']!,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        promotion['title']!,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 4),
                      Text(promotion['description']!),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () => _copyPromoCodeToClipboard(promotion['code'], context),
                        child: Text('Copy Code'),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
