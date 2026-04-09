
import 'package:app_demo/src/core/data/dto/user_device_dto.dart';
import 'package:app_demo/src/core/data/source/user_device_source.dart';
import 'package:app_demo/src/core/domain/user_device_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDeviceRepoProvider = Provider<UserDeviceRepo>((ref) {
  final source = ref.watch(userDeviceSourceProvider);
  return UserDeviceRepo(source);
});

class UserDeviceRepo {
  final UserDeviceSource _source;

  UserDeviceRepo(this._source);


  Future<Either<AppException, List<UserDeviceModel>>> getUserFcmToken({required String userId}) async{
    final result = await _source.getUserFcmToken(userId: userId);
    return result.map((dailyword){
      return dailyword.map((dto) => dto.toDomain()).toList();
    });

  }

  Future<Either<AppException, bool>> deleteFcmToken({
    required String userId,
    required String fcmToken,
  }) async {
    return _source.deleteFcmToken(userId: userId, fcmToken: fcmToken);
  }


  

}