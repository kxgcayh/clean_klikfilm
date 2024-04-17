import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

final categoriesFutureProvider = FutureProvider((ref) async {
  final result = await ref.read(listHomeCategoryProvider);
  return result.data;
});

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
