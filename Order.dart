import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/cloud_functions.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderPageState();
}

class _OrderPageState extends State<Order> {
  int quantity = 1;
  int pricePerItem = 8000; // 8000₮
  String? qrImage;

  Future<void> createQPayInvoice() async {
    final result = await FirebaseFunctions.instance
        .httpsCallable('createQPayInvoice')
        .call({'amount': quantity * pricePerItem});

    setState(() {
      qrImage = result.data['qr_image']; // QPay-с ирсэн QR код
    });
  }

  @override
  Widget build(BuildContext context) {
    int total = quantity * pricePerItem;

    return Scaffold(
      appBar: AppBar(title: Text("Захиалга")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text("🍔 Chicken Burger", style: TextStyle(fontSize: 22)),
            SizedBox(height: 10),
            Text("Нэгж үнэ: $pricePerItem₮"),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed:
                      quantity > 1 ? () => setState(() => quantity--) : null,
                  icon: Icon(Icons.remove),
                ),
                Text(quantity.toString(), style: TextStyle(fontSize: 20)),
                IconButton(
                  onPressed: () => setState(() => quantity++),
                  icon: Icon(Icons.add),
                ),
              ],
            ),

            Text("Нийт: $total₮", style: TextStyle(fontSize: 18)),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: createQPayInvoice,
              child: Text("Захиалах"),
            ),

            SizedBox(height: 20),

            if (qrImage != null)
              Column(
                children: [
                  Text("QR код уншуулж төлбөрөө хийнэ үү"),
                  Image.network(qrImage!, height: 200),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
