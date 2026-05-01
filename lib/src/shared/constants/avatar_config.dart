/// Avatar optimization configuration
/// 
/// Best practices for avatar storage:
/// - Nén & resize tại client (ImageUploadService)
/// - Mỗi user chỉ có 1 avatar file: {userId}/avatar.webp
/// - Ghi đè file cũ khi user cập nhật avatar mới
/// - Tiết kiệm storage: ~50MB → 1000+ avatars (thay vì vài chục)
class AvatarConfig {
  /// Target dimensions for avatar image
  static const int targetWidth = 400;
  static const int targetHeight = 400;

  static const int compressionQuality = 75;

  /// (WebP < ~60%  PNG/JPG)
  static const String fileFormat = 'webp';

  /// Avatar storage path pattern: {userId}/avatar.{fileFormat}
  static String getAvatarPath(String userId) => '$userId/avatar.$fileFormat';

  /// Bucket name in Supabase Storage
  static const String bucketName = 'profiles';

  /// Cache control duration (in seconds)
  /// Files are cached for 1 hour before checking for updates
  static const String cacheControl = '3600';


  static const String expectedSize = '20-50KB';
}
