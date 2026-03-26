// import 'package:app_demo/src/features/cart/application/cart_service.dart';
// import 'package:app_demo/src/features/products/domain/product_model.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/legacy.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// /* Controller có 2 nhiệm vụ 
//   + update widget state
//   + Gọi các method tương ứng của CartService để update Cart
// */


// final shoppingCartItemControllerProvider = StateNotifierProvider<ShoppingCartItemController, AsyncValue<void>>(
//   (ref) =>ShoppingCartItemController(cartService: ref.watch(cartServiceProvider))
// );

// class ShoppingCartItemController extends StateNotifier<AsyncValue<void>> {

//   ShoppingCartItemController({required this.cartService}): super(const AsyncData(null));

//   final CartService cartService;
//   Future<void> updateQuantity({required ProductID prodID, required int quantity}) async{
//     state = const AsyncLoading();
//     state = await AsyncValue.guard(
//       ()=> cartService.setItem(prodID: prodID, quantity: quantity),
//     );
//   }

//   Future<void> deleteItem({required ProductID prodID})async{
//     state = const AsyncLoading();
//     state = await AsyncValue.guard(
//       ()=> cartService.removeItemById(prodID: prodID),
//     );
//   }
// }