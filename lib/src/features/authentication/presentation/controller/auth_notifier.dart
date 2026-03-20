
import 'package:app_demo/src/features/authentication/application/auth_service.dart';
import 'package:app_demo/src/features/authentication/application/token_service.dart';
import 'package:app_demo/src/features/authentication/presentation/state/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier{

  @override
  AuthState build(){
    return const AuthState.initial();
  }

  late final AuthService _loginService = ref.read(authServiceProvider);

  Future<void> login(String email, String password) async{
    state = await _loginService.login(email, password);
  }

  late final TokenService _tokenService = ref.read(tokenServiceProvider);

  Future<void> logout() async{
    await _tokenService.remove();
    state = const AuthState.loggedOut();
  }
}