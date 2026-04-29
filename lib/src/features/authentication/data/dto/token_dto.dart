
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/token_model.dart';
part 'token_dto.freezed.dart';
part 'token_dto.g.dart';
@freezed
abstract class TokenDTO with _$TokenDTO{

  const factory TokenDTO({
    required String token,
  }) = _TokenDTO;
  factory TokenDTO.fromJson(Map<String, dynamic> json) => _$TokenDTOFromJson(json);
  
}

extension TokenDTOMapper on TokenDTO {
  Token toDomain() {
    return Token(token: token);
  }
}