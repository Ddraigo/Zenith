
import 'package:app_demo/src/features/flashcard/domain/flashcard_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'deck_model.freezed.dart';

@freezed
abstract class DeckModel with _$DeckModel{
  const factory DeckModel({
    String? id,
    required String name,
    String? learningTypeId,
    String? topicId,
    String? level,
    String? description,
    String? imageUrl,
    String? createdBy,
    required bool isSystem,
    required bool isPublic,
    required bool isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _DeckModel;
}

// extension ListFlashcard on DeckModel{
//   List<FlashcardModel> getListFlashCard(){
    
//   }
// }





// extension DeckValidate on DeckModel{
//   // bool isValidName(String name){
//   //   if(!Validator.isValidValue(name)){

//   //     return false;
//   //   }
//   //   return true;
//   // }


// }

// class Cart{

//   final Map<ProductID, int> items;

//   // tạo một object Cart bất biến, nếu muốn thay đổi bên trong (items) -> tạo object mới -> biết đc state có thay đổi -> dễ QL
//   const Cart([this.items = const {}]);

//   factory Cart.fromJson(Map<String, dynamic> data){

//     final items = data['items'] as Map<String, dynamic>?;
//     return Cart(
//       items != null ? items.map( (key, value) => MapEntry(key, value as int)) : {},
//     );
//   }

//   Map<String, dynamic> toJson() => {'items': items};


// }


// extension có thể định nghĩa thêm các method cho class đó mà không cần phải sửa đổi ngay trong class -> tiện lợi
// extension MutableCart on Cart{
  
//   Cart addItem({required ProductID prodID, required int quantity }){
//     final copy = Map<ProductID, int>.from(items);
//     copy[prodID] = quantity + (copy[prodID] ?? 0);
//     return Cart(copy);
//   }

//   Cart removeItemById({required ProductID prodID}){
//     final copy = Map<ProductID, int>.from(items);
//     if(copy.isEmpty){
//       throw FormatException('This cart empty!');
//     }else if (!copy.containsKey(prodID)){
//       throw FormatException('This product is not in the cart');
//     }
//     else{
//       copy.remove(prodID);
//     }
//     return Cart(copy);
//   }

//   Cart setItem({required ProductID prodID, required int quantity}){
//     final copy = Map<ProductID, int>.from(items);
//     if(!copy.containsKey(prodID)){
//       throw FormatException('Not found $prodID in Cart');
//     }
//     copy[prodID] = quantity;
//     return Cart(copy);
//   }

// }





