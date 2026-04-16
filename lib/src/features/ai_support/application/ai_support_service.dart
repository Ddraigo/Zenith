
import 'package:app_demo/src/features/ai_support/data/repository/ai_support_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final aiSupportServiceProvider = Provider(AISupportService.new);

class AISupportService {
  final Ref _ref;
  AISupportService(this._ref);
  late final _repo = _ref.read(aiSupportRepoProvider);

}