import 'package:flutter_riverpod/flutter_riverpod.dart';

base class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    if (newValue is int) {
      print(
      '[${context.provider.name ?? context.provider.runtimeType}] '
      'prev: $previousValue -> next: $newValue',
    );
    }
  }
}
