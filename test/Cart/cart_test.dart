

import 'package:app_demo/src/features/cart/domain/cart_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('add items', (){
    test('empty cart - add item', (){
      final cart = const Cart().addItem(prodID: 'P001', quantity: 10);
      expect(cart.items, {'P001': 10});
    });

    test('add 2 items different', (){
      final cart = const Cart()
        .addItem(prodID: 'P001', quantity: 10)
        .addItem(prodID: 'P002', quantity: 1);
      
      print(cart.items);

      expect(cart.items, {
        'P001':10,
        'P002':1,
      });
    });

    test('add twice into a item', (){
      final cart = const Cart()
        .addItem(prodID: 'P001', quantity: 12)
        .addItem(prodID: 'P001', quantity: 1);
      expect(cart.items, {'P001': 13});
    });

    test('old cart should not change', (){
      final cart = const Cart();
      final newCart = cart.addItem(prodID: 'P001', quantity: 3);
      expect(cart, isNot(newCart));
      expect(cart.items, {});
      expect(newCart.items, {'P001':3});
    });

  }
  );
  
  group('remove items', (){
    test('cart have 1 item - remove item', (){
      final cart = const Cart().addItem(prodID: 'P001', quantity: 10);
      
      final newCart = cart.removeItemById(prodID: 'P001');
      expect(newCart.items, {});
    });

    test('empty cart - remove item', (){
      final cart2 = const Cart();
      expect(()=>cart2.removeItemById(prodID: '001'), throwsA(isA<FormatException>()));
    });

    
  
  });
}