import 'package:app_demo/src/app/state/app_start_state.dart';
import 'package:app_demo/src/features/authentication/application/token_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_start_notifier.g.dart';

@riverpod
class AppStartNotifier extends _$AppStartNotifier {
  @override
  FutureOr<AppStartState> build() async {
    final tokenService = ref.read(tokenServiceProvider);
    final token = await tokenService.fetchToken();

    if (token != null) {
      return const AppStartState.authenticated();
    } else {
      return const AppStartState.unauthenticated();
    }
  }
}