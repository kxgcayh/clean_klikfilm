import 'dart:async';

import 'package:fl_klikfilm/app/providers/categories/video_categories_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

final categoriesAsyncNotifier = AsyncNotifierProvider<VideoCategoriesNotifier, VideoCategoriesState>(
  () => VideoCategoriesNotifier(),
);

class VideoCategoriesNotifier extends AsyncNotifier<VideoCategoriesState> {
  @override
  FutureOr<VideoCategoriesState> build() async {
    final result = await ref.read(listHomeCategoryProvider);
    return VideoCategoriesState(
      total: result.data.length,
      index: result.data.length <= 6 ? result.data.length : 6,
      data: result.data,
    );
  }

  Future<void> scroll() async {
    final previousState = await future;
    final nextIndex = previousState.index + 5;
    state = AsyncData(previousState.copyWith(
      index: previousState.total >= nextIndex ? nextIndex : previousState.total,
    ));
  }
}

final higlightsCategoryFutureProvider = FutureProviderFamily((ref, HighlightCategoryFamily arg) async {
  final result = await ref.read(highlightsByCategoryProvider(arg));
  return result.data as VideoHighlightModel;
});

final trendingCategoryFutureProvider = FutureProviderFamily((ref, VideoTrendingFamily arg) async {
  final result = await ref.read(videoTrendingProvider(arg));
  return result;
});

final videoHashtagFutureProvider = FutureProviderFamily((ref, VideoHashtagFamily arg) async {
  final result = await ref.read(videoByHashtagProvider(arg));
  return result.data as VideoHighlightModel;
});

final playlistFutureProvider = FutureProvider((ref) async {
  final result = await ref.read(playlistProvider);
  return result.data as VideoHighlightModel;
});

final continueWatchingFutureProvider = FutureProvider((ref) async {
  final result = await ref.read(continueWatchingProvider);
  return result.data as VideoHighlightModel;
});
