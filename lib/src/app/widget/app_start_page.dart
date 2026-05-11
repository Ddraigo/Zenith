import 'package:app_demo/src/app/controller/app_start_notifier.dart';
import 'package:app_demo/src/app/state/app_start_state.dart';
import 'package:app_demo/src/features/authentication/presentation/screen/login/login_screen.dart';
import 'package:app_demo/src/features/home/presentation/home_screen.dart';
import 'package:app_demo/src/shared/http/supabase_provider.dart';
import 'package:app_demo/src/shared/widgets/connection_unavailable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppStartPage extends ConsumerWidget {
  const AppStartPage ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStartProvider);
    final data = state.asData?.value;
    final session = ref.read(supabaseClientProvider).auth.currentSession;
    final fallback = session != null ? HomeScreen() : LoginScreen();

    if (data == null) {
      return fallback;
    }

    return data.maybeWhen(
      initial: () => fallback,
      authenticated: () => HomeScreen(),
      unauthenticated: LoginScreen.new,
      internetUnAvaiable: () => const ConnectionUnavailableWidget(),
      orElse: () => fallback,
    );
    
  }
}
