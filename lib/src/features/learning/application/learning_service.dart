// import 'package:app_demo/src/features/cart/data/local_cart_repository.dart';
// import 'package:app_demo/src/features/cart/data/remote_cart_repository.dart';
// import 'package:app_demo/src/features/cart/domain/cart_model.dart';
// import 'package:app_demo/src/features/products/domain/product_model.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../authentication/data/auth_repository.dart';

// final cartServiceProvider = Provider<CartService>((ref) => CartService(ref));

// class CartService {

//   CartService(this._ref);
//   final Ref _ref;


//   Future<Cart> _fetchCart(){
    
//     final user = _ref.read(authRepositoryProvider).currentUser;
//     if(user != null){
//       return _ref.read(remoteCartRepositoryProvider).fetchCart(user.userID);
//     }
//     else{
//       return _ref.read(localCartRepositoryProvider).fetchCart();
//     }
//   }

//   Future<void> _setCart(Cart cart) async{
//     final user = _ref.read(authRepositoryProvider).currentUser;
//     if(user != null){
//       await _ref.read(remoteCartRepositoryProvider).setCart(user.userID, cart);
//     }
//     else{
//       await _ref.read(localCartRepositoryProvider).setCart(cart);
//     }
//   }
  
//   Future<void> addItem({required ProductID prodID, required int quantity}) async{
//     // 1. fetch cart
//     final cart = await _fetchCart();
//     // 2. ureturn 1 copy của cart chứa mới
//     final update = cart.addItem(prodID: prodID, quantity: quantity);
//     // 3. set cart với data đã update
//     _setCart(update);
//   }

//   Future<void> removeItemById({required ProductID prodID}) async{
//     final cart = await _fetchCart();

//     final update = cart.removeItemById(prodID: prodID);

//     await _setCart(update);
//   }

//   Future<void> setItem({required ProductID prodID, required int quantity}) async{
//     final cart = await _fetchCart();
//     final update = cart.setItem(prodID: prodID, quantity: quantity);
//     await _setCart(update);
//   }

// }
