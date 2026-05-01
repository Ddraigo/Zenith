

import 'dart:developer' as developer;
import 'dart:io';

import 'package:app_demo/src/shared/constants/avatar_config.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

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
        developer.log('User cancelled image picker');
        return null;
      }

      final file = File(image.path);
      if (!file.existsSync()) {
        throw AppException.errorWithMessage(
          'Không thể đọc ảnh. Vui lòng thử ảnh khác.',
        );
      }

      developer.log('Picked image: ${image.path}, size: ${await file.length()} bytes');
      return await _compressImage(file);
    } catch (e, st) {
      developer.log('Error picking image', error: e, stackTrace: st);
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
        developer.log('User cancelled camera');
        return null;
      }

      final file = File(image.path);
      if (!file.existsSync()) {
        throw AppException.errorWithMessage(
          'Không thể đọc ảnh. Vui lòng thử ảnh khác.',
        );
      }

      developer.log('Captured image: ${image.path}, size: ${await file.length()} bytes');
      return await _compressImage(file);
    } catch (e, st) {
      developer.log('Error capturing image', error: e, stackTrace: st);
      throw AppException.errorWithMessage(
        'Không thể chụp ảnh. Vui lòng thử lại.',
      );
    }
  }

  Future<File> _compressImage(File imageFile) async {
    try {
      developer.log('Starting image compression for: ${imageFile.path}');
      final originalSize = await imageFile.length();
      developer.log('Original file size: ${(originalSize / 1024).toStringAsFixed(2)} KB');

      final targetPath = _getTargetPath(imageFile);
      developer.log('Target path: $targetPath');

      // Ensure target directory exists
      final targetDir = Directory(File(targetPath).parent.path);
      if (!targetDir.existsSync()) {
        targetDir.createSync(recursive: true);
        developer.log('Created target directory: ${targetDir.path}');
      }

      developer.log(
        'Compressing with: quality=${AvatarConfig.compressionQuality}, '
        'size=${AvatarConfig.targetWidth}x${AvatarConfig.targetHeight}',
      );

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
      final compressedSize = await compressedFile.length();
      final ratio = (compressedSize / originalSize * 100).toStringAsFixed(1);

      developer.log(
        'Compression successful: ${(compressedSize / 1024).toStringAsFixed(2)} KB '
        '(${ratio}% of original)',
      );

      // Delete original file if compression was successful and files are different
      if (imageFile.path != compressedFile.path && imageFile.existsSync()) {
        imageFile.deleteSync();
        developer.log('Deleted original file: ${imageFile.path}');
      }

      return compressedFile;
    } catch (e, st) {
      developer.log(
        'Image compression failed',
        error: e,
        stackTrace: st,
        name: 'ImageUploadService._compressImage',
      );
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