# Sentry Coverage Checklist for App Demo

## Overview

This checklist ensures consistent, non-redundant Sentry instrumentation across the Flutter app.

**Current Status:**
- `SentryFlutter.init()` configured in `lib/start.dart`
- `SentryReporter` helper class provides standardized capture methods
- `SupabaseErrorHandle` captures unhandled Supabase errors

## Confirmed Schema

Tags (examples): `feature`, `layer`, `action`, `flow`, `environment`, `platform`, `error_category`.

Contexts (examples): `user_context`, `request_info`, `payload_summary`, `device_context`, `operation_context`, `error_code`.

## Prioritized Files & TODOs

- `lib/start.dart` — add breadcrumbs and targeted captures for startup init failures
- `lib/src/features/authentication/` — ensure `setUser`/`clearUser` and consistent captures
- `lib/src/core/service/firebase_messaging_service.dart` — capture permission/token failures, add breadcrumbs
- `lib/src/core/service/device_service.dart` — capture token sync/delete failures
- `lib/src/core/service/image_upload_service.dart` — capture upload/compress failures and payload summary

## Verification Steps

1. Confirm `SentryReporter.captureException()` signature accepts `tags` and `context`.
2. After changes run:

```bash
flutter analyze
dart format --set-exit-if-changed lib/
```

## PII Policy

Allowed: masked emails, user IDs, file size/format. Never capture raw passwords, tokens, full file paths, or raw request/response bodies.

---

Last Updated: May 15, 2026
