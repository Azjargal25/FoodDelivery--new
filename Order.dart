import 'package:flutter/material.dart';
import 'package:fooddelivery/pages/bottomnav.dart';
import 'package:provider/provider.dart';
import 'package:fooddelivery/provider/cart_provider.dart';
import 'package:fooddelivery/models/cart_item.dart';
import 'package:fooddelivery/pages/home.dart'; // Home хуудсыг импортлоорой
import 'package:fooddelivery/pages/payment.dart'; // PaymentPage-г импортлоорой

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Захиалга'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Буцахдаа Home буюу BottomNav руу очих
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => BottomNav()),
            );
          },
        ),
      ),
      body:
          cartProvider.cartItems.isEmpty
              ? Center(child: Text("Сагс хоосон байна"))
              : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartProvider.cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartProvider.cartItems[index];
                        return ListTile(
                          leading: Image.asset(item.imagePath, width: 50),
                          title: Text(item.name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${item.quantity} x ₮${item.price.toStringAsFixed(2)}',
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      cartProvider.decreaseQuantity(item);
                                    },
                                  ),
                                  Text('${item.quantity}'),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      cartProvider.increaseQuantity(item);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '₮${(item.price * item.quantity).toStringAsFixed(2)}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  cartProvider.removeFromCart(item);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Нийт:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "₮${cartProvider.totalPrice.toStringAsFixed(2)}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // PaymentPage руу шилжих хэсэг
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Payment(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(vertical: 12),
                            minimumSize: Size(double.infinity, 50),
                          ),
                          child: Text("ТӨЛӨХ", style: TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
