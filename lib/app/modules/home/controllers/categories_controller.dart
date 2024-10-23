import 'package:fl_klikfilm/app/controllers/local_user_controller.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:get/get.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

class CategoriesController extends GetxController with StateMixin<List<VideoHomeCategoryModel>> {
  final sheetController = SheetController();
  final Debouncer debouncer = Debouncer();
  final isLoadingMore = false.obs;
  final canLoadMore = true.obs;
  final Rx<int> total = 0.obs;
  final Rx<int> index = 0.obs;

  void _scrollListener() {
    if ((sheetController.value ?? 0) > (sheetController.metrics.maxPixels)) {
      if (!isLoadingMore.value && canLoadMore.value) {
        isLoadingMore.value = true;
        final nextIndex = index.value + 5;
        debouncer.debounce(
          type: BehaviorType.trailingEdge,
          duration: Duration(seconds: 1),
          onDebounce: () async {
            await scroll();
            isLoadingMore.value = false;
            canLoadMore.value = total >= nextIndex;
          },
        );
      }
    }
  }

  @override
  Future<void> onInit() async {
    sheetController.addListener(_scrollListener);
    final local = Get.find<LocalUserController>();
    final videoRepository = Get.find<VideoCatalogRepository>();
    change(null, status: RxStatus.loading());

    final VideoCategoriesResponseModel result = await videoRepository.listHomeCategory();
    if (local.authentication.value.authenticationType.isGuest) {
      result.data.removeWhere((category) {
        return category.maybeWhen(
          continueWatching: (_, __) => true,
          myList: (_, __) => true,
          orElse: () => false,
        );
      });
    }
    total.value = result.data.length;
    index.value = result.data.length <= 6 ? result.data.length : 6;

    change(
      result.data,
      status: RxStatus.success(),
    );

    super.onInit();
  }

  Future<void> scroll() async {
    // final previousState = await future;
    // final nextIndex = state?.index + 5;
    // state = AsyncData(previousState.copyWith(
    //   index: previousState.total >= nextIndex ? nextIndex : previousState.total,
    // ));
    // return previousState.total >= nextIndex;
  }

  @override
  void onClose() {
    sheetController.removeListener(_scrollListener);
    super.onClose();
  }
}
