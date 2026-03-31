import 'package:app_demo/src/features/topic/presentation/controller/topic_notifier.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListTopic extends ConsumerWidget {
  const ListTopic({super.key});

  /// Build error message dựa vào exception type
  String _getErrorMessage(AppException exception) {
    return exception.when(
      connectivity: () => 'Lỗi kết nối mạng. Vui lòng kiểm tra internet.',
      unauthorized: () => 'Không có quyền truy cập. Vui lòng đăng nhập lại.',
      errorWithMessage: (msg) => 'Lỗi: $msg',
      unknown: () => 'Đã xảy ra lỗi không xác định.',
      badRequest: (msg) => 'Yêu cầu không hợp lệ: $msg',
      server: (msg) => 'Lỗi từ server: $msg',
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topicAsync = ref.watch(topicProvider);
    
    return topicAsync.when(
      /// UI Layer - Hiển thị dữ liệu
      data: (topics) {
        if (topics.isEmpty) {
          return const Center(
            child: Text('Không tìm thấy danh sách nào'),
          );
        }
        return ListView.builder(
          itemCount: topics.length,
          itemBuilder: (context, index) {
            final topic = topics[index];
            return Card(
              child: ListTile(
                title: Text(topic.name),
              ),
            );
          },
        );
      },
      /// UI Layer - Hiển thị lỗi chi tiết
      error: (error, stackTrace) {
        final errorMsg = error is AppException
            ? _getErrorMessage(error)
            : 'Lỗi: ${error.toString()}';
        
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 48),
              const SizedBox(height: 16),
              Text(errorMsg, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.refresh(topicProvider);
                },
                child: const Text('Thử lại'),
              ),
            ],
          ),
        );
      },
      /// UI Layer - Loading
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}