import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fooddelivery/cart_provider.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Миний сагс')),
      body:
          cart.items.isEmpty
              ? Center(child: Text('Сагс хоосон байна'))
              : ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final item = cart.items[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text('${item.quantity} ширхэг'),
                    trailing: Text('₮${item.price * item.quantity}'),
                  );
                },
              ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: Text(
          'Нийт дүн: ₮${cart.totalPrice}',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
