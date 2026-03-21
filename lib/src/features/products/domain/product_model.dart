
import 'package:app_demo/src/features/reviews/domain/review_model.dart';

// Các lớp này để model hóa các entites từ repositories

typedef ProductID = String; 

class Product{

  final ProductID id;
  final String imgURL;
  final String title;
  final double price;
  final int availableQuantity;
  final double? discountPrecent;
  final List<Review> reviewsData;

  Product({
    required this.id,
    required this.imgURL,
    required this.title,
    required this.price,
    required this.availableQuantity,
    this.discountPrecent,
    required this.reviewsData,
  });

  // serialization 
  factory Product.fromJson(Map<String, dynamic> data, ProductID id){
    if (data
      case {
        'id': ProductID id,
        'imgURL': String imgURL,
        'title': String title,
        'price': double price,
        'availableQuantity': int availableQuantity,
      })
    {
      final discountPrecent = data['discountPrecent'] as double?;
      final reviewsData = data['reviews'] as List<dynamic>?;

      return Product(
        id: id,
        imgURL: imgURL,
        title: title,
        price: price,
        availableQuantity:availableQuantity,
        discountPrecent: discountPrecent,
        reviewsData: reviewsData != null 
        ? reviewsData.map( (reviewsData) => Review.fromJson(reviewsData as Map<String, dynamic>)).toList()
        : <Review>[],

      );
    }else{
      if(data['id'] is! ProductID){
        throw FormatException('Invalid JSON: required "name" field of type ProductID in $data');
      }
      if(data['imgURL'] is! String || data['title'] is! String){
        throw FormatException('Invalid JSON: required "imgURL or title" field of type String in $data');
      }
      if(data['price'] is! double){
        throw FormatException('Invalid JSON: required "price" field of type double in $data');
      }
      if(data['availableQuantity'] is! int){
        throw FormatException('Invalid JSON: required "availableQuantity" field of type int in $data');
      }
      throw FormatException('Invalid JSON: $data');
    }
  }


  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'imgURL': imgURL,
      'title': title,
      'price': price,
      'availableQuantity': availableQuantity,
      if (discountPrecent != null) 'discountPrecent': discountPrecent,
      'reviews': reviewsData.map( (review) => review.toJson()).toList(),
    };
  }

}