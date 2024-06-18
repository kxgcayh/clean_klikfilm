import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fl_klikfilm/app/providers/banner/banner_provider.dart';
import 'package:fl_klikfilm/app/providers/categories/categories_provider.dart';
import 'package:fl_klikfilm/app/providers/connectivity_provider.dart';
import 'package:fl_klikfilm/app/routes/app_router.dart';
import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:fl_klikfilm/app/widgets/kf_app_bar.dart';
import 'package:fl_klikfilm/app/widgets/kf_image.dart';
import 'package:fl_klikfilm/app/widgets/kf_shimmer.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:fl_klikfilm/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterlifecyclehooks/flutterlifecyclehooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

part 'home_page.p.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bannerProvider = ref.watch(bannerStateProvider);
    final categoriesProvider = ref.watch(categoriesAsyncNotifier);
    final categoriesNotifier = ref.read(categoriesAsyncNotifier.notifier);
    final Debouncer debouncer = useMemoized(() => Debouncer());
    final sheetController = useMemoized(() => SheetController());
    final isLoadingMore = useState(false);
    final canLoadMore = useState(true);

    void scrollListener() {
      if ((sheetController.value ?? 0) > (sheetController.metrics?.maxPixels ?? 0)) {
        if (!isLoadingMore.value && canLoadMore.value) {
          isLoadingMore.value = true;
          debouncer.debounce(
            type: BehaviorType.trailingEdge,
            duration: Duration(seconds: 1),
            onDebounce: () async {
              await categoriesNotifier.scroll().then((bool status) {
                isLoadingMore.value = false;
                canLoadMore.value = status;
              });
            },
          );
        }
      }
    }

    useEffect(() {
      sheetController.addListener(scrollListener);
      return () {
        debouncer.cancel();
        sheetController.removeListener(scrollListener);
      };
    }, [sheetController, debouncer]);

    return LifecycleHooksSubscriber(
      onAppLifecycleChange: (event) async {
        final connection = ref.watch(connectityNotifier);
        if (connection != ConnectivityResult.none && event == AppLifecycleState.resumed) {
          await ref.read(localUserNotifierProvider.notifier).updateCountryCode();
        }
      },
      child: Scaffold(
        appBar: KfAppBar(),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.52,
              child: Align(
                alignment: Alignment.topCenter,
                child: bannerProvider.when(
                  data: (state) {
                    return KFImage(
                      width: double.infinity,
                      '${state.banner.thumbnail?.the380x543}',
                      boxFit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                      onTap: () {
                        VideoRoute(
                          videoId: state.banner.id,
                          subcategoryId: state.banner.subcategory?.id,
                        ).push(context);
                      },
                    );
                  },
                  error: (error, stack) => GestureDetector(
                    onTap: () => ref.invalidate(bannerStateProvider),
                    child: KfShimmer(highlightColor: Colors.red),
                  ),
                  loading: () => KfShimmer(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height / 1.285),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Assets.pictures.logo.image(width: 134, height: 26),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height / 1.285),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            ScrollableSheet(
              controller: sheetController,
              initialExtent: Extent.pixels(
                MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height / 1.35),
              ),
              minExtent: Extent.pixels(
                MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height / 1.35),
              ),
              physics: StretchingSheetPhysics(
                stretchingRange: const Extent.proportional(0.050),
                parent: SnappingSheetPhysics(
                  snappingBehavior: SnapToNearest(
                    snapTo: [
                      Extent.pixels(
                        MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height / 1.35),
                      ),
                      const Extent.proportional(0.8),
                      const Extent.proportional(1),
                    ],
                  ),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage(Assets.pictures.batikDrawer.path),
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.fitHeight,
                    repeat: ImageRepeat.repeatY,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: categoriesProvider.when(
                  data: (categories) => ListView.builder(
                    itemCount: categories.index,
                    itemBuilder: (context, parentIndex) {
                      final VideoHomeCategoryModel category = categories.data[parentIndex];
                      return category.when(
                        myList: (type, title) {
                          final provider = ref.watch(playlistFutureProvider);
                          return provider.when(
                            data: (playlist) {
                              return playlist.contents.isNotEmpty
                                  ? PanelCategoryHeader(
                                      index: parentIndex,
                                      title: title,
                                      onTapMore: playlist.contents.length > 3
                                          ? () {
                                              klog.i('onTapMore: $type');
                                            }
                                          : null,
                                      child: PanelCategoryContents(
                                        parentIndex: parentIndex,
                                        contents: playlist.contents,
                                        onTap: (content) {
                                          VideoRoute(
                                            videoId: content.id,
                                            subcategoryId: content.subcategory?.id,
                                          ).push(context);
                                        },
                                      ),
                                    )
                                  : SizedBox.shrink();
                            },
                            error: (error, stackTrace) => SizedBox.shrink(),
                            loading: () => PanelCategoryHeader(
                              title: title,
                              child: PanelCategoryContents(parentIndex: parentIndex),
                            ),
                          );
                        },
                        hashtag: (type, tag, title) {
                          final provider = ref.watch(
                            videoByHashtagProvider(VideoHashtagFamily(tag: tag)),
                          );
                          return PanelCategoryHeader(
                            index: parentIndex,
                            title: title,
                            onTapMore: () {
                              klog.i('onTapMore: $type');
                            },
                            child: provider.when(
                              data: (hashtag) => PanelCategoryContents(
                                parentIndex: parentIndex,
                                contents: hashtag.data?.contents ?? [],
                                onTap: (content) {
                                  VideoRoute(
                                    videoId: content.id,
                                    subcategoryId: content.subcategory?.id,
                                  ).push(context);
                                },
                              ),
                              error: (error, stackTrace) => null,
                              loading: () => PanelCategoryContents(parentIndex: parentIndex),
                            ),
                          );
                        },
                        trending: (type, title) {
                          final provider = ref.watch(trendingCategoryFutureProvider(
                            const VideoTrendingFamily(random: true, offset: 6),
                          ));
                          return PanelCategoryHeader(
                            index: parentIndex,
                            title: title,
                            onTapMore: () {
                              klog.i('onTapMore: $type');
                            },
                            child: provider.when(
                              data: (trending) => PanelCategoryContents(
                                parentIndex: parentIndex,
                                contents: trending.data,
                                onTap: (content) {
                                  VideoRoute(
                                    videoId: content.id,
                                    subcategoryId: content.subcategory?.id,
                                  ).push(context);
                                },
                              ),
                              error: (error, stackTrace) => null,
                              loading: () => PanelCategoryContents(parentIndex: parentIndex),
                            ),
                          );
                        },
                        highlight: (type, id, title, liveStream, streamingCode) {
                          final provider = ref.watch(highlightsByCategoryProvider(
                            HighlightCategoryFamily(categoryId: id, offset: 6),
                          ));
                          return PanelCategoryHeader(
                            index: parentIndex,
                            title: title,
                            onTapMore: () {
                              klog.i('onTapMore: $type');
                            },
                            child: provider.when(
                              data: (higlight) => PanelCategoryContents(
                                parentIndex: parentIndex,
                                contents: higlight.data?.contents ?? [],
                                onTap: (content) {
                                  VideoRoute(
                                    videoId: content.id,
                                    subcategoryId: content.subcategory?.id,
                                  ).push(context);
                                },
                              ),
                              error: (error, stackTrace) => null,
                              loading: () => PanelCategoryContents(parentIndex: parentIndex),
                            ),
                          );
                        },
                        continueWatching: (type, title) {
                          final provider = ref.watch(continueWatchingProvider);
                          return provider.when(
                            data: (continueWatching) {
                              return continueWatching.data.isNotEmpty
                                  ? PanelCategoryHeader(
                                      index: parentIndex,
                                      title: title,
                                      onTapMore: continueWatching.data.length > 3
                                          ? () {
                                              klog.i('onTapMore: $type');
                                            }
                                          : null,
                                      child: PanelCategoryContents(
                                        parentIndex: parentIndex,
                                        contents: continueWatching.data,
                                        onTap: (content) {
                                          VideoRoute(
                                            videoId: content.id,
                                            subcategoryId: content.subcategory?.id,
                                          ).push(context);
                                        },
                                      ),
                                    )
                                  : SizedBox.shrink();
                            },
                            error: (error, stackTrace) => SizedBox.shrink(),
                            loading: () => PanelCategoryHeader(
                              title: title,
                              child: PanelCategoryContents(parentIndex: parentIndex),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  error: (error, stackTrace) => SizedBox.shrink(),
                  loading: () => ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: index == 0
                            ? BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(Assets.pictures.batikPanel.path),
                                  alignment: Alignment.topCenter,
                                  repeat: ImageRepeat.repeatX,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(2),
                                  topRight: Radius.circular(2),
                                ),
                                gradient: LinearGradient(
                                  colors: KColors.primaryGradient,
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              )
                            : null,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 12,
                                right: 12,
                                top: index == 0 ? 12 : 24,
                                bottom: 8,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      KfShimmer(
                                        width: 166,
                                        height: 27,
                                        baseColor: KColors.primaryGrey.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(4.5),
                                      ),
                                      SizedBox(height: 4),
                                      KfShimmer(
                                        width: 24,
                                        height: 3,
                                        baseColor: KColors.primaryGrey.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(4.5),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      KfShimmer(
                                        width: 32,
                                        height: 16,
                                        baseColor: KColors.primaryGrey.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(4.5),
                                      ),
                                      SizedBox(height: 4),
                                      KfShimmer(
                                        width: 12,
                                        height: 3,
                                        baseColor: KColors.primaryGrey.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(4.5),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: index == 0 ? 230 : 200,
                              child: ListView.builder(
                                itemCount: 6,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemExtent: index == 0 ? 170 : 140,
                                padding: EdgeInsets.only(left: 12, right: 4),
                                itemBuilder: (context, index) {
                                  return LayoutBuilder(builder: (context, constraints) {
                                    return Padding(
                                      padding: EdgeInsets.only(right: 8),
                                      child: KfShimmer(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    );
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isLoadingMore.value,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: KColors.primaryGrey.withOpacity(0.85),
                  ),
                  child: Center(child: LottieBuilder.asset(Assets.animations.loadingBar)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
