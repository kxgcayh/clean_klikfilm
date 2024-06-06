import 'dart:async';

import 'package:fl_klikfilm/app/providers/banner/banner_provider.dart';
import 'package:fl_klikfilm/app/providers/categories/video_categories_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

final categoriesAsyncNotifier = AsyncNotifierProvider<VideoCategoriesNotifier, VideoCategoriesState>(
  () => VideoCategoriesNotifier(),
);

class VideoCategoriesNotifier extends AsyncNotifier<VideoCategoriesState> {
  @override
  FutureOr<VideoCategoriesState> build() async {
    final result = await ref.read(listHomeCategoryProvider.future);
    return VideoCategoriesState(
      total: result.data.length,
      index: result.data.length <= 6 ? result.data.length : 6,
      data: result.data,
    );
  }

  Future<bool> scroll() async {
    final previousState = await future;
    final nextIndex = previousState.index + 5;
    state = AsyncData(previousState.copyWith(
      index: previousState.total >= nextIndex ? nextIndex : previousState.total,
    ));
    return previousState.total >= nextIndex;
  }

  Future<void> forceRefresh() async {
    ref.invalidateSelf();
    ref.invalidate(bannerStateProvider);
    ref.invalidate(highlightsByCategoryProvider);
    ref.invalidate(trendingCategoryFutureProvider);
    ref.invalidate(videoByHashtagProvider);
    ref.invalidate(playlistFutureProvider);
    ref.invalidate(continueWatchingProvider);
  }
}

final trendingCategoryFutureProvider = FutureProviderFamily((ref, VideoTrendingFamily arg) async {
  return await ref.watch(videoTrendingProvider(arg));
});

final playlistFutureProvider = FutureProvider((ref) async {
  final result = await ref.watch(playlistProvider);
  return result.data as VideoHighlightModel;
});
