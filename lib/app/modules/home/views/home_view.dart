import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_klikfilm/app/controllers/theming_controller.dart';
import 'package:fl_klikfilm/app/data/app_colors.dart';
import 'package:fl_klikfilm/app/data/app_shimmer.dart';
import 'package:fl_klikfilm/app/modules/home/controllers/banner_controller.dart';
import 'package:fl_klikfilm/app/modules/home/controllers/categories_controller.dart';
import 'package:fl_klikfilm/app/modules/home/controllers/hashtag_category_controller.dart';
import 'package:fl_klikfilm/app/modules/home/controllers/highlights_category_controller.dart';
import 'package:fl_klikfilm/app/modules/home/controllers/playlist_category_controller.dart';
import 'package:fl_klikfilm/app/modules/home/controllers/trending_category_controller.dart';
import 'package:fl_klikfilm/app/modules/home/views/home_categories_loading_view.dart';
import 'package:fl_klikfilm/app/modules/home/views/panel_category_header_view.dart';
import 'package:fl_klikfilm/app/views/views/app_image.dart';
import 'package:fl_klikfilm/app/views/views/kf_app_bar_view.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutterlifecyclehooks/flutterlifecyclehooks.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

class HomeView extends GetView<CategoriesController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemingController>();
    return LifecycleHooksSubscriber(
      onAppLifecycleChange: (event) async {
        // final connection = ref.watch(connectityNotifier);
        // if (connection != ConnectivityResult.none && event == AppLifecycleState.resumed) {
        //   await ref.read(commonUserDataProvider.notifier).setCountryCode();
        // }
      },
      child: Scaffold(
        appBar: KfAppBar(),
        backgroundColor: HexColor(theme.data.value.general.background.color),
        extendBody: true,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            GestureDetector(
              onVerticalDragUpdate: (details) {
                // sheetController.animateTo(
                //   details.delta.dy.isNegative
                //       ? Extent.proportional(1)
                //       : Extent.pixels(
                //           MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height / 1.35)),
                // );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.52,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Get.find<BannerController>().obx(
                    (state) {
                      if (state == null) return SizedBox.shrink();
                      return AppImage(
                        width: double.infinity,
                        '${state.banner.thumbnail?.the380x543}',
                        boxFit: BoxFit.fill,
                        alignment: Alignment.topCenter,
                        onTap: () {
                          // VideoRoute(
                          //   videoId: state.banner.id,
                          //   subcategoryId: state.banner.subcategory?.id,
                          // ).push(context);
                        },
                      );
                    },
                    onError: (error) => GestureDetector(
                      onTap: () {},
                      child: AppShimmer(highlightColor: Colors.red),
                    ),
                    onLoading: AppShimmer(),
                  ),
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
              controller: controller.sheetController,
              initialPosition: SheetAnchor.pixels(
                MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height / 1.35),
              ),
              minPosition: SheetAnchor.pixels(
                MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height / 1.35),
              ),
              physics: BouncingSheetPhysics(
                parent: SnappingSheetPhysics(
                  behavior: SnapToNearest(
                    anchors: [
                      const SheetAnchor.proportional(1),
                      const SheetAnchor.proportional(0.8),
                      SheetAnchor.pixels(
                        MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height / 1.35),
                      ),
                    ],
                  ),
                ),
              ),
              child: Obx(
                () => Container(
                  decoration: BoxDecoration(
                    color: HexColor(theme.data.value.general.background.color),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(theme.data.value.pattern.bottom),
                      alignment: Alignment.centerLeft,
                      fit: context.isTablet ? BoxFit.fitHeight : BoxFit.fill,
                      repeat: context.isTablet ? ImageRepeat.repeatX : ImageRepeat.noRepeat,
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: controller.obx(
                    (categories) {
                      if (categories == null) return SizedBox.shrink();
                      return ListView.builder(
                        itemCount: controller.index.value,
                        itemBuilder: (context, parentIndex) {
                          final VideoHomeCategoryModel category = categories[parentIndex];
                          return category.when(
                            myList: (type, title) {
                              return GetBuilder<PlaylistCategoryController>(
                                tag: '$type-$title',
                                init: Get.put(PlaylistCategoryController(), tag: '$type-$title'),
                                builder: (controller) {
                                  return controller.obx(
                                    (playlist) {
                                      if (playlist != null) {
                                        return PanelCategoryHeader(
                                          index: parentIndex,
                                          title: title,
                                          onTapMore: playlist.contents.length > 3 ? () {} : null,
                                          child: PanelCategoryContents(
                                            parentIndex: parentIndex,
                                            contents: playlist.contents,
                                            onTap: (content) {
                                              // VideoRoute(
                                              //   videoId: content.id,
                                              //   subcategoryId: content.subcategory?.id,
                                              // ).push(context);
                                            },
                                          ),
                                        );
                                      }
                                      return PanelCategoryHeader(
                                        title: title,
                                        child: PanelCategoryContents(parentIndex: parentIndex),
                                      );
                                    },
                                    onError: (error) => SizedBox.shrink(),
                                    onLoading: PanelCategoryHeader(
                                      title: title,
                                      child: PanelCategoryContents(parentIndex: parentIndex),
                                    ),
                                  );
                                },
                              );
                            },
                            hashtag: (type, tag, title) {
                              return GetBuilder<HashtagCategoryController>(
                                tag: '$type-$title',
                                init: Get.put(HashtagCategoryController(), tag: '$type-$title'),
                                builder: (controller) {
                                  return PanelCategoryHeader(
                                    index: parentIndex,
                                    title: title,
                                    onTapMore: () {},
                                    child: controller.obx(
                                      (trending) {
                                        return PanelCategoryContents(
                                          parentIndex: parentIndex,
                                          contents: trending ?? [],
                                          onTap: (content) {
                                            // VideoRoute(
                                            //   videoId: content.id,
                                            //   subcategoryId: content.subcategory?.id,
                                            // ).push(context);
                                          },
                                        );
                                      },
                                      onLoading: PanelCategoryContents(parentIndex: parentIndex),
                                    ),
                                  );
                                },
                              );
                            },
                            trending: (type, title) {
                              return GetBuilder<TrendingCategoryController>(
                                tag: '$type-$title',
                                init: Get.put(TrendingCategoryController(), tag: '$type-$title'),
                                builder: (controller) {
                                  return PanelCategoryHeader(
                                    index: parentIndex,
                                    title: title,
                                    onTapMore: () {},
                                    child: controller.obx(
                                      (trending) {
                                        return PanelCategoryContents(
                                          parentIndex: parentIndex,
                                          contents: trending ?? [],
                                          onTap: (content) {
                                            // VideoRoute(
                                            //   videoId: content.id,
                                            //   subcategoryId: content.subcategory?.id,
                                            // ).push(context);
                                          },
                                        );
                                      },
                                      onLoading: PanelCategoryContents(parentIndex: parentIndex),
                                    ),
                                  );
                                },
                              );
                            },
                            highlight: (type, id, title, liveStream, streamingCode) {
                              return GetBuilder<HighlightsCategoryController>(
                                tag: '$type-$id',
                                init: Get.put(
                                  HighlightsCategoryController(categoryId: id),
                                  tag: '$type-$id',
                                ),
                                builder: (controller) {
                                  return PanelCategoryHeader(
                                    index: parentIndex,
                                    title: title,
                                    onTapMore: () {},
                                    child: controller.obx(
                                      (highlight) {
                                        return PanelCategoryContents(
                                          parentIndex: parentIndex,
                                          contents: highlight?.contents ?? [],
                                          onTap: (content) {
                                            // VideoRoute(
                                            //   videoId: content.id,
                                            //   subcategoryId: content.subcategory?.id,
                                            // ).push(context);
                                          },
                                        );
                                      },
                                      onLoading: PanelCategoryContents(parentIndex: parentIndex),
                                    ),
                                  );
                                },
                              );
                            },
                            continueWatching: (type, title) {
                              return PanelCategoryHeader(
                                title: title,
                                index: parentIndex,
                                child: PanelCategoryContents(parentIndex: parentIndex),
                              );
                              // final provider = ref.watch(continueWatchingProvider);
                              // return provider.when(
                              //   data: (continueWatching) {
                              //     return continueWatching.data.isNotEmpty
                              //         ? PanelCategoryHeader(
                              //             index: parentIndex,
                              //             title: title,
                              //             onTapMore: continueWatching.data.length > 3
                              //                 ? () {
                              //                     klog.i('onTapMore: $type');
                              //                   }
                              //                 : null,
                              //             child: PanelCategoryContents(
                              //               parentIndex: parentIndex,
                              //               contents: continueWatching.data,
                              //               onTap: (content) {
                              //                 VideoRoute(
                              //                   videoId: content.id,
                              //                   subcategoryId: content.subcategory?.id,
                              //                 ).push(context);
                              //               },
                              //             ),
                              //           )
                              //         : SizedBox.shrink();
                              //   },
                              //   error: (error, stackTrace) => SizedBox.shrink(),
                              //   loading: () => PanelCategoryHeader(
                              //     title: title,
                              //     child: PanelCategoryContents(parentIndex: parentIndex),
                              //   ),
                              // );
                            },
                          );
                        },
                      );
                    },
                    onError: (error) => SizedBox.shrink(),
                    onLoading: HomeCategoriesLoadingView(),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: controller.isLoadingMore.value,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primaryGrey.withOpacity(0.85),
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
