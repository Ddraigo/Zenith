
import 'package:app_demo/src/features/authentication/application/auth_service.dart';
import 'package:app_demo/src/features/authentication/presentation/state/auth_state.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier{

  @override
  AuthState build(){
    return const AuthState.initial();
  }

  late final AuthService _authService = ref.read(authServiceProvider);

  Future<void> login(String email, String password) async{

    state = const AuthState.loading();
    try{
      await _authService.login(email, password);
      state = AuthState.loggedIn();
    } on AppException catch (e){
      state = AuthState.error(e);
    } catch (_){
      state = const AuthState.error(AppException.error());
    }
    

  }

  Future<void> logout() async{
    state = const AuthState.loading();
    try{
      await _authService.signOut();
      state = AuthState.loggedIn();
    } on AppException catch (e){
      state = AuthState.error(e);
    } catch (_){
      state = const AuthState.error(AppException.error());
    }
  }
}