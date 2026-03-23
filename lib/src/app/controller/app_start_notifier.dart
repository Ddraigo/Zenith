import 'package:app_demo/src/app/state/app_start_state.dart';
import 'package:app_demo/src/features/authentication/application/token_service.dart';
import 'package:app_demo/src/features/authentication/presentation/controller/auth_notifier.dart';
import 'package:app_demo/src/features/authentication/presentation/state/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_start_notifier.g.dart';

@riverpod
class AppStartNotifier extends _$AppStartNotifier {
  late final TokenService _tokenService = ref.read(tokenServiceProvider);

  @override
  FutureOr<AppStartState> build() async{
    ref.onDispose((){});

    final _authState = ref.watch(authProvider);

    if(_authState is AuthStateLoggedIn){
      return AppStartState.authenticated();
    }

    if(_authState is AuthStateLoggedOut){
      return AppStartState.authenticatedAnonymous();
    }

    final token = await _tokenService.fetchToken();
    if(token != null){
      return const AppStartState.authenticated();
    }else{
      return const AppStartState.unauthenticated();
    }


  }


}