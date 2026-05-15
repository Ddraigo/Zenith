

import 'dart:developer' as developer;
import 'dart:io';
import 'package:flutter/foundation.dart';

import 'package:app_demo/src/shared/constants/avatar_config.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/http/sentry_reporter.dart';

final imageUploadServiceProvider = Provider<ImageUploadService>((ref) {
  return ImageUploadService();
});

class ImageUploadService {
  final _imagePicker = ImagePicker();

  Future<File?> pickImage() async {
    try {
      final image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (image == null) {
        if (kDebugMode) developer.log('User cancelled image picker');
        Future.microtask(() => SentryReporter.addBreadcrumb(
              'Image pick cancelled',
              category: 'image_upload',
              data: {'source': 'gallery'},
            ));
        return null;
      }

      final file = File(image.path);
      if (!file.existsSync()) {
        if (kDebugMode) developer.log('Selected image file not found: ${file.path}');
        Future.microtask(() => SentryReporter.addBreadcrumb(
              'Selected image file missing',
              category: 'image_upload',
              data: {'path_summary': file.path.split('/').last},
            ));
        throw AppException.errorWithMessage(
          'Không thể đọc ảnh. Vui lòng thử ảnh khác.',
        );
      }

      return await _compressImage(file);
    } catch (e, st) {
      Future.microtask(() => SentryReporter.captureException(
            e,
            stackTrace: st,
            tags: {
              'feature': 'image_upload',
              'action': 'pickImage',
              'layer': 'service'
            },
          ));
      throw AppException.errorWithMessage(
        'Không thể chọn ảnh. Vui lòng thử lại.',
      );
    }
  }

  /// Chọn ảnh từ camera và nén tự động
  Future<File?> pickImageFromCamera() async {
    try {
      final image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );
      if (image == null) {
        if (kDebugMode) developer.log('User cancelled camera');
        Future.microtask(() => SentryReporter.addBreadcrumb(
              'Image pick cancelled',
              category: 'image_upload',
              data: {'source': 'camera'},
            ));
        return null;
      }

      final file = File(image.path);
      if (!file.existsSync()) {
        if (kDebugMode) developer.log('Captured image file not found: ${file.path}');
        Future.microtask(() => SentryReporter.addBreadcrumb(
              'Captured image file missing',
              category: 'image_upload',
              data: {'path_summary': file.path.split('/').last},
            ));
        throw AppException.errorWithMessage(
          'Không thể đọc ảnh. Vui lòng thử ảnh khác.',
        );
      }

      return await _compressImage(file);
    } catch (e, st) {
      Future.microtask(() => SentryReporter.captureException(
            e,
            stackTrace: st,
            tags: {
              'feature': 'image_upload',
              'action': 'pickImageFromCamera',
              'layer': 'service'
            },
          ));
      throw AppException.errorWithMessage(
        'Không thể chụp ảnh. Vui lòng thử lại.',
      );
    }
  }

  Future<File> _compressImage(File imageFile) async {
    try {

      final targetPath = _getTargetPath(imageFile);

      // Ensure target directory exists
      final targetDir = Directory(File(targetPath).parent.path);
      if (!targetDir.existsSync()) {
        targetDir.createSync(recursive: true);
      }


      final compressedXFile = await FlutterImageCompress.compressAndGetFile(
        imageFile.absolute.path,
        targetPath,
        quality: AvatarConfig.compressionQuality,
        format: CompressFormat.webp,
        minWidth: AvatarConfig.targetWidth,
        minHeight: AvatarConfig.targetHeight,
        rotate: 0,
      );

      if (compressedXFile == null) {
        throw AppException.errorWithMessage('Không thể nén ảnh. Vui lòng thử lại.');
      }

      final compressedFile = File(compressedXFile.path);
      if (imageFile.path != compressedFile.path && imageFile.existsSync()) {
        imageFile.deleteSync();
        if (kDebugMode) developer.log('Deleted original file: ${imageFile.path}');
        Future.microtask(() => SentryReporter.addBreadcrumb(
              'Original image deleted after compression',
              category: 'image_upload',
              data: {'deleted_file': imageFile.path.split('/').last},
            ));
      }

      return compressedFile;
    } catch (e, st) {
      if (kDebugMode) {
        developer.log(
          'Image compression failed',
          error: e,
          stackTrace: st,
          name: 'ImageUploadService._compressImage',
        );
      }
      Future.microtask(() => SentryReporter.captureException(
            e,
            stackTrace: st,
            tags: {
              'feature': 'image_upload',
              'action': 'compressImage',
              'layer': 'service'
            },
          ));
      throw AppException.errorWithMessage('Không thể nén ảnh. Vui lòng thử lại.');
    }
  }

  /// Tạo đường dẫn tạm cho file nén
  String _getTargetPath(File imageFile) {
    final dir = imageFile.parent.path;
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return '$dir/avatar_compressed_$timestamp.webp';
  }
}