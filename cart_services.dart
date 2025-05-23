import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Future<void> addToCart(String foodId) async {
  final user = supabase.auth.currentUser;
  if (user == null) {
    print('Login required');
    return;
  }

  final userId = user.id;

  final existing =
      await supabase
          .from('cart')
          .select()
          .eq('user_id', userId)
          .eq('food_id', foodId)
          .maybeSingle();

  if (existing != null) {
    final newQuantity = existing['quantity'] + 1;

    await supabase.from('cart').update({'quantity': newQuantity}).match({
      'user_id': userId,
      'food_id': foodId,
    });

    print('Updated quantity to $newQuantity');
  } else {
    await supabase.from('cart').insert({
      'user_id': userId,
      'food_id': foodId,
      'quantity': 1,
    });

    print('Food added to cart');
  }
}
