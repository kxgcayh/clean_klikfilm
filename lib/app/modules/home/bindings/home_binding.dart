import 'package:get/get.dart';

import 'package:fl_klikfilm/app/controllers/local_user_controller.dart';
import 'package:fl_klikfilm/app/modules/home/controllers/banner_controller.dart';
import 'package:fl_klikfilm/app/modules/home/controllers/continue_watching_category_controller.dart';
import 'package:fl_klikfilm/app/modules/home/controllers/hashtag_category_controller.dart';
import 'package:fl_klikfilm/app/modules/home/controllers/playlist_category_controller.dart';
import 'package:fl_klikfilm/app/modules/home/controllers/trending_category_controller.dart';

import '../controllers/categories_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContinueWatchingCategoryController>(
      () => ContinueWatchingCategoryController(),
    );
    Get.lazyPut<HashtagCategoryController>(
      () => HashtagCategoryController(),
    );
    Get.lazyPut<TrendingCategoryController>(
      () => TrendingCategoryController(),
    );
    Get.lazyPut<PlaylistCategoryController>(
      () => PlaylistCategoryController(),
    );
    // Get.lazyPut<HighlightsCategoryController>(() => HighlightsCategoryController());
    Get.lazyPut<BannerController>(() {
      final LocalUserController local = Get.find<LocalUserController>();
      return BannerController(authenticated: local.authentication.value);
    });
    Get.lazyPut<CategoriesController>(() => CategoriesController());
  }
}
