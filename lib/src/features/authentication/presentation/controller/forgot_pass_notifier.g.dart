// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_pass_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ForgotPassNotifier)
final forgotPassProvider = ForgotPassNotifierProvider._();

final class ForgotPassNotifierProvider
    extends $NotifierProvider<ForgotPassNotifier, ForgotPasswordState> {
  ForgotPassNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'forgotPassProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$forgotPassNotifierHash();

  @$internal
  @override
  ForgotPassNotifier create() => ForgotPassNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ForgotPasswordState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ForgotPasswordState>(value),
    );
  }
}

String _$forgotPassNotifierHash() =>
    r'dac2ef5b5227ee036e75314f24125f386272a152';

abstract class _$ForgotPassNotifier extends $Notifier<ForgotPasswordState> {
  ForgotPasswordState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ForgotPasswordState, ForgotPasswordState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ForgotPasswordState, ForgotPasswordState>,
              ForgotPasswordState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
