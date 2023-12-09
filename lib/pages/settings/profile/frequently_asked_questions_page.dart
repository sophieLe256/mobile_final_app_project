import 'package:flutter/material.dart';

class FAQsPage extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {
      'question': 'How long does shipping take?',
      'answer': 'Shipping usually takes 3-5 business days for domestic orders and 7-14 business days for international orders.'
    },
    {
      'question': 'Are there any hidden costs or charges?',
      'answer': 'No, there are no hidden costs. The price listed on the checkout page is the final amount you pay.'
    },
    {
      'question': 'What is your refund policy?',
      'answer': 'We offer a 30-day refund policy from the date of purchase. Items must be in their original condition.'
    },
    // Add more FAQs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      body: ListView.builder(
        itemCount: faqs.length,
        itemBuilder: (BuildContext context, int index) {
          var faq = faqs[index];
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(Icons.question_mark, color: Colors.blue),
                  title: Text(
                    faq['question']!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.question_answer_outlined, color: Colors.green),
                  title: Text(
                    faq['answer']!,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomSheet: Container(
        color: Colors.blue,
        width: double.infinity,
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Please email or call us for more details',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
