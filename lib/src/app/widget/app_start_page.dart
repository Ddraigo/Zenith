import 'package:app_demo/src/app/controller/app_start_notifier.dart';
import 'package:app_demo/src/app/state/app_start_state.dart';
import 'package:app_demo/src/features/authentication/presentation/screen/login/login_screen.dart';
import 'package:app_demo/src/features/authentication/presentation/screen/onboarding/onboarding_screen.dart';
import 'package:app_demo/src/features/home/presentation/home_screen.dart';
import 'package:app_demo/src/shared/widgets/connection_unavailable_widget.dart';
import 'package:app_demo/src/shared/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppStartPage extends ConsumerWidget {
  const AppStartPage ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStartProvider);

    return state.when(
      data: (data){
        return data.maybeWhen(
          initial: () => const OnboardingScreen(),
          authenticated: () => HomeScreen(),
          unauthenticated: LoginScreen.new,
          internetUnAvaiable: () => const ConnectionUnavailableWidget(),
          orElse: () => const OnboardingScreen(),
        );
      }, 
      error: (e, st) => const Center(child: Text('Đã có lỗi xảy ra'),), 
      loading: ()=> const LoadingWidget(isLoading: true, child: Text('Đang tải'),));
    
  }
}
