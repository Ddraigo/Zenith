import 'package:app_demo/src/features/flashcard/domain/flashcard_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final localCartRepositoryProvider = Provider<LocalCartRepository>((ref){
    
  throw UnimplementedError();
});

abstract class LocalCartRepository {
  /// get cart value (đọc 1 lần)
  Future<Cart> fetchCart();

  /// get cart value (real-time)
  Stream<Cart> watchCart();

  /// update cart value
  Future<void> setCart(Cart cart);

}