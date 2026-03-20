import 'package:app_demo/src/features/products/domain/product_model.dart';

class Cart{

  final Map<ProductID, int> items;

  // tạo một object Cart bất biến, nếu muốn thay đổi bên trong (items) -> tạo object mới -> biết đc state có thay đổi -> dễ QL
  const Cart([this.items = const {}]);

  factory Cart.fromJson(Map<String, dynamic> data){

    final items = data['items'] as Map<String, dynamic>?;
    return Cart(
      items != null ? items.map( (key, value) => MapEntry(key, value as int)) : {},
    );
  }

  Map<String, dynamic> toJson() => {'items': items};

}


// extension có thể định nghĩa thêm các method cho class đó mà không cần phải sửa đổi ngay trong class -> tiện lợi
extension MutableCart on Cart{
  
  Cart addItem({required ProductID prodID, required int quantity }){
    final copy = Map<ProductID, int>.from(items);
    copy[prodID] = quantity + (copy[prodID] ?? 0);
    return Cart(copy);
  }

  Cart removeItemById({required ProductID prodID}){
    final copy = Map<ProductID, int>.from(items);
    if(copy.isEmpty){
      throw FormatException('This cart empty!');
    }else if (!copy.containsKey(prodID)){
      throw FormatException('This product is not in the cart');
    }
    else{
      copy.remove(prodID);
    }
    return Cart(copy);
  }

  Cart setItem({required ProductID prodID, required int quantity}){
    final copy = Map<ProductID, int>.from(items);
    if(!copy.containsKey(prodID)){
      throw FormatException('Not found $prodID in Cart');
    }
    copy[prodID] = quantity;
    return Cart(copy);
  }

}





