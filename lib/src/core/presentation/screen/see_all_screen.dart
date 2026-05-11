
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SeeAllPageConfig {
  final String title;
  final Widget Function(ScrollController controller) pageBuilder;
  final Future<void> Function(WidgetRef ref)? onRefresh;
  final Future<void> Function(WidgetRef ref)? onLoadMore;

  const SeeAllPageConfig({
    required this.title,
    required this.pageBuilder,
    this.onRefresh,
    this.onLoadMore,
  });
}

class SeeAllPageScreen extends ConsumerStatefulWidget {
  const SeeAllPageScreen({super.key, required this.config});

  final SeeAllPageConfig config;

  @override
  ConsumerState<SeeAllPageScreen> createState() => _SeeAllPageScreenState();
}

class _SeeAllPageScreenState extends ConsumerState<SeeAllPageScreen> {
  late final ScrollController _scrollController;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() async {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    final reachBottom = position.pixels >= position.maxScrollExtent - 200;
    if (!reachBottom) return;
    if (_isLoadingMore) return;
    if (widget.config.onLoadMore == null) return;
    _isLoadingMore = true;
    await widget.config.onLoadMore!(ref);
    _isLoadingMore = false;
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.onPrimary,
        toolbarHeight: 70.h,
        titleSpacing: 0,
        centerTitle: true,
        title: Text(widget.config.title),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await widget.config.onRefresh?.call(ref);
          },
          child: widget.config.pageBuilder(_scrollController),
        ),
      ),
    );
  }
}