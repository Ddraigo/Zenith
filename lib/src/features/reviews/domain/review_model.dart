

import 'package:app_demo/src/features/products/domain/product_model.dart';

typedef UserID = String;

class Review {

  final UserID userID;
  final ProductID prodID;
  final String? reviewDetail;
  final int score;

  Review({
    required this.userID,
    required this.prodID,
    required this.reviewDetail,
    required this.score,
  });

  factory Review.fromJson(Map<String, dynamic> data){

    final userID = data['userID'];
    if(userID is! UserID){
      throw FormatException('Invalid JSON: required "userID" field of type UserID in $data');
    }
    final prodID = data['productID'];
    if(prodID is! ProductID){
      throw FormatException('Invalid JSON: required "prodID" field of type ProductID in $data');
    }

    final reviewDetail = data['reviewDetail'] as String?;

    final score = data['score'];
    if(score is! int){
      throw FormatException('Invalid JSON: required "score" field of type int in $data');
    }

    return Review(
      userID: userID,
      prodID: prodID,
      reviewDetail: reviewDetail,
      score: score,
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'userID': userID,
      'productID': prodID,
      if(reviewDetail != null) 'reviewDetail': reviewDetail,
      'score': score,
    };
  }


}