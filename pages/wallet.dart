import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  final List<Map<String, dynamic>> transactions = [
    {
      'title': 'Хоол захиалга',
      'amount': -12000,
      'date': '2025-05-01',
      'icon': Icons.fastfood,
    },
    {
      'title': 'Цэнэглэл',
      'amount': 20000,
      'date': '2025-04-28',
      'icon': Icons.account_balance_wallet,
    },
    {
      'title': 'Кофе',
      'amount': -4000,
      'date': '2025-04-27',
      'icon': Icons.local_cafe,
    },
    {
      'title': 'Урамшуулал',
      'amount': 5000,
      'date': '2025-04-25',
      'icon': Icons.card_giftcard,
    },
    {
      'title': 'Хүргэлтийн төлбөр',
      'amount': -3000,
      'date': '2025-04-24',
      'icon': Icons.delivery_dining,
    },
    {
      'title': 'Цэнэглэл',
      'amount': 10000,
      'date': '2025-04-22',
      'icon': Icons.account_balance_wallet,
    },
    {
      'title': 'Суши захиалга',
      'amount': -18000,
      'date': '2025-04-20',
      'icon': Icons.ramen_dining,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Миний Хэтэвч'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Баланс
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Үлдэгдэл', style: TextStyle(fontSize: 16)),
                  Text(
                    '₮25,000',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Цэнэглэх товч
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: Icon(Icons.add_card),
                label: Text('Хэтэвч цэнэглэх'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 16),

            // Гүйлгээний түүх
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Гүйлгээний түүх',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),

            // Гүйлгээний ListView
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final tx = transactions[index];
                  final isIncome = tx['amount'] > 0;
                  return ListTile(
                    leading: Icon(
                      tx['icon'],
                      color: isIncome ? Colors.green : Colors.red,
                    ),
                    title: Text(tx['title']),
                    subtitle: Text(tx['date']),
                    trailing: Text(
                      "${isIncome ? '+' : ''}₮${tx['amount'].abs()}",
                      style: TextStyle(
                        color: isIncome ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
