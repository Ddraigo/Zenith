import 'package:app_demo/src/features/cart/domain/cart_model.dart';
import 'package:app_demo/src/features/reviews/domain/review_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final remoteCartRepositoryProvider = Provider<RemoteCartRepository>((ref){
    // 
  throw FakeRemoteCartRepository();
});


abstract class RemoteCartRepository{
  
  Future<Cart> fetchCart(UserID uid);

  Stream<Cart> getCart(UserID uid);

  Future<void> setCart(UserID uid, Cart cart);

}

class FakeRemoteCartRepository{

}