import 'dart:developer' as developer;

import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:app_demo/src/shared/http/sentry_reporter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

class SupabaseErrorHandle {
  static AppException handle(Object error) {
    if (error is AuthApiException) {
      final code = error.code;
      final normalizedMessage = error.message.toLowerCase();

      switch (code) {
        case 'invalid_credentials':
          return const AppException.badRequest(
            'Tài khoản hoặc mật khẩu không đúng',
          );

        case 'email_exists':
        case 'user_already_exists':
          return const AppException.badRequest('Email đã được đăng ký');

        case 'email_not_confirmed':
          return const AppException.badRequest('Vui lòng xác thực email');

        case 'email_address_invalid':
          return const AppException.badRequest('Email không hợp lệ');

        case 'signup_disabled':
          return const AppException.badRequest(
            'Chức năng đăng ký hiện đang tắt',
          );

        case 'otp_expired':
          return const AppException.badRequest(
            'Mã OTP đã hết hạn, vui lòng gửi lại',
          );

        case 'reauthentication_not_valid':
          return const AppException.badRequest(
            'Mã OTP không đúng',
          );

        case 'over_email_send_rate_limit':
          return const AppException.server(
            'Bạn đã yêu cầu quá nhiều email, vui lòng thử lại sau',
          );

        case 'session_expired':
          return const AppException.unauthorized();

        case 'over_request_rate_limit':
          return const AppException.server(
            'Bạn thao tác quá nhanh, thử lại sau',
          );

        case 'user_not_found':
          return const AppException.badRequest('Email chưa được đăng ký');
        default:
          if (_isUnregisteredEmailMessage(normalizedMessage)) {
            return const AppException.badRequest('Email chưa được đăng ký');
          }
          if (_isSamePasswordMessage(normalizedMessage)) {
            return const AppException.badRequest(
              'Mật khẩu mới phải khác mật khẩu cũ',
            );
          }
          SentryReporter.captureException(
            error
          );
          return AppException.errorWithMessage('Xảy ra lỗi, vui lòng thử lại');
      }
    }

    if (error is AuthException) {
      final message = error.message.toLowerCase();

      if (_isUnregisteredEmailMessage(message)) {
        return const AppException.badRequest('Email chưa được đăng ký');
      }
      if (_isSamePasswordMessage(message)) {
        return const AppException.badRequest(
          'Mật khẩu mới phải khác mật khẩu cũ',
        );
      }

      if (message.contains('otp')) {
        if (message.contains('expired')) {
          return const AppException.badRequest(
            'Mã OTP đã hết hạn, vui lòng gửi lại',
          );
        }
        if (message.contains('invalid')) {
          return const AppException.badRequest('Mã OTP không chính xác');
        }
        return const AppException.badRequest('Mã OTP không hợp lệ');
      }

      if (message.contains('rate limit') || message.contains('too many')) {
        return const AppException.server(
          'Bạn thao tác quá nhanh, thử lại sau',
        );
      }

      SentryReporter.captureException(error);
      return AppException.errorWithMessage('Xảy ra lỗi, vui lòng thử lại');
    }

    if (error is AuthInvalidJwtException ||
        error is AuthSessionMissingException) {
      SentryReporter.captureException(error);
      return const AppException.unauthorized();
    }

    if (error is AuthRetryableFetchException) {
      SentryReporter.captureException(error.toString());
      return const AppException.connectivity();
      
    }

    if (error is PostgrestException) {
      if (error.code == '42501') {
        return AppException.permissionDenied('Không có quyền truy cập');
      }
      if (error.code == '23505' || error.code == '23514') {
        return AppException.errorWithMessage('Dữ liệu không hợp lệ');
      }
      if (error.code == '23502') {
        return AppException.errorWithMessage('Thiếu thông tin bắt buộc');
      }
      if (error.code == 'PGRST116') {
        return AppException.errorWithMessage('Không tìm thấy dữ liệu');
      }
      developer.log(
        'PostgrestException: code=${error.code}, message=${error.message}',
        error: error,
      );
      SentryReporter.captureException(error);

      return AppException.errorWithMessage('Xảy ra lỗi, vui lòng thử lại');
    }
    SentryReporter.captureException(error);
    return const AppException.unknown();
  }

  static bool _isUnregisteredEmailMessage(String message) {
    return message.contains('user not found') ||
        message.contains('email not found') ||
        message.contains('not registered') ||
        message.contains('no user');
  }

  static bool _isSamePasswordMessage(String message) {
    return message.contains(
          'new password should be different from the old password',
        ) ||
        message.contains('password must be different from the old password') ||
        message.contains('new password must be different') ||
        message.contains('new password should be different');
  }
}
