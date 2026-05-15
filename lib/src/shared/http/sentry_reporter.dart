
import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SentryReporter {
  static Future<void> captureException(
    Object error, {
    StackTrace? stackTrace,
    Map<String, dynamic>? context,
    Map<String, dynamic>? tags,
    String? fingerprint,

    /// Mặc định nhóm lỗi theo stackTrace
    SentryLevel level = SentryLevel.error,
  }) async {
    try {
      final event = SentryEvent(
        throwable: error,
        level: level,
        fingerprint: fingerprint != null ? [fingerprint] : null,
      );

      await Sentry.captureEvent(
        event,
        stackTrace: stackTrace,
        withScope: (scope) {
          context?.forEach((key, value) {
            if (value is Map<String, dynamic>) {
              scope.setContexts(key, value);
            } else {
              scope.setContexts(key, {'value': value});
            }
          });
          tags?.forEach((key, value) {
            scope.setTag(key, value);
          });
          scope.setTag('environment', kReleaseMode ? 'production' : 'development');
        },
      );
    } catch (e) {
      debugPrint('Sentry logging failed: $e');
    }
  }

  static Future<void> addBreadcrumb(
    String message, {
    Map<String, dynamic>? data,
    String? category,
  }) async {
    try {
      Sentry.addBreadcrumb(
        Breadcrumb(message: message, data: data, category: category),
      );
    } catch (_) {}
  }

  static void setUser({required String id, String? email}) {
    Sentry.configureScope(
      (scope) => scope.setUser(SentryUser(id: id, email: email)),
    );
  }

  static void clearUser() {
    Sentry.configureScope((scope) => scope.setUser(null));
  }

  static void setTag(String key, String value) {
    Sentry.configureScope((scope) => scope.setTag(key, value));
  }

  static void setContext(String key, Map<String, dynamic> data) {
    Sentry.configureScope((scope) => scope.setContexts(key, data));
  }
}
