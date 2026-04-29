
import 'package:freezed_annotation/freezed_annotation.dart';
part 'token_model.freezed.dart';
@freezed
abstract class Token with _$Token{

  const factory Token({
    required String token
  }) = _Token;

}