import 'package:fl_klikfilm/app/providers/banner/banner_provider.dart';
import 'package:fl_klikfilm/app/providers/categories/categories_provider.dart';
import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:fl_klikfilm/app/widgets/kf_app_bar.dart';
import 'package:fl_klikfilm/app/widgets/kf_image.dart';
import 'package:fl_klikfilm/app/widgets/kf_shimmer.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:fl_klikfilm/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

part 'home_page.p.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bannerProvider = ref.watch(bannerStateProvider);
    final categoriesProvider = ref.watch(categoriesFutureProvider);
    final dummies = List.generate(20, (index) => 'Item-$index');
    return Scaffold(
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
                    boxFit: BoxFit.fitHeight,
                    alignment: Alignment.topCenter,
                    onTap: () {},
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
            initialExtent: Extent.pixels(
              MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height / 1.3),
            ),
            minExtent: Extent.pixels(
              MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height / 1.3),
            ),
            physics: StretchingSheetPhysics(
              stretchingRange: const Extent.proportional(0.050),
              parent: SnappingSheetPhysics(
                snappingBehavior: SnapToNearest(
                  snapTo: [
                    Extent.pixels(
                      MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height / 1.3),
                    ),
                    Extent.pixels(
                      MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height / 1.5),
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
                  itemCount: categories.length,
                  itemBuilder: (context, parentIndex) {
                    final VideoHomeCategoryModel category = categories[parentIndex];
                    return category.when(
                      myList: (type, title) {
                        final provider = ref.watch(playlistFutureProvider);
                        return PanelCategoryHeader(
                          index: parentIndex,
                          title: title,
                          onTapMore: () {},
                          child: provider.when(
                            data: (playlist) => PanelCategoryContents(
                              parentIndex: parentIndex,
                              contents: playlist.contents,
                              onTap: (content) {},
                            ),
                            error: (error, stackTrace) => PanelCategoryContents(parentIndex: parentIndex),
                            loading: () => PanelCategoryContents(parentIndex: parentIndex),
                          ),
                        );
                      },
                      hashtag: (type, tag, title) {
                        final provider = ref.watch(videoHashtagFutureProvider(VideoHashtagFamily(tag: tag)));
                        return PanelCategoryHeader(
                          index: parentIndex,
                          title: title,
                          onTapMore: () {},
                          child: provider.when(
                            data: (hashtag) => PanelCategoryContents(
                              parentIndex: parentIndex,
                              contents: hashtag.contents,
                              onTap: (content) {},
                            ),
                            error: (error, stackTrace) => PanelCategoryContents(parentIndex: parentIndex),
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
                          onTapMore: () {},
                          child: provider.when(
                            data: (trending) => PanelCategoryContents(
                              parentIndex: parentIndex,
                              contents: trending.data,
                              onTap: (content) {},
                            ),
                            error: (error, stackTrace) => PanelCategoryContents(parentIndex: parentIndex),
                            loading: () => PanelCategoryContents(parentIndex: parentIndex),
                          ),
                        );
                      },
                      highlight: (type, id, title, liveStream, streamingCode) {
                        final provider = ref.watch(higlightsCategoryFutureProvider(
                          HighlightCategoryFamily(categoryId: id, offset: 6),
                        ));
                        return PanelCategoryHeader(
                          index: parentIndex,
                          title: title,
                          onTapMore: () {},
                          child: provider.when(
                            data: (higlight) => PanelCategoryContents(
                              parentIndex: parentIndex,
                              contents: higlight.contents,
                              onTap: (content) {},
                            ),
                            error: (error, stackTrace) => PanelCategoryContents(parentIndex: parentIndex),
                            loading: () => PanelCategoryContents(parentIndex: parentIndex),
                          ),
                        );
                      },
                      continueWatching: (type, title) {
                        final provider = ref.watch(continueWatchingFutureProvider);
                        return PanelCategoryHeader(
                          index: parentIndex,
                          title: title,
                          onTapMore: () {},
                          child: provider.when(
                            data: (continueWatching) => PanelCategoryContents(
                              parentIndex: parentIndex,
                              contents: continueWatching.contents,
                              onTap: (content) {},
                            ),
                            error: (error, stackTrace) => PanelCategoryContents(parentIndex: parentIndex),
                            loading: () => PanelCategoryContents(parentIndex: parentIndex),
                          ),
                        );
                      },
                    );
                  },
                ),
                error: (error, stackTrace) => SizedBox.shrink(),
                loading: () => ListView.builder(
                  itemCount: dummies.length,
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
                                colors: [
                                  Color(0xFF8FB001),
                                  Color(0xFF6C8501),
                                  Color(0xFF495A01),
                                  Color(0xFF232B00),
                                  Colors.black.withOpacity(0.5),
                                  Colors.transparent,
                                ],
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
        ],
      ),
    );
  }
}
